package com.surelution.wxmp.jx

class DrawPrizeVoucher extends Voucher {

    static constraints = {
    }
	
	VoucherBatch batch
	
	DrawPrizeTicket ticket
	
	public String getInfo() {
		"${batch.name}"
	}
	
	public String getName() {
		"春节抽奖"
	}
}
