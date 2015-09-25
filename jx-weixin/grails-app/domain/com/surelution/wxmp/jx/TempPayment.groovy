package com.surelution.wxmp.jx

import java.util.Date;

class TempPayment {

    static constraints = {
		remark nullable:true
		paidAt nullable:true
		subscriber nullable:true
		payToken nullable:true
    }

	static mapping = {
		status enumType : "string"
	}
	
	Subscriber subscriber
	User user
	Pos pos
	Date dateCreated
	String payToken
	Integer amount
	String remark
	PaymentStatus status
	Date paidAt

	static enum PaymentStatus {
		CREATED, CANCELED, PAID
	}
}
