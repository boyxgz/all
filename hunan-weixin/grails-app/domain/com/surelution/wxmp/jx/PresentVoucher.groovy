package com.surelution.wxmp.jx

class PresentVoucher extends Voucher {

    static constraints = {
    }
	
	VoucherBatch batch

	public String getInfo() {
		"${batch.name}"
	}

	public String getName() {
		"奖励奖券"
	}
}
