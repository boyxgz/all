package com.surelution.wxmp.jx

import com.surelution.wxmp.jx.Fall2015Receipt.CardType;

class Fall2015PrizeRule {

    static constraints = {
    }
	
	static mapping = {
		from column:'_from'
		to column:'_to'
	}

	CardType cardType
	Integer from
	Integer to
	
	/**
	 * 如果无上限，就在to写上一个超级大数，如1000万，noLimit
	 */
	Boolean noLimited
	
	public String toString() {
		def sb = new StringBuilder()
		sb.append(from)
		if(noLimited) {
			sb.append("+")
		} else {
			sb.append("-")
			sb.append(to)
		}
		sb.toString()
	}
}
