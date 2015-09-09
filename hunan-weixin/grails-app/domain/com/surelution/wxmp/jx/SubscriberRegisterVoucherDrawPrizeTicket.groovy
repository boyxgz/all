package com.surelution.wxmp.jx

class SubscriberRegisterVoucherDrawPrizeTicket extends DrawPrizeTicket {

    static constraints = {
    }
	
	RegisterVoucher voucher
	
	public String getRemark() {
		"关注红包抽奖，原红包编号为：${voucher?.fullSn}"
	}
}
