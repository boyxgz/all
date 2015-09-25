package com.surelution.wxmp.jx

class Voucher {

    static constraints = {
		sn unique:true
		sn nullable:true
		cashier nullable:true
		paidAt nullable:true
    }

	VoucherBatch batch
	String sn
	Subscriber subscriber
	Date dateCreated
	User cashier
	Date paidAt
	VoucherStatus status
	
	def afterInsert() {
		String tmp = formatInt(id.intValue(), 6)
		Random r = new Random()
		int refuse = r.nextInt(99)
		String sRefuse = formatInt(refuse, 2)
		StringBuffer sb = new StringBuffer()
		sb.append(sRefuse.charAt(0))
		sb.append(tmp.substring(0, 3))
		sb.append(sRefuse.charAt(1))
		sb.append(tmp.substring(3))
		sn = sb.toString()
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

	/**
	 * 代金券状态：新建、已使用、作废
	 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
	 *
	 */
	static enum VoucherStatus {
		ACTIVED, PAID, DISABLED
		
		public String toString() {
			KeyedMessage.findByKey("VoucherStatus-${name()}").message
		}
	}
}
