package com.surelution.wxmp.jx

import grails.util.Holders

import com.surelution.whistle.core.Auth2Util
import com.surelution.whistle.core.Auth2Util.AuthScope
import com.surelution.wxmp.jx.LateSpring2015ReceiptFuelCharging.FuelType
import com.surelution.wxmp.jx.vo.ComplexDate

class LateSpring2015Controller {

	private static Long ENDED_AT = 1433001599000
	
	def lateSpring2015Service

    def index() {
		if(System.currentTimeMillis() >= ENDED_AT) {
			redirect(url:KeyedMessage.findByKey("LATE-SPRING-2015-EVENT-EXPIRED-PAGE").message)
			return
		}
		def code = params.code
		def openId = Auth2Util.getOpenidByCode(code)
//		def openId = "oqV4Pt8X84__tk5aYW30WlvKHovw"
		[openId:openId]
	}

	def dieselCharging(String id) {
		def subscriber = Subscriber.findByOpenId(id)
		def charging = new LateSpring2015ReceiptFuelCharging()
		charging.type = FuelType.DIESEL
		charging.subscriber = subscriber
		render(view:'showCharging', model:[charging:charging])
	}

	def gasCharging(String id) {
		def subscriber = Subscriber.findByOpenId(id)
		def charging = new LateSpring2015ReceiptFuelCharging()
		charging.type = FuelType.GAS
		charging.subscriber = subscriber
		render(view:'showCharging', model:[charging:charging])
	}
	
	def openCard(String id) {
		def subscriber = Subscriber.findByOpenId(id)
		def card = new LateSpring2015ReceiptCard()
		card.subscriber = subscriber
		render(view:'showOpenCard', model:[card:card])
	}
	
	def cardRecharging(String id) {
		def subscriber = Subscriber.findByOpenId(id)
		def recharging = new LateSpring2015ReceiptCardRecharging()
		recharging.subscriber = subscriber
		render(view:'showCardRecharging', model:[recharging:recharging])
	}
	
	def saveCardRecharging(String id) {
		String transNo = params.transNo
		String cardNo = params.cardNo
		Float amount = params.float('amount')
		if(id) {
			def subscriber = Subscriber.findByOpenId(id)
			boolean validCardNo = (cardNo ==~ '9[01]3007\\d{10}$')
			if(subscriber && validCardNo && amount && transNo) {
				def cd = new ComplexDate(new Date())
				def used = LateSpring2015ReceiptCardRecharging.countByTransNo(transNo)
				if(used < 3 && LateSpring2015ReceiptCardRecharging.countBySubscriberAndDateCreatedBetween(subscriber, cd.firstSight, cd.firstSightNextDay) <= 0) {
					def recharging = new LateSpring2015ReceiptCardRecharging()
					recharging.subscriber = subscriber
					recharging.transNo = transNo
					recharging.cardNo = cardNo
					recharging.amount = amount
					recharging.save(flush:true)

					Integer drawTimes = 0
					if(recharging.cardNo.startsWith("90")) {
						if(amount >= 1000 && amount < 2000) {
							drawTimes = 1
						} else if(amount < 3000) {
							drawTimes = 2
						} else if(amount < 5000) {
							drawTimes = 3
						} else if(amount >= 5000) {
							drawTimes = 5
						}
					} else if(recharging.cardNo.startsWith("91")) {
						if(amount >= 50000 && amount < 100000) {
							drawTimes = 5
						} else if(amount >= 100000) {
							drawTimes = 10
						}
					}
					if(isHoliday(System.currentTimeMillis())) {
						drawTimes = drawTimes * 2
					}
					drawTimes.times {
						def ticket = new LateSpring2015CardRechargingDrawPrizeTicket()
						ticket.lreceipt = recharging
						ticket.subscriber = subscriber
						ticket.save(flush:true)
					}

					def url = Auth2Util.buildRedirectUrl("http://${Holders.config.app.web.path}/lateSpring2015/showTicket", null, AuthScope.BASE)
					redirect(url:url)
					return
				} else if(used >= 3) {
					flash.message = "这个交易流水号已被其他人抽奖，如有问题，请联系站内工作人员"
				} else {
					flash.message = "IC卡充值每天只能抽奖一次"
				}
			}

			if(!validCardNo) {
				flash.message = "请输入正确的卡号"
			} else if(!amount) {
				flash.message = "请输入正确的金额"
			} else if(!transNo) {
				flash.message = "请输入正确的交易流水号"
			}
		}
		render(view:'saveError')
	}

	def saveOpenCard(String id) {
		def cardNo = params.cardNo
		def transNo = params.transNo
		if(id) {
			def subscriber = Subscriber.findByOpenId(id)
			boolean validCardNo = (cardNo ==~ '9[01]3007\\d{10}$')
			if(subscriber && validCardNo && transNo) {
				def cd = new ComplexDate(new Date())
				def used = LateSpring2015ReceiptCard.countByTransNo(transNo)
				if(LateSpring2015ReceiptCard.countBySubscriberAndDateCreatedBetween(subscriber, cd.firstSight, cd.firstSightNextDay) > 0) {
					flash.message = "IC卡开卡每天只能进行一次抽奖"
				} else if(used >= 3){
					//卡号已被录入
					flash.message = "这个业务流水号已被其他人抽奖，如有问题，请联系站内工作人员"
				} else {
					def card = new LateSpring2015ReceiptCard()
					card.subscriber = subscriber
					card.cardNo = cardNo
					card.transNo = transNo
					card.save(flush:true)
					
					int drawTimes = 1
					if(isHoliday(System.currentTimeMillis())) {
						drawTimes = 2
					}
					drawTimes.times {
						def ticket = new LateSpring2015OpenCardDrawPrizeTicket()
						ticket.lreceipt = card
						ticket.subscriber = subscriber
						ticket.save(flush:true)
					}

					def url = Auth2Util.buildRedirectUrl("http://${Holders.config.app.web.path}/lateSpring2015/showTicket", null, AuthScope.BASE)
					redirect(url:url)
					return
				}
			}
			
			if(!validCardNo) {
				flash.message = "请输入正确的卡号"
			} else if(!transNo) {
				flash.message = "请输入正确的业务流水号"
			}
		}
		render(view:'saveError')
	}

	def saveCharging(String id) {
		def stationName = params.stationName
		def receiptNo = params.receiptNo
		def sType = params.type
		def amount = params.float('amount')
		def type = FuelType.valueOf(sType)
		if(id) {
			def subscriber = Subscriber.findByOpenId(id)
			if(subscriber && stationName && receiptNo && type && amount && 
				((type == FuelType.GAS && amount <= 500) || (type == FuelType.DIESEL && amount <= 5000))) {
				receiptNo = receiptNo.trim()
				def cd = new ComplexDate(new Date())
				def used = LateSpring2015ReceiptFuelCharging.countByTransNo(receiptNo)
				if(LateSpring2015ReceiptFuelCharging.countBySubscriberAndDateCreatedBetween(subscriber, cd.firstSight, cd.firstSightNextDay) > 0) {
					flash.message = "汽油（或柴油）消费每天只能参与一次抽奖"
				} else if(used >= 3) {
					//号码已经被录入
					flash.message = "这个交易号已被其他人抽奖，如有问题，请联系站内工作人员"
				} else {
					def charging = new LateSpring2015ReceiptFuelCharging()
					charging.subscriber = subscriber
					charging.stationName = stationName
					charging.transNo = receiptNo
					charging.type = type
					charging.amount = amount
					charging.save(flush:true)
					
					if(!charging.hasErrors()) {
						Integer drawTimes = 0
						if(FuelType.DIESEL == type) {
							drawTimes = amount / 500
						} else if(FuelType.GAS == type) {
							drawTimes = amount / 200
						}
						
						if(isHoliday(System.currentTimeMillis())) {
							drawTimes = drawTimes * 2
						}

						drawTimes.times {
							def ticket = new LateSpring2015ChargingDrawPrizeTicket()
							ticket.lreceipt = charging
							ticket.subscriber = subscriber
							ticket.save(flush:true)
						}
	
						//抽奖
						def url = Auth2Util.buildRedirectUrl("http://${Holders.config.app.web.path}/lateSpring2015/showTicket", null, AuthScope.BASE)
						redirect(url:url)
						return
					}
				}
			}

			if(!receiptNo) {
				flash.message = "请输入正确的交易号"
			} else if(!((type == FuelType.GAS && amount <= 500) || (type == FuelType.DIESEL && amount <= 5000))) {
				flash.message = "请输入正确的金额"
			} else if(!stationName) {
				flash.message = "请输入正确的加油站"
			}
		}
		render(view:'saveError')
	}
	
	def showTicket() {
		def code = params.code
		def openId = Auth2Util.getOpenidByCode(code)
		def subscriber = Subscriber.findByOpenId(openId)
		def tickets = LateSpring2015DrawPrizeTicket.createCriteria().list() {
			eq('subscriber', subscriber)
			order('dateCreated', 'desc')
		}
		[tickets:tickets]
	}

	def draw() {
		def code = params.code
		def openId = Auth2Util.getOpenidByCode(code)
		def subscriber = Subscriber.findByOpenId(openId)
		if(subscriber) {
			def ticketId = params.int('state')
			def ticket = LateSpring2015DrawPrizeTicket.get(ticketId)
			if(ticket != null && ticket.drawAt == null) {
				if(ticket.subscriber.id == subscriber.id) {
					def voucher = lateSpring2015Service.draw(ticket)
					if(voucher) {
						render(view:'win', model:[voucher:voucher])
						return
					} else {
						render(view:'loss')
						return
					}
				}
			}
		}
		render(view:'drawError')
	}

	private boolean isHoliday(long now) {
		long[][] ranges = [[1428076800000,1428336000000],//20150404-20150407
			[1428681600000,1428854400000],//20150411-20150413
			[1429286400000,1429459200000],//20150418-20150420
			[1429891200000,1430064000000],//20150425-20150427
			[1430409600000,1430668800000],//20150501-20150504
			[1431100800000,1431273600000],//20150509-20150511
			[1431705600000,1431878400000],//20150516-20150518
			[1432310400000,1432483200000],//20150523-20150525
			[1432915200000,1433088000000],//20150530-20150601
			]
		for(def range : ranges) {
			if(now >= range[0] && now < range[1]) {
				return true
			}
		}
		return false
	}
}
