/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.SubscriberBalance
import com.surelution.wxmp.jx.TempPayment
import com.surelution.wxmp.jx.utils.StringUtils

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class PosScanAction extends JxBaseAction {
	
	private int qrSn

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		if(getParam("Event") == "SCAN") {
			qrSn = getParam("EventKey") as int
			println qrSn
			return qrSn > 100000
		}
		if(getParam("Event") == "subscribe") {
			//EventKey:qrscene_1301255
			def key = getParam("EventKey")
			if(key && key.startsWith("qrscene_")) {
				key = key.substring("qrscene_".length())
				qrSn = key as int
				return qrSn > 100000
			}
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		long tempPaymentId = qrSn - 100000
		def tempPayment = TempPayment.get(tempPaymentId)
		if(tempPayment) {
			def sb = SubscriberBalance.ofSubscriber(subscriber)
			tempPayment.subscriber = subscriber
			if(sb.amount < tempPayment.amount) {
				tempPayment.status = TempPayment.PaymentStatus.CANCELED
				tempPayment.save(flush:true)
				def msg = "操作员${tempPayment.pos.name}的${tempPayment.user.username}正在试图扣除您账户内U豆${tempPayment.amount}颗，但您账户中的U豆不足，操作取消。"
				put(new Attribute(Attribute.KEY_Content, msg))
				return
			}
			def random = new Random()
			def payToken = random.nextInt(999)
			tempPayment.payToken = StringUtils.formatInt(payToken, 3)
			tempPayment.save(flush:true)
			
			def msg = "操作员${tempPayment.pos.name}的${tempPayment.user.username}正在试图扣除您账户内U豆${tempPayment.amount}颗，如确认这笔消费，请向营业员提供授权码：${tempPayment.payToken}"
			put(new Attribute(Attribute.KEY_Content, msg))
			return
		} else {
			put(new Attribute(Attribute.KEY_Content, "error"))
		}
	}

}
