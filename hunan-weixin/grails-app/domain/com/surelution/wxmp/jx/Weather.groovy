package com.surelution.wxmp.jx

class Weather {

    static constraints = {
		date unique:true
    }
	
	static mapping = {
	}
	
	java.sql.Date date
	Boolean completed
}
