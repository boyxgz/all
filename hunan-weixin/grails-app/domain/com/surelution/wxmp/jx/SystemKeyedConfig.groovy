package com.surelution.wxmp.jx

class SystemKeyedConfig {

    static constraints = {
		key(unique:'branch')
    }
	
	static mapping = {
		value column:'_value'
		key column:'_key'
	}
	
	String key
	Branch branch
	String value
}
