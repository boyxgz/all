package com.surelution.wxmp.jx

class Subscribing {

    static constraints = {
    }
	static mapping = {
		subscribingAtString formula: "DATE_FORMAT(subscribing_at, '%Y-%m-%d')"
	}
	
	static transients = ['sf']
	
	Subscriber subscriber
	Date subscribingAt
	String comeFrom
	
	String subscribingAtString

	public SubscribingFrom getSf() {
		if(comeFrom) {
			return SubscribingFrom.searchByComeFrom(comeFrom)
		}
	}
}
