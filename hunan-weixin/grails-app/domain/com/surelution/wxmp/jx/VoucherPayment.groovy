package com.surelution.wxmp.jx

class VoucherPayment {

    static constraints = {
		paiedBy nullable:true
    }

	User paiedBy
	Date dateCreated
	Voucher voucher
}
