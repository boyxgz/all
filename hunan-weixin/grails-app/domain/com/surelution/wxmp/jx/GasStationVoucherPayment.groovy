package com.surelution.wxmp.jx

class GasStationVoucherPayment extends VoucherPayment {

    static constraints = {
    }
	
	VoucherPaymentChannel channel
	
	/**
	 * 兑奖金额(客户从抵用券中抵扣的金额)
	 */
	Float amountByVoucher

	/**
	 * 消费金额
	 */
	Float totalAmount
}
