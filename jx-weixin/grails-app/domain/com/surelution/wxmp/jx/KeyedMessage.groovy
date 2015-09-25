package com.surelution.wxmp.jx

class KeyedMessage {

    static constraints = {
		key unique:true
    }
	
	static mapping = {
		message length:1024
		key column:"_key"
	}
	
	String key
	String message
	String description
}
