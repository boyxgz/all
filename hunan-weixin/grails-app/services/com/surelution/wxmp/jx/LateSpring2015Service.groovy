package com.surelution.wxmp.jx

import groovy.time.TimeCategory

import com.surelution.wxmp.jx.Voucher.VoucherStatus

class LateSpring2015Service {
	
	private final static Date PAID_END_AT = new Date(1435654800000l) //2015年6月30日17：00
	private final static String EVENT_NAME = "2015-late-spring"
	
	def draw(DrawPrizeTicket ticket) {
		ticket.drawAt = new Date()
		ticket.save(flush:true)
		if(LateSpring2015DrawPrizeVoucher.countByTicket(ticket) > 0) {
			return null
		}
		def maxPlayer = AppVar.findByKey("2015-spring-late-draw-prize-max-player-daily").value as Integer
		def lastDay = AppVar.findByKey("2015-spring-late-draw-prize-last-day-count").value as Integer
		def now = new Date()
		def firstSignt = now.clearTime()
		def firstSigntNextDay = new Date(firstSignt.time)
		use(TimeCategory) {
			firstSigntNextDay = firstSigntNextDay + 1.day
		}

		def batches = VoucherBatch.findAllByEventName(EVENT_NAME)
		batches.sort() {
			it.priority
		}
		def sn = ticket.id
		def voucher
		batches.each {batch->
			def luckyNum = batch.luckyNum
			String[] _nums = luckyNum.split(",")
			def nums = _nums.collect() {n->
				n as int
			}
			int factor = (sn -lastDay) % maxPlayer
			if(nums.contains(factor)) {
				def c = LateSpring2015DrawPrizeVoucher.countByBatchAndDateCreatedBetween(batch, firstSignt, firstSigntNextDay)
				if(c < batch.countDaily) {
					voucher = saveVoucher(ticket, batch)
				}
				return
			}
		}

		voucher
	}

	private LateSpring2015DrawPrizeVoucher saveVoucher(DrawPrizeTicket ticket, VoucherBatch batch) {
		def voucher = new LateSpring2015DrawPrizeVoucher()
		voucher.owner = ticket.subscriber
		voucher.batch = batch
		voucher.ticket = ticket
		voucher.amount = batch.amount
		voucher.status = VoucherStatus.ACTIVED
		voucher.enabled = true
		voucher.availableBeginAt = new Date()
		voucher.availableEndAt = PAID_END_AT
		voucher.save(flush:true)
		voucher
	}
}
