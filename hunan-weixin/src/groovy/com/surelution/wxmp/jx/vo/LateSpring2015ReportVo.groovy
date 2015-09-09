/**
 * 
 */
package com.surelution.wxmp.jx.vo

import com.surelution.wxmp.jx.VoucherBatch;

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class LateSpring2015ReportVo {

	Integer scanSubscribing = 0
	
	Integer receiptCount = 0
	
	Integer ticketCount = 0
	
	Integer drawCount = 0

	HashMap<VoucherBatch, Integer> paiedCount = new HashMap<VoucherBatch, Integer>()

	HashMap<VoucherBatch, Integer> voucherCount = new HashMap<VoucherBatch, Integer>()

	public void addPayment(VoucherBatch batch, Integer c) {
		Integer i = paiedCount.get(batch)
		if(!i) {
			i = 0
		}
		paiedCount.put(batch, i + c)
	}
	
	public Integer getPaymentByBatch(VoucherBatch batch) {
		Integer i = paiedCount.get(batch)
		if(!i) {
			i = 0
		}
		return i
	}

	public void addVoucher(VoucherBatch batch, Integer c) {
		Integer i = voucherCount.get(batch)
		if(!i) {
			i = 0
		}
		voucherCount.put(batch, i + c)
	}
	
	public Integer getVoucherByBatch(VoucherBatch batch) {
		Integer i = voucherCount.get(batch)
		if(!i) {
			i = 0
		}
		return i
	}
}
