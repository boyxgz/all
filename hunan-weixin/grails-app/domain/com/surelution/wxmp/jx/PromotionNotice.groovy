package com.surelution.wxmp.jx

class PromotionNotice {

    static constraints = {
		branch unique:true
    }
	static mapping = {
		content type: "text"
	}
	
	Branch branch
	String content
}
