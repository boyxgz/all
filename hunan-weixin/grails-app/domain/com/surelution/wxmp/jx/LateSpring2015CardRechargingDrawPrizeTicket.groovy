package com.surelution.wxmp.jx

class LateSpring2015CardRechargingDrawPrizeTicket extends LateSpring2015DrawPrizeTicket {

    static constraints = {
    }

	//在对象树中，已经有了一个receipt了:(
	LateSpring2015ReceiptCardRecharging lreceipt
	
	public String getRemark() {
		"IC卡充值<br/>交易流水号:${lreceipt.transNo}<br/>卡号:${lreceipt.cardNo}<br/>充值金额:${lreceipt.amount}<br/>小票日期：${lreceipt.dateCreated.format('yyyy-MM-dd')}"
	}
}
