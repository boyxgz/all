package com.surelution.wxmp.jx

import java.util.Date;

class MultiNewsMessageItem {

    static constraints = {
		expiredAt nullable:true
    }
	
	static mapping = {
		active column:'_active'
	}
	
	MultiNewsMessage message
	String title
	String description
	String pictureUrl
	String url
	boolean firstNews
	boolean globalMessage
	
	Boolean active
	Date createdAt
	Date expiredAt
}
