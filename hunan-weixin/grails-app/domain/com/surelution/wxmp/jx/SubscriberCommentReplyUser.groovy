package com.surelution.wxmp.jx

class SubscriberCommentReplyUser {

    static constraints = {
		branch(unique:'user')
		branch nullable:true
    }
	
	Branch branch
	User user
}
