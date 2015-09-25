/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.KeyedMessage;
import com.surelution.wxmp.jx.Voucher
import com.surelution.wxmp.jx.VoucherBatch
import com.surelution.wxmp.jx.exceptions.RoarGift2TimesException

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class GasGiftByVoice2Action extends JxBaseAction {
	
	public static final String TEXT = "中国石油在我身边"

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		getParam("MsgType") == "voice"
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		
//		if(System.currentTimeMillis() < 1413770400000) {
//			def a = new Attribute(Attribute.KEY_Content, "施工中，敬请期待。活动起止时间是：2014年10月20日10点-2014年10月28日16点")
//			put(a)
//			return
//		} else 
		if(System.currentTimeMillis() > 1414483200000) {
			def a = new Attribute(Attribute.KEY_Content, "本次活动已结束，小U正在发奖。下次请早喔！")
			put(a)
			return
		}
		def att
		def content = getParam("Recognition")
		if(content == TEXT) {
			def batch = VoucherBatch.findByCode("voice-gas")
			def voucher = Voucher.findBySubscriberAndBatch(subscriber, batch)
			
			if(!voucher){
				voucher = new Voucher()
				voucher.batch = batch
				voucher.subscriber = subscriber
				voucher.status = Voucher.VoucherStatus.ACTIVED
				voucher.save(flush:true)

				def dest = "http://${rootPath}/gasGiftByVoice/myGift/${subscriber.openId}"
				att = new NewsAttribute()
				
				att.add("您获得了1升汽油", "点击查看使用方法。更有免费获得半吨汽油、免费加满油箱等好礼！", "http://${rootPath}/images/roar-post.jpg", dest)
				def vId = voucher.id
				if(vId % 100 == 88) {
					def dalaVB = VoucherBatch.findByCode("3M")
					voucher = new Voucher()
					voucher.batch = dalaVB
					voucher.subscriber = subscriber
					voucher.status = Voucher.VoucherStatus.ACTIVED
					voucher.save(flush:true)
					
					def title = KeyedMessage.findByKey("3M-TITLE")?.message
					def desc = KeyedMessage.findByKey("3M-DESC")?.message
					def dalaUrl = "http://${rootPath}/chezhiyi/dalaGift"
					att.add(title, desc, "http://${rootPath}/images/dala.jpg", dalaUrl)
				}
			} else {
				def msg = KeyedMessage.findByKey("VOICE-DUPLICATED-DESC")?.message
				att = new Attribute(Attribute.KEY_Content, msg)
			}
		} else {
			def msg
			if(content) {
				msg = "小U傻傻听不懂，再来，您说的是：${content}，请说：${TEXT}"
			} else {
				msg = "噶小声音？小U听勿清桑，再来"
			}
			att = new Attribute(Attribute.KEY_Content, msg)
		}
		put(att)
	}

	
}
