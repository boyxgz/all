package com.surelution.wxmp.jx

class PosAccount {

    static constraints = {
		pos unique:true
    }
	
	Pos pos
	Integer amount
	Date lastUpdated
	
	public static PosAccount ofPos(Pos pos) {
		def balance = findByPos(pos)
		if(!balance) {
			balance = new PosAccount()
			balance.pos = pos
			balance.amount = 0
			balance.save(flush:true)
		}
		balance
	}
}
