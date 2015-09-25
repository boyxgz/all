package com.surelution.wxmp.jx

class SubscriberBalance {

    static constraints = {
		subscriber unique:true
    }
	
	Subscriber subscriber
	Integer amount
	Date lastUpdated
	
	public static SubscriberBalance ofSubscriber(Subscriber subscriber) {
		def balance = findBySubscriber(subscriber)
		if(!balance) {
			balance = new SubscriberBalance()
			balance.subscriber = subscriber
			balance.amount = 0
			balance.save(flush:true)
		}
		balance
	}
}
