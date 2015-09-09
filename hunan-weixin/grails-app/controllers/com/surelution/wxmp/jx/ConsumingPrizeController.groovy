package com.surelution.wxmp.jx

import grails.util.Holders

import java.text.SimpleDateFormat

import com.surelution.whistle.core.Auth2Util
import com.surelution.whistle.core.Auth2Util.AuthScope
import com.surelution.wxmp.jx.Voucher.VoucherStatus

class ConsumingPrizeController {
	
	private static long ENDED_AT = 1425571199000l;
	
	def drawPrizeService
	def voucherPaymentService

    def choseTicket() {
		if(System.currentTimeMillis() > ENDED_AT) {
			redirect(url:KeyedMessage.findByKey("CONSUMING-PRIZE-EXPIRED-PAGE").message)
			return
		}
		def code = params.code
		def openId = Auth2Util.getOpenidByCode(code)
		[openId:openId]
	}

	def showCard(String id) {
		def subscriber = Subscriber.findByOpenId(id)
		def subscriberCard = SubscriberCard.findBySubscriber(subscriber)
		if(!subscriberCard) {
			subscriberCard = new SubscriberCard()
			subscriberCard.subscriber = subscriber
		}
		[subscriberCard:subscriberCard]
	}

	def saveCard(String id) {
		def cardNo = params.cardNo
		boolean validCardNo = true
		if(!cardNo) {
			validCardNo = false
			flash.message = "加油卡不能为空"
		} else {
//			def cardRegexp = '9[01]3007\\d{10}$'
			def km = KeyedMessage.findByKey("cars-card-no-reg-exp")
			def cardRegexp = km?.message?km.message:'9[01]3007\\d{10}$'
			validCardNo = (cardNo ==~ cardRegexp)
			flash.message = "您的加油卡必须是在中国石油湖南销售分公司办理的，请输入合法的加油卡账号"
		}
		
		if(!validCardNo) {
			redirect(action:'showCard', id:id)
			return
		}
		
		def subscriber = Subscriber.findByOpenId(id)
		def subscriberCard = SubscriberCard.findBySubscriber(subscriber)
		if(subscriberCard) {
			render(view:'loss')
			return
		}
		subscriberCard = new SubscriberCard()
		subscriberCard.subscriber = subscriber
		subscriberCard.cardNo = cardNo
		subscriberCard.save(flush:true)

		def voucher
		def ticket = DrawPrizeTicket.findBySubscriber(subscriber)
		if(!ticket) {
			ticket = new SubscriberCardDrawPrizeTicket()
			ticket.subscriber = subscriber
			ticket.card = subscriberCard
			ticket.drawAt = new Date()
			ticket.save(flush:true)
			voucher = drawPrizeService.draw(ticket)
		}
		if(voucher) {
			render(view:'win', model:[ticket:ticket, voucher:voucher])
			return
		}
		render(view:'loss')
	}

	def showInvoice(String id) {
		def subscriber = Subscriber.findByOpenId(id)
		def subscriberInvoice = SubscriberInvoice.findBySubscriber(subscriber)
		if(!subscriberInvoice) {
			subscriberInvoice = new SubscriberInvoice()
			subscriberInvoice.subscriber = subscriber
		}
		[subscriberInvoice:subscriberInvoice]
	}

	def saveInvoice(String id) {
		def invoiceNo = params.invoiceNo
		def invoiceCode = params.invoiceCode
		if(!invoiceNo || !invoiceCode) {
			flash.message = "发票代码和发票号码都不能为空"
			redirect(action:'showInvoice', id:id)
			return
		}
		if(!(invoiceNo ==~ '^\\d{8}$')) {
			flash.message = "发票号码必须为8位数字"
			redirect(action:'showInvoice', id:id)
			return
		}
		if(!(invoiceCode ==~ '^\\d{12}$')) {
			flash.message = "发票代码必须为12位数字"
			redirect(action:'showInvoice', id:id)
			return
		}
		
		def subscriber = Subscriber.findByOpenId(id)
		def subscriberInvoice = SubscriberInvoice.findBySubscriber(subscriber)
		if(subscriberInvoice) {
			render(view:'loss')
			return
		}
		subscriberInvoice = new SubscriberInvoice()
		subscriberInvoice.subscriber = subscriber
		subscriberInvoice.invoiceNo = invoiceNo
		subscriberInvoice.invoiceCode = invoiceCode
		subscriberInvoice.save(flush:true)

		def ticket = DrawPrizeTicket.findBySubscriber(subscriber)
		if(!ticket) {
			ticket = new SubscriberInvoiceDrawPrizeTicket()
			ticket.subscriber = subscriber
			ticket.invoice = subscriberInvoice
			ticket.drawAt = new Date()
			ticket.save(flush:true)
		}
		def voucher = drawPrizeService.draw(ticket)
		if(voucher) {
			render(view:'win', model:[ticket:ticket, voucher:voucher])
			return
		}
		render(view:'loss')
	}
	
	def showReceipt(String id) {
		def subscriber = Subscriber.findByOpenId(id)
		def subscriberReceipt = SubscriberReceipt.findBySubscriber(subscriber)
		if(!subscriberReceipt) {
			subscriberReceipt = new SubscriberReceipt()
			subscriberReceipt.subscriber = subscriber
		}
		[subscriberReceipt:subscriberReceipt]
	}
	
	def saveReceipt(String id) {
		def receiptNo = params.receiptNo
		def stationName = params.stationName
		if(!receiptNo || !stationName) {
			flash.message = "站名和交易号都不能为空"
			redirect(action:'showReceipt', id:id)
			return
		}
		
		def subscriber = Subscriber.findByOpenId(id)
		def subscriberReceipt = SubscriberReceipt.findBySubscriber(subscriber)
		if(subscriberReceipt) {
			render(view:'loss')
			return
		}
		subscriberReceipt = new SubscriberReceipt()
		subscriberReceipt.subscriber = subscriber
		subscriberReceipt.receiptNo = receiptNo
		subscriberReceipt.stationName = stationName
		subscriberReceipt.save(flush:true)

		def ticket = DrawPrizeTicket.findBySubscriber(subscriber)
		if(!ticket) {
			ticket = new SubscriberReceiptDrawPrizeTicket()
			ticket.subscriber = subscriber
			ticket.receipt = subscriberReceipt
			ticket.drawAt = new Date()
			ticket.save(flush:true)
		}
		def voucher = drawPrizeService.draw(ticket)
		if(voucher) {
			render(view:'win', model:[ticket:ticket, voucher:voucher])
			return
		}
		render(view:'loss')
	}

	def showVoucher(String id) {
		def subscriber = Subscriber.findByOpenId(id)
		def voucher = RegisterVoucher.findByOwnerAndStatusAndEnabled(subscriber, VoucherStatus.ACTIVED, true)
		[voucher:voucher, subscriber:subscriber]
	}

	def showInvitation(String id) {
		def subscriber = Subscriber.findByOpenId(id)
		def canPlay = DealInvitation.countByHost(subscriber) > 0 && !SubscriberInvitationDrawPrizeTicket.findAllBySubscriber(subscriber)
		def ticket = SubscriberInvitationDrawPrizeTicket.findAllBySubscriber(subscriber)
		[canPlay:canPlay, subscriber:subscriber]
	}
	
	def saveInvitation(String id) {
		def subscriber = Subscriber.findByOpenId(id)
		
		boolean valid = true
		def ticket = SubscriberInvitationDrawPrizeTicket.findAllBySubscriber(subscriber)
		if(ticket) {
			flash.message = "根据推荐用户抽奖，只能抽取一次，您已经抽取过了"
			valid = false
		}
		if(DealInvitation.countByHost(subscriber) < 2 ) {
			flash.message = "需要成功推荐两名以上的客户关注才可以参与此项抽奖"
			valid = false
		}
		
		if(!valid) {
			redirect(action:'showInvitation', id:id)
			return
		}
		
		ticket = new SubscriberInvitationDrawPrizeTicket()
		ticket.drawAt = new Date()
		ticket.subscriber = subscriber
		ticket.save(flush:true)
		println ticket.errors

		def voucher = drawPrizeService.draw(ticket)
		if(voucher) {
			render(view:'win', model:[ticket:ticket, voucher:voucher])
			return
		}
		render(view:'loss')
	}

	def saveVoucher(String id) {
		def subscriber = Subscriber.findByOpenId(id)
		def voucherId = params.voucherId
		RegisterVoucher voucher
		def illegal = true
		if(voucherId) {
			voucher = RegisterVoucher.get(voucherId)
			if(voucher?.owner?.id == subscriber.id) {
				illegal = false
			}
		}
		if(illegal) {
			flash.message = "系统错误"
			redirect(action:'showVoucher', id:id)
			return
		}

		def payment = new SelfhelpVoucherPayment()
		payment.remark = "抽奖"
		voucherPaymentService.payment(voucher, payment)

		def ticket = DrawPrizeTicket.findBySubscriber(subscriber)
		if(!ticket) {
			ticket = new SubscriberRegisterVoucherDrawPrizeTicket()
			ticket.subscriber = subscriber
			ticket.voucher = voucher
			ticket.drawAt = new Date()
			ticket.save(flush:true)
		}
		def voucher2 = drawPrizeService.draw(ticket)
		if(voucher2) {
			render(view:'win', model:[ticket:ticket, voucher:voucher2])
			return
		}
		render(view:'loss')
	}
	
	def openDayPrize() {
		def startAt = AppVar.findByKey("2015-open-day-draw-start-at").value as Long
		def endAt = AppVar.findByKey("2015-open-day-draw-end-at").value as Long
		def now = System.currentTimeMillis()
//		if(now < startAt) {
//			def sdf = new SimpleDateFormat("yyyy年MM月dd日HH点mm分")
//			def dest = Auth2Util.buildRedirectUrl("http://${Holders.config.app.web.path}/consumingPrize/openDayPrize", "", AuthScope.BASE)
//			
//			def message = "活动尚未开始，请在${sdf.format(new Date(startAt))}至${sdf.format(new Date(endAt))}间参与活动。触摸宝箱刷新"
//			
//			return [furtherStep:false, message:message, forkUrl:dest]
//		}

		def subscribed = true, involvedInConsuming = true
		def code = params.code
//		def openId = Auth2Util.getOpenidByCode(code)
		def openId = "oqV4Pt3uYX5BCaYX5e6WRLAPuwZs"
		def subscriber = Subscriber.findByOpenId(openId)
		
		def myVoucherUrl = Auth2Util.buildRedirectUrl("http://${Holders.config.app.web.path}/wxPortal/myVouchers", "", AuthScope.BASE)
		def ticket2 = OpenDayDrawPrizeTicket.findBySubscriber(subscriber)
		if(ticket2?.drawn) {
			def message
			def voucher = DrawPrizeVoucher.findByTicket(ticket2)
			if(voucher) {
				message = "您已经参与抽奖，奖品是${voucher.batch.name}，触摸宝箱前往查看红包信息"
				return [furtherStep:false, message:message, forkUrl:myVoucherUrl]
			} else {
				message = "您已经参与抽奖，但没抽中，不能再参与了"
				return [furtherStep:false, message:message]
			}
		}

//		if(now > endAt) {
//			def sdf = new SimpleDateFormat("yyyy年MM月dd日HH点mm分")
//			def message = "活动已于${sdf.format(new Date(endAt))}结束，下次请早哦"
//			return [furtherStep:false, message:message]
//		}

		if(!subscriber) {
			def message = "请先触摸宝箱，关注我们的账号，才可以参与抽奖"
			return [furtherStep:false, message:message, forkUrl:KeyedMessage.findByKey("subscribing-guide-url").message]
		}

		def ticket1 = DrawPrizeTicket.countBySubscriber(subscriber)
		if(!ticket1) {
			def step1Url = Auth2Util.buildRedirectUrl("http://${Holders.config.app.web.path}/consumingPrize/choseTicket", "", AuthScope.BASE)
			def message = "本项抽奖，面向所有参与了“加油赢红包”的客户，如果您尚未参与“加油赢红包”活动，请先触摸宝箱参与“加油赢红包”活动，才可参与本项活动"
			return [furtherStep:false, message:message, forkUrl:step1Url]
		}
		if(!ticket2) {
			ticket2 = new OpenDayDrawPrizeTicket()
			ticket2.subscriber = subscriber
			ticket2.drawn = false
			ticket2.drawAt = new Date()
			ticket2.save(flush:true)
		}

		[furtherStep:true, ticket:ticket2, myVoucherUrl:myVoucherUrl]
	}

	def drawOpenDayPrize(String id) {
		def ticket = OpenDayDrawPrizeTicket.findByRefusingCode(id)
		def voucher
		if(ticket) {
			voucher = drawPrizeService.openDayDraw(ticket)
			if(voucher) { //抽中
				render(contentType: "application/json") {
					[errCode:0, status:true, voucher:voucher.fullSn, voucherInfo:voucher.batch.name + "，价值${voucher.batch.amount}"]
				}
			} else { //没抽中
				render(contentType: "application/json") {
					[errCode:0, status:false, voucher:""]
				}
			}
		} else {
			render(contentType: "application/json") {
				[errCode:1,errMsg:"系统错误", status:false, voucher:""]
			}
		}
	}
}
