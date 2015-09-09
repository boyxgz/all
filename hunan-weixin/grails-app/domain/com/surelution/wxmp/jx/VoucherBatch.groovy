package com.surelution.wxmp.jx

class VoucherBatch {

    static constraints = {
    }
	
	static mapping = {
		key column:"_key"
		luckyNum type:'text'
		priority column:"_priority"
	}
	
	String key
	
	String name
	
	String description
	
	Float amount
	
	Integer countDaily
	
	String luckyNum
	
	Integer priority
	
	String eventName
	
	public boolean equals(Object o) {
		if(o == null || !(o instanceof VoucherBatch)) {
			return false
		}
		return o.id == id
	}
	
	public int hashCode() {
		return id
	}
}
