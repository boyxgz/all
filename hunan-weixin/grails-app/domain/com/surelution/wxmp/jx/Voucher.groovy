package com.surelution.wxmp.jx

import groovy.time.TimeCategory

import org.apache.commons.lang.StringUtils


class Voucher {
	
    static constraints = {
		paiedAt nullable:true
		whoPaied nullable:true
		owner nullable:true
		availableBeginAt nullable:true
		fullSn nullable:true
    }
	
	static transients = ['info', 'name']

	static mapping = {
		status enumType : "string"
	}

	def afterInsert() {
		Random r = new Random()
		int refuse = r.nextInt(9999)
		String sRefuse = formatInt(refuse, 4)
		fullSn = formatInt(id.intValue(), 8) + sRefuse
		save()
	}

	private static String formatInt(int value, int length) {
		StringBuffer sb = new StringBuffer()
		String sSubSn = value.toString()
		(length - sSubSn.length()).times {
			sb.append("0")
		}
		sb.append(sSubSn)
		sb.toString()
	}
	
	Subscriber owner
	
	VoucherStatus status

	String fullSn
	
	Date paiedAt
	
	User whoPaied
	
	Date availableBeginAt
	
	Date availableEndAt
	
	Float amount

	Boolean enabled

	Date dateCreated
	
	public String getInfo() {
		""
	}
	
	public String getName() {
		""
	}
	
	/**
	 * 代金券状态：有效、已使用、作废
	 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
	 *
	 */
	static enum VoucherStatus {
		ACTIVED, PAID, DISABLED

		public String toString() {
			def key = "VoucherStatus-${name()}"
			def msg = KeyedMessage.findByKey(key)
			msg ? msg.message : key
		}
	}
}
