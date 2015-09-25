package com.surelution.wxmp.jx

class Promotion {

    static constraints = {
    }
	
	static mapping = {
		content length:32768
	}
	
	boolean active
	String title
	String content
	boolean main
}
