package com.surelution.wxmp.jx

class ChangshaSubscribingGift {

    static constraints = {
		type nullable:true
//		subscriber unique:true
		sn nullable:true
		paidBy nullable:true
		paidAt nullable:true
		guest nullable:true
		subscriberMobileNo nullable:true
		gasStation nullable:true
    }

	Subscriber subscriber
	Date dateCreated
	ChangshaSubscribingGiftType type
	GiftStatus status
	String sn

	User paidBy
	Date paidAt
	GiftChannel channel
	String subscriberMobileNo
	
	GasStation gasStation
	
	/**
	 * 当 channel为INVITING 的时候，关联一个被邀请人的信息
	 */
	Subscriber guest

	def afterInsert() {
		if((id % 10000) == 8888) {
			type = ChangshaSubscribingGiftType.findByKey("0")
		} else if((id % 1000) == 888) {
			type = ChangshaSubscribingGiftType.findByKey("1")
		} else if((id % 100) == 88) {
			type = ChangshaSubscribingGiftType.findByKey("2")
		} else if((id % 10) == 8) {
			type = ChangshaSubscribingGiftType.findByKey("3")
		} else if(channel == GiftChannel.SUBSCRIBING) {
			type = ChangshaSubscribingGiftType.findByKey("4")
		} else {
			type = ChangshaSubscribingGiftType.findByKey("blank")
		}

		String tmp = formatInt(id.intValue(), 6)
		Random r = new Random()
		int refuse = r.nextInt(99)
		StringBuffer sb = new StringBuffer()
		sb.append(tmp)
		sb.append(formatInt(refuse, 2))
		sn = sb.toString()
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

	enum GiftStatus {
		NEW, OPENED, PAID
	
		public String toString() {
			KeyedMessage.findByKey("ChangshaSubscribingGift-GiftStatus-${name()}")?.message
		}
	}

	enum GiftChannel {
		SUBSCRIBING, INVITING
	
		public String toString() {
			KeyedMessage.findByKey("ChangshaSubscribingGift-GiftChannel-${name()}")?.message
		}
	}
}
