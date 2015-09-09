package com.surelution.wxmp.jx


class CardPrecontracting {

    static constraints = {
		remark nullable:true
    }
	
	static mapping = {
		status enumType : "string"
	}
	
	Subscriber subscriber  //订阅者
	Date precontractingDate //下单时间
	GasStation stationOfFetch //取卡加油站
	Date dateOfFetch //取卡日期
	String remark //备注
	String holderName //姓名
	String holderSId //身份证号码
	String contactTel //联系电话
	
	CardPrecontractingStatus status//状态   初始1，有效2，无效3
	
	static enum CardPrecontractingStatus {
		INIT, VALID, INVALID
		
		public String toString() {
			KeyedMessage.findByKey("CardPrecontractingStatus-${name()}").message
		}
	} 
}
