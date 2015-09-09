package com.surelution.wxmp.jx

class SubscriberCommentAssignment {

    static constraints = {
		closedAt nullable:true
    }

//	SubscriberComment comment
	Subscriber subscriber
	User user
	String tips
	Boolean closed
	Date createAt
	Date closedAt
}
