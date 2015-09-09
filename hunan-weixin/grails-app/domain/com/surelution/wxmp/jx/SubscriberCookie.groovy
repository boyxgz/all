package com.surelution.wxmp.jx

class SubscriberCookie {

    static constraints = {
		subscriber unique:true
		subscriberSn unique:true
    }

	Subscriber subscriber
	String subscriberSn
	Date dateCreated
	Date lastUpdated
	
	public static SubscriberCookie populate(Subscriber subscriber) {
		def sc = SubscriberCookie.findBySubscriber(subscriber)
		if(!sc) {
			sc = new SubscriberCookie()
			sc.subscriber = subscriber
		}
		sc.subscriberSn = UUID.randomUUID().toString()
		sc.save(flush:true)
		return sc
	}
}
