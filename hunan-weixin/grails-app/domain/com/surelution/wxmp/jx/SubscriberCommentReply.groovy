package com.surelution.wxmp.jx

class SubscriberCommentReply {

    static constraints = {
    }
	
	static mapping = {
		content type:'text'
	}
	
	SubscriberComment comment
	User user
	Date repliedAt
	String content
}
