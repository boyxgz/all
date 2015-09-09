package com.surelution.wxmp.jx

import com.surelution.wxmp.jx.Voucher.VoucherStatus;

class VoucherPaymentService {

	static transactional = true

    def boolean payment(Voucher voucher, VoucherPayment payment) {
		voucher.status = VoucherStatus.PAID
		voucher.paiedAt = new Date()
		voucher.save(flush:true)
		
		payment.voucher = voucher
		payment.save(flush:true)
		true
	}
}
