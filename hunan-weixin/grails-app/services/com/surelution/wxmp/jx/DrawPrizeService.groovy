package com.surelution.wxmp.jx

import com.surelution.wxmp.jx.Voucher.VoucherStatus;

import groovy.time.TimeCategory;

class DrawPrizeService {
	
	private final static Date PAID_END_AT = new Date(1427706000000l) //2015年3月30日17：00
	private final static String EVENT_NAME = "2015spring"

	/**
	 * TODO
	 * fuck, complicated! be careful
	 * @param ticket
	 * @return
	 */
    def draw(DrawPrizeTicket ticket) {
		if(DrawPrizeVoucher.countByTicket(ticket) > 0) {
			return null
		}
		def maxPlayer = AppVar.findByKey("2015-draw-prize-max-player-daily").value as Integer
		def lastDay = AppVar.findByKey("2015-draw-prize-last-day-count").value as Integer
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
				def c = DrawPrizeVoucher.countByBatchAndDateCreatedBetween(batch, firstSignt, firstSigntNextDay)
				if(c < batch.countDaily) {
					voucher = saveVoucher(ticket, batch)
				}
				return
			}
		}

		voucher
    }
	
	def openDayDraw(OpenDayDrawPrizeTicket ticket) {
		//查找用户是否抽中奖品，此处是否为空不足以说明是否曾经抽过奖。比如，用户参与抽奖，但是没有中奖
		def voucher = DrawPrizeVoucher.findByTicket(ticket)
		if(ticket.drawn) {//此处表示是否参与过抽奖。如果参与过抽奖，则将voucher（可以为空）返回
			return voucher
		}
		if(voucher) { //或许在上次抽奖中，系统故障，没有记录drawn这个状态，回补该状态
			ticket.drawn = true
			ticket.save(flush:true)
			return voucher
		}

		def batches = VoucherBatch.findAllByEventName("2015-open-day")
		batches.sort() {
			it.priority
		}
		ticket.generateSn()
		
//		def batch = VoucherBatch.get(2)
//		voucher = saveVoucher(ticket, batch)
		
		def factor = ticket.sn.id
		batches.each {batch->
			def luckyNum = batch.luckyNum
			String[] _nums = luckyNum.split(",")
			def nums = _nums.collect() {n->
				n as long
			}
			if(nums.contains(factor)) {
				def c = DrawPrizeVoucher.countByBatch(batch)
				if(c < batch.countDaily) {
					voucher = saveVoucher(ticket, batch)
				}
			}
		}
		ticket.drawn = true
		ticket.save(flush:true)
		voucher
	}

	private DrawPrizeVoucher saveVoucher(DrawPrizeTicket ticket, VoucherBatch batch) {
		def voucher = new DrawPrizeVoucher()
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
