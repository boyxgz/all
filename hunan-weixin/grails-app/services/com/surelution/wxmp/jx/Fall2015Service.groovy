package com.surelution.wxmp.jx

import groovy.time.TimeCategory

import com.surelution.wxmp.jx.Fall2015Voucher.ReviewStatus
import com.surelution.wxmp.jx.Voucher.VoucherStatus

class Fall2015Service {
	
	private final static Date PAID_END_AT = new Date(1435654800000l) //2015年6月30日17：00
	private final static String EVENT_NAME = "2015-fall-"

	def draw(Fall2015DrawPrizeTicket ticket) {
		ticket.drawAt = new Date()
		ticket.save(flush:true)
		if(Fall2015Voucher.countByTicket(ticket) > 0) {
			return null
		}
		def rule = ticket.freceipt.rule
		
		def maxPlayer = AppVar.findByKey("fall-2015-${rule.id}-draw-prize-max-player-daily")?.value as Integer
		def lastDay = AppVar.findByKey("fall-2015-${rule.id}-draw-prize-last-day-count")?.value as Integer
		if(!maxPlayer) {
			maxPlayer = 100
		}
		if(!lastDay) {
			lastDay = 0
		}
		def now = new Date()
		def firstSignt = now.clearTime()
		def firstSigntNextDay = new Date(firstSignt.time)
		use(TimeCategory) {
			firstSigntNextDay = firstSigntNextDay + 1.day
		}

		def batches = VoucherBatch.findAllByEventName(EVENT_NAME + rule.id)
		batches.sort() {
			it.priority
		}
		def sn = ticket.freceipt.receiptIndex
		def voucher
		batches.each {batch->
			def luckyNum = batch.luckyNum
			String[] _nums = luckyNum.split(",")
			def nums = _nums.collect() {n->
				n as int
			}
			int factor = (sn -lastDay) % maxPlayer
			if(nums.contains(factor)) {
				def c = Fall2015Voucher.countByBatchAndDateCreatedBetween(batch, firstSignt, firstSigntNextDay)
				if(c < batch.countDaily) {
					voucher = saveVoucher(ticket, batch)
				}
				return
			}
		}

		voucher
	}

	private Fall2015Voucher saveVoucher(DrawPrizeTicket ticket, VoucherBatch batch) {
		Fall2015Voucher voucher = new Fall2015Voucher()
		voucher.owner = ticket.subscriber
		voucher.batch = batch
		voucher.ticket = ticket
		voucher.amount = batch.amount
		voucher.status = VoucherStatus.ACTIVED
		voucher.enabled = true
		voucher.availableBeginAt = new Date()
		voucher.availableEndAt = PAID_END_AT
		voucher.reviewStatus = ReviewStatus.WAITING_ADDRESS
		voucher.save(flush:true)
		voucher
	}
}
