package com.surelution.wxmp.jx

class AutoLocation {

    static constraints = {
    }
	
	static mapping = {
		precision column:'`precision`'
	}
	
	Subscriber subscriber
	String precision
	Float latitude
	Float longitude
	String toUserName
	Date createAt
}
