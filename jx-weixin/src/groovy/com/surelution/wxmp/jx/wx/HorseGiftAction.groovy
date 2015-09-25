/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.KeyedMessage
import com.surelution.wxmp.jx.VerifyCode

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class HorseGiftAction extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		return isMenu("horse-gift")
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def vc = VerifyCode.findByContentAndSource(subscriber.id.toString(), "horse-gift")
		def title = KeyedMessage.findByKey("HORSE-GIFT-TITLE")?.message
		def desc = KeyedMessage.findByKey("HORSE-GIFT-DESC")?.message
		def url
		def na = new NewsAttribute()
		if(vc) {
			url = "http://${rootPath}/horseGiftApply/detail/${vc.code}"
		} else {
			url = KeyedMessage.findByKey("HORSE-GIFT-INVITE-URL")?.message
		}
		na.add(title, desc, "http://${rootPath}/app-images/horse-gift.jpg?v=3", url)
		put(na)
	}

}
