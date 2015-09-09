package com.surelution.wxmp.jx

class OpenDayDrawPrizeTicket extends DrawPrizeTicket {

    static constraints = {
		sn nullable:true
		refusingCode nullable:true
    }
	
	static mapping = {
		drawn column:'_drawn'
	}
	
	/**
	 * 用来帮助在非登录环境定位一条记录
	 */
	String refusingCode
	Boolean drawn
	OpenDay2015TicketSn sn
	
	def generateSn() {
		if(!sn) {
			def s = new OpenDay2015TicketSn()
			s.save(flush:true)
			sn = s
			save(flush:true)
		}
	}
	
	def beforeInsert() {
		refusingCode = UUID.randomUUID().toString()
	}
}
