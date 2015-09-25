package com.surelution.wxmp.jx

class GasCard {

    static constraints = {
		cardNo unique:true
		holderName nullable:true
		holderSId nullable:true
		password nullable:true
    }

	Subscriber subscriber
	String cardNo
	String holderName
	String holderSId
	String password
}
