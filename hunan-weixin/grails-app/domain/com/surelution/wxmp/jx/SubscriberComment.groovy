package com.surelution.wxmp.jx

class SubscriberComment {

    static constraints = {
    }
	
	static mapping = {
		content type:'text'
	}
	
	static transients = ['replies']
	
	Subscriber subscriber
	Date createdAt
	String content
	Boolean closed
	
	public List<SubscriberCommentReply> getReplies() {
		SubscriberCommentReply.findAllByComment(this)
	}
}
