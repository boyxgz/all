package com.surelution.wxmp.jx

class GasCardApply {

    static constraints = {
		preferedStation nullable:true
		preferedDate nullable:true
    }
	
	static mapping = {
		status column:'_status', enumType:"string"
	}
	
	Subscriber subscriber
	Date createAt
	/**
	 * 身份证号码
	 */
	String holderSId
	String holderName
	
	/**
	 * 申请取卡日期
	 */
	Date preferedDate
	
	/**
	 * 申请取卡加油站
	 */
	GasStation preferedStation
	
	Status status
	
	public static enum Status{
		NEW, DECLINED, APPROVED, DONE
	}
}
