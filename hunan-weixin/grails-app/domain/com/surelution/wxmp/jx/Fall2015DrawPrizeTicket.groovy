package com.surelution.wxmp.jx

class Fall2015DrawPrizeTicket extends DrawPrizeTicket {

    static constraints = {
    }

	Fall2015Receipt freceipt

	public String getRemark() {
		"${freceipt.cardType}消费<br/>交易号:${freceipt.transNo}<br/>金额:${freceipt.amount}<br/>小票日期：${freceipt.dateCreated.format('yyyy-MM-dd')}"
	}
}
