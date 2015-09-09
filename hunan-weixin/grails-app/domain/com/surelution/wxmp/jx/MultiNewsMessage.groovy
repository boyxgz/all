package com.surelution.wxmp.jx

class MultiNewsMessage {
	
    static constraints = {
		menuKey unique:true
		description nullable:true
    }
	
	String menuKey
	String inputMessage
	String description
	Boolean keepHistory
}
