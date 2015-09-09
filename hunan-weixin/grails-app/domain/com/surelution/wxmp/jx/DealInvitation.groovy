package com.surelution.wxmp.jx

class DealInvitation {

    static constraints = {
		guest unique:true
    }
	
	Subscriber host
	Subscriber guest
	Date dateCreated
	Invitation invitation
}
