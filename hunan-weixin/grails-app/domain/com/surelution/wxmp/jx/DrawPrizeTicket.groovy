package com.surelution.wxmp.jx

class DrawPrizeTicket {

	static transients = ['remark']

	static constraints = {
		drawAt nullable:true
	}

	Date dateCreated
	Date drawAt
	Subscriber subscriber

	public String getRemark() {
		""
	}
}
