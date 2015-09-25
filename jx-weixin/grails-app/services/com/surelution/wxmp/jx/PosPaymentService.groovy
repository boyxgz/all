package com.surelution.wxmp.jx

class PosPaymentService {
	
	static transactional = true
	
	def confirmPayment(TempPayment tempPayment, User cashier,Pos pos, String payToken, String remark) throws LowBalanceException {
//		def p = TempPayment.findByPaymentSn(paymentSn)
		def amount = tempPayment.amount
		tempPayment.status = TempPayment.PaymentStatus.PAID
		tempPayment.paidAt = new Date()
		tempPayment.save()
		
		def subscriber = tempPayment.subscriber
		
		def posPayment = new PosPayment()
		posPayment.subscriber = subscriber
		posPayment.amount = -amount
		posPayment.cashier = cashier
		posPayment.remark = remark
		posPayment.payToken = payToken
		posPayment.pos = pos
		posPayment.save()
		
		def posAccount = PosAccount.ofPos(pos)
		posAccount.amount = posAccount.amount + amount
		posAccount.save()
		
		def posTransLog = new PosTransLog()
		posTransLog.pos = pos
		posTransLog.amount = amount
		posTransLog.user = cashier
		posTransLog.save()
		
		def balance = SubscriberBalance.ofSubscriber(subscriber)
		if(!balance || balance.amount < amount) {
			throw new LowBalanceException()
		}

		balance.amount = balance.amount - amount
		balance.save(flush:true)
	}
}
