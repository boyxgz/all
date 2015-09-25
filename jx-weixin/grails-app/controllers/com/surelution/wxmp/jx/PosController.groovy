package com.surelution.wxmp.jx

import java.text.SimpleDateFormat

import com.surelution.whistle.core.TextCustomerServiceMessage
import com.surelution.whistle.push.UserInfo
import com.surelution.whistle.push.qrcode.QrCode

class PosController {
	
	//temp qr from this number
	private static int MIN_USER_REGISTER_KEY = 100000

	def springSecurityService

	def posPaymentService

//    def index() {
//		def targetPosId = params.targetPosId
//		if(!targetPosId && session["CURRENT_POS_LOGGING"]) {
//			return
//		}
//		def user = springSecurityService.currentUser
//		def userPoses = UserPos.findAllByUser(user)
//		if(!userPoses || userPoses.size() == 0) {
//			//no entry
//			return
//		}
//		if(userPoses.size() > 1 && !targetPosId) {
//			//select pos
//			return
//		}
//		
//		def targetPos
//		if(userPoses.size() == 1) {
//			targetPos = userPoses[0].pos
//		} else {
//			if(!userPoses.collect() {it.pos.id.toString()}.contains(targetPosId)) {
//				//no entry
//				return
//			}
//			targetPos = Pos.get(targetPos)
//		}
//		def posLogging = new PosLogging()
//		posLogging.user = user
//		posLogging.pos = targetPos
//		posLogging.save(flush:true)
//		posLogging.discard()
//		session["CURRENT_POS_LOGGING"] = posLogging
//	}
	
	def loadQr(Long id) {
		def qrStream = QrCode.getTempQr(id, 30 * 60 * 1000)
		response.contentType = "application/x-jpg"
		response.getOutputStream() << qrStream
	}
	
	def currentClient(Long id) {
		def posLogging = session["CURRENT_POS_LOGGING"]
		if(!posLogging) {
			return
		}
		def tempPayment = TempPayment.get(id)
		def status = 1
		def subscriber = tempPayment?.subscriber
		if(tempPayment.status == TempPayment.PaymentStatus.CANCELED) {
			status = 0
		}
		def nickName
		if(subscriber?.openId) {
			def clientInfo = UserInfo.loadUserInfo(subscriber.openId)
			nickName = clientInfo.nickname
		}
		render(contentType: "application/json") {
			client(status:status, openId:subscriber?.openId,tempPaymentId:tempPayment?.id, nickName:nickName, subscriberId:subscriber?.id)
		}
	}
	
	def sendPayToken() {
		def posLogging = session["CURRENT_POS_LOGGING"]
		if(!posLogging) {
			return
		}
		def amount = params.amount as Integer
		def operator = springSecurityService.currentUser
		
		def p = new TempPayment()
		p.amount = amount
		p.user = operator
		p.pos = posLogging.pos
		p.status = TempPayment.PaymentStatus.CREATED
		p.save(flush:true)
		
		def pId = p.id
		def qrSn = MIN_USER_REGISTER_KEY + pId

		render(contentType: "application/json") {
			payment(status:1, tempPaymentId:pId, qrSn:qrSn)
		}
	}
	
	def checkout() {
		def payToken = params.payToken
		def tempPaymentId = params.tempPaymentId
		def p = TempPayment.get(tempPaymentId)
		if(payToken == p.payToken) {
			try {
				def posLogging = session["CURRENT_POS_LOGGING"]
				def pos = posLogging.pos
				posPaymentService.confirmPayment(p, springSecurityService.currentUser, pos, payToken, "")
				
				def subscriber = p.subscriber
				def balance = SubscriberBalance.findBySubscriber(subscriber)
				
				flash.message = "结账成功，入账U豆${p.amount}颗"
				
				def msg = new TextCustomerServiceMessage()
				msg.content = "您刚刚消费U豆${p.amount}颗，还有U豆${balance.amount}颗，如有疑问，请联系小U。中国石油嘉兴公司恭祝您生活愉快！"
				msg.touser = subscriber.openId
				msg.send()
			} catch(LowBalanceException e) {
				flash.message = "客户U豆不足"
			}
		} else {
			flash.message = "授权码错误，请重新操作"
		}
		redirect(action:'index2')
	}
	
	def demo() {
//		def batch = VoucherBatch.get(1)
//		def sub = Subscriber.get(1)
//		def voucher = new Voucher()
//		voucher.batch = batch
//		voucher.subscriber = sub
//		voucher.status = Voucher.VoucherStatus.ACTIVED
//		voucher.save(flush:true)
		
		def voucher = Voucher.get(3)
		def cashier = User.get(2)
		voucher.cashier = cashier
		voucher.paidAt = new Date()
		voucher.status = Voucher.VoucherStatus.PAID
		voucher.save(flush:true)
	}
	
	def index() {
		def sn = params.sn
		if(sn) {
			def voucher = Voucher.findBySn(sn)
			if(voucher) {
				if(voucher.status == Voucher.VoucherStatus.ACTIVED) {
					redirect(action:"detail", id:voucher.sn)
				} else if(voucher.status == Voucher.VoucherStatus.PAID) {
					def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
					flash.message = "验证码已经于${sdf.format(voucher.paidAt)}支付"
				} else if(voucher.status == Voucher.VoucherStatus.DISABLED) {
					flash.message = "本验证码已失效"
				}
			} else {
				flash.message = "验证码错误"
			}
		}
	}
	
	def check() {}
	
	def detail(String id) {
		def voucher = Voucher.findBySn(id)
		[voucher:voucher]
	}

	def print(String id) {
		println id
		def voucher = Voucher.findBySn(id)
		if(voucher && voucher.status == Voucher.VoucherStatus.ACTIVED) {
			voucher.status = Voucher.VoucherStatus.PAID
			voucher.cashier = springSecurityService.currentUser
			voucher.paidAt = new Date()
			voucher.save(flush:true)
			println voucher.errors
		} else {
			voucher = null
		}
		return [voucher:voucher]
	}
}
