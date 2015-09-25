package com.surelution.wxmp.jx


class GasStation {

    static constraints = {
    }

	static transients = ["distance","duration"]
	
	static mapping = {
		branch column:'branck_id'
	}

	Branch branch
	double longitude
	double latitude
	String name
	String address
	String tel
	String linkMan
	long distance
	long duration
	boolean active
}
