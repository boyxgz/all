package com.surelution.wxmp.jx

import java.util.Date;

class Fall2015Receipt {

    static constraints = {
		rule(unique:'receiptIndex')
		transNo nullable:true
    }

	Subscriber subscriber
	String transNo
	String cardNo
	Float amount
	CardType cardType
	Long receiptIndex
	Fall2015PrizeRule rule

	Date dateCreated
	
	enum CardType {
		PERSONAL, ENTERPRISE
		
		public String toString() {
			return KeyedMessage.findByKey("CardType-${name()}")?.message
		}
	}
}
