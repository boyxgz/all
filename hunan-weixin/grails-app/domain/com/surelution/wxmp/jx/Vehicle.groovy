package com.surelution.wxmp.jx

class Vehicle {

    static constraints = {
		vId nullable:true
		engineId nullable:true 
    }
    
	/**
	 * 车辆识别代号
	 */
    String vId
	
	/**
	 * 发动机号
	 */
    String engineId
	
	/**
	 * 车牌
	 */
    String vNo
    VehicleType type
    
    Subscriber subscriber
}
