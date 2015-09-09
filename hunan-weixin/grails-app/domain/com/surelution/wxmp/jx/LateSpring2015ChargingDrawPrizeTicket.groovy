package com.surelution.wxmp.jx

import java.util.Date;

import com.surelution.wxmp.jx.LateSpring2015ReceiptFuelCharging.FuelType;

class LateSpring2015ChargingDrawPrizeTicket extends LateSpring2015DrawPrizeTicket {

    static constraints = {
    }
	
	//在对象树中，已经有了一个receipt了:(
	LateSpring2015ReceiptFuelCharging lreceipt
	
	public String getRemark() {
		"${lreceipt.type}消费<br/>交易号:${lreceipt.transNo}<br/>站名:${lreceipt.stationName}<br/>金额:${lreceipt.amount}<br/>小票日期：${lreceipt.dateCreated.format('yyyy-MM-dd')}"
	}
}
