package com.surelution.wxmp.jx

class AutoLocation {

    static constraints = {
    }
	
	static mapping = {
		precision column:'c_precision'
	}
	
	Subscriber subscriber
	Date createAt
	Double latitude
	Double longitude
	Double precision
}
