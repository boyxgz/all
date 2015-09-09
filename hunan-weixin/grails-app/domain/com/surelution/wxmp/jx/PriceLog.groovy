package com.surelution.wxmp.jx

class PriceLog {

    static constraints = {
    }
	
	static mapping = {
		from column : '_from'
		to column : '_to'
	}
	
	Date from
	Date to
	Double price
}
