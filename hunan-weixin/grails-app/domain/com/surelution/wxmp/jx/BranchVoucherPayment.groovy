package com.surelution.wxmp.jx

class BranchVoucherPayment extends VoucherPayment {

    static constraints = {
    }
	
	String customerSid
	
	/**
	 * 加油卡充值卡号
	 */
	String rechargeTo
	Float rechargeAmount
}
