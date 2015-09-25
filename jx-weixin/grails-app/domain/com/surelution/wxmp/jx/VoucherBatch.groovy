package com.surelution.wxmp.jx

class VoucherBatch {

    static constraints = {
		code unique:true
		production nullable:true
    }

	String name
	Float price
	String code
	String production
}
