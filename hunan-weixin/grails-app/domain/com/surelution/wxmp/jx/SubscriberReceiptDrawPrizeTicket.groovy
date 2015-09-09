package com.surelution.wxmp.jx

class SubscriberReceiptDrawPrizeTicket extends DrawPrizeTicket {

    static constraints = {
    }
	
	SubscriberReceipt receipt
	
	public String getRemark() {
		"小票号码：${receipt?.receiptNo}，加油站：${receipt?.stationName}"
	}
}
