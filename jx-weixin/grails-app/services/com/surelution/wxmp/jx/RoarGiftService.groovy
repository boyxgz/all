package com.surelution.wxmp.jx

import com.surelution.wxmp.jx.exceptions.RoarGift2TimesException

class RoarGiftService {
	
	static transactional = true 
	
	def confirmGift(Subscriber subscriber, Integer amount, String content) throws RoarGift2TimesException {
		def gift = RoarGiftIncome.findBySubscriber(subscriber)
		if(gift) {
			throw new RoarGift2TimesException()
		}
		println gift
		gift = new RoarGiftIncome()
		gift.subscriber = subscriber
		gift.amount = amount
		gift.roarContent = content
		gift.save()
		
		println gift.errors
		
		def balance = SubscriberBalance.ofSubscriber(subscriber)
		balance.amount = balance.amount + amount
		balance.save()
	}
}
