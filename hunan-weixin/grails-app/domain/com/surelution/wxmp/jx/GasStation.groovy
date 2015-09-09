package com.surelution.wxmp.jx


class GasStation {

    static constraints = {
		linkManTel nullable:true
		cardBonus nullable:true
		cardBonus nullable:true
		subscribingUrl nullable:true
    }

	static transients = ["distance","duration"]

	static mapping = {
	}

	District district
	double longitude
	double latitude
	String name
	String address
	String tel
	String linkMan
	String linkManTel
	
	/**
	 * 是否可发卡
	 */
	boolean cardIssuing
	
	/**
	 * 积分兑换网点
	 */
	boolean cardBonus
	long distance
	long duration
	boolean active
	
	String subscribingUrl
	
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if(!(obj instanceof GasStation)) {
			return false;
		}
		id == obj.id
	}
	@Override
	public int hashCode() {
		if(id) {
			return id;
		}
		return super.hashCode();
	}
	
	
}
