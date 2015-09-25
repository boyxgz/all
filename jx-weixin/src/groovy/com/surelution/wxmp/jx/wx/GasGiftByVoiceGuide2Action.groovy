/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.KeyedMessage
import com.surelution.wxmp.jx.RoarGiftIncome
import com.surelution.wxmp.jx.Voucher
import com.surelution.wxmp.jx.VoucherBatch

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class GasGiftByVoiceGuide2Action extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		isMenu("roar-gas") ||
		//仅仅是在“吼一声”这个活动期间这样 
			(getParam(Attribute.KEY_MsgType) == "event" && getParam("Event") == "subscribe")
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def att = new NewsAttribute()
		def batch = VoucherBatch.findByCode("voice-gas")
		def voucher = Voucher.findBySubscriberAndBatch(subscriber, batch)
		def img = "http://${rootPath}/images/roar-post.jpg"
		if(voucher) {
			//已参加
			def url = "http://${rootPath}/gasGiftByVoice/myGift/${subscriber.openId}"
			att.add("亲， 30,000升油等你来喊！", "您已参加活动，触摸查看为您助威的排名", img, url)
		} else {
			def url = KeyedMessage.findByKey("gas-gift-by-voice")?.message
			att.add("亲， 30,000升油等你来喊！", "中国石油嘉兴公司狂送30,000升汽油，见者有份，至少1升，最高半吨！\n戳进来拿！", img, url)
		}
		put(att)
	}

}
