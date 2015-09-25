package com.surelution.wxmp.jx

class Subscriber {

    static constraints = {
		fakeId nullable:true
    }
	
	static mapping = {
		openId unique:true
	}
	
	String openId
	String fakeId
}
