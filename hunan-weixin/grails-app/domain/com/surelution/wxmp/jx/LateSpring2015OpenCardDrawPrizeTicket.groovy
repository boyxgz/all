package com.surelution.wxmp.jx

class LateSpring2015OpenCardDrawPrizeTicket extends LateSpring2015DrawPrizeTicket {

    static constraints = {
    }

	//在对象树中，已经有了一个receipt了:(
	LateSpring2015ReceiptCard lreceipt

	public String getRemark() {
		"IC卡开卡<br/>业务流水号:${lreceipt.transNo}<br/>卡号:${lreceipt.cardNo}<br/>小票日期：${lreceipt.dateCreated.format('yyyy-MM-dd')}"
	}
}
