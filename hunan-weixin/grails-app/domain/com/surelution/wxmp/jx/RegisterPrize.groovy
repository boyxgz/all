package com.surelution.wxmp.jx

class RegisterPrize {

    static constraints = {
		awardedBy nullable:true
		awardedAt nullable:true
		subscriber unique:true
		gasStation nullable:true
    }

	Subscriber subscriber
	Prize prize
	String verifyCode
	Date createAt
	User awardedBy
	Date awardedAt
	GasStation gasStation
	boolean paied = false
}
