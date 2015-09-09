package com.surelution.wxmp.jx

class Wiki {

    static constraints = {
    }
	
	static mapping = {
		content type:'text'
		index column:'_index'
	}
	
	String title
	Boolean active
	String content
	Date createAt
	Integer index
}
