/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.KeyedMessage
import com.surelution.wxmp.jx.Voucher

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class GiftCodeAction extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		isMenu("gift-code")
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def att
		def vouchers = Voucher.findAllBySubscriber(subscriber)
		if(!vouchers || vouchers.size() == 0) {
			att = new Attribute(Attribute.KEY_Content, "您目前没有有效的礼品券")
		} else {
			att = new NewsAttribute()
			def sb = new StringBuffer("您的礼品券信息如下：\n")
			vouchers.each {
				sb.append("号码：${it.sn}，奖品：${it.batch.name}，状态:${it.status}\n")
			}
			sb.append("进店消费前告知工作人员，其他情况请勿泄露。\n中国石油祝您愉快！")
			def url = KeyedMessage.findByKey("gas-gift-by-voice")?.message
			att.add("您的礼品券", sb.toString(), "http://${rootPath}/images/gifts.jpg", url)
		}
		put(att)
	}

}
