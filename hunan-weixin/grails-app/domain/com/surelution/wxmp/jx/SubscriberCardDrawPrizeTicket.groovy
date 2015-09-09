package com.surelution.wxmp.jx

class SubscriberCardDrawPrizeTicket extends DrawPrizeTicket {

    static constraints = {
    }
	
	SubscriberCard card
	
	public String getRemark() {
		"加油卡卡号：${card?.cardNo}"
	}
}
