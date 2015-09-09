package com.surelution.wxmp.jx

class ChangshaSubscribingGiftType {

    static constraints = {
		key unique:true
    }
	
	static mapping = {
		key column:'_key'
	}

	String key
	String name
	Float price
}
