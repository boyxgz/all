package com.surelution.wxmp.jx

class SubscriberInvoiceDrawPrizeTicket extends DrawPrizeTicket {

    static constraints = {
    }
	
	SubscriberInvoice invoice
	
	public String getRemark() {
		"发票号码：${invoice?.invoiceNo}，发票代码${invoice?.invoiceCode}"
	}
}
