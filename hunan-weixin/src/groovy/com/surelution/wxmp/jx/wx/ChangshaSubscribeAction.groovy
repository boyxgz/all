/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.ChangshaSubscribingGift
import com.surelution.wxmp.jx.GasStation
import com.surelution.wxmp.jx.KeyedMessage

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class ChangshaSubscribeAction extends JxBaseAction {
	
	private GasStation gasStation

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		if(System.currentTimeMillis()  > 1419091200000) {
			return false
		}
		String sId = null
		if(getParam("Event") == "subscribe") {
			def eventKey = getParam("EventKey")
			if(eventKey && eventKey.startsWith("qrscene_")) {
				sId = eventKey.substring("qrscene_".length())
			}
		} else {
			if(getParam("Event") == "SCAN") {
				sId = getParam("EventKey")
			}
		}
		if(sId) {
			gasStation = GasStation.get(sId)
			def branch = gasStation?.district?.branch?.id
			return branch == 1
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def gift = ChangshaSubscribingGift.findBySubscriberAndChannel(subscriber, ChangshaSubscribingGift.GiftChannel.SUBSCRIBING)
		if(!gift) {
			gift = new ChangshaSubscribingGift()
			gift.status = ChangshaSubscribingGift.GiftStatus.NEW
			gift.subscriber = subscriber
			gift.channel = ChangshaSubscribingGift.GiftChannel.SUBSCRIBING
			gift.gasStation = gasStation
			gift.save(flush:true)
		}
		def title = KeyedMessage.findByKey("changsha-subscribing-title")?.message
		def desc = KeyedMessage.findByKey("changsha-subscribing-desc")?.message
		def na = new NewsAttribute()
		na.add(title, desc, "http://${rootPath}/images/voucher-blank.jpg", "http://${rootPath}/invitation/swipe/${gift.id}")
		put(na)
	}

}
