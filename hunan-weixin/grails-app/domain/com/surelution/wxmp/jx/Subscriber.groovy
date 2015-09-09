package com.surelution.wxmp.jx

import java.util.Date;


class Subscriber {

    static constraints = {
		fakeId nullable:true
		preferedBranch nullable:true
		dateCreated nullable:true
    }
	
	static mapping = {
		openId unique:true
	}
	
	String openId
	String fakeId
	Branch preferedBranch
	Date dateCreated
}
