package com.surelution.wxmp.jx

class ThirdpartTakingOn {

    static constraints = {
		linkMan nullable:true
    }

	static mapping = {
		production sqlType:'text'
		address sqlType:'text'
		remark sqlType:'text'
	}

	String openId
	String name
	String tel
	String linkMan
	String production
	String address
	String remark
}
