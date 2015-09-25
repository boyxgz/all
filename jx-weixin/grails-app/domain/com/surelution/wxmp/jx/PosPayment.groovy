package com.surelution.wxmp.jx

import java.util.Date;

import com.surelution.wxmp.jx.TempPayment.PaymentStatus;

/**
 * 在POS机上的支付
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class PosPayment extends TransLog {

    static constraints = {
    }

	User cashier
	String payToken
	String remark
	Pos pos
}
