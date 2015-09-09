/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.KeyedMessage
import com.surelution.wxmp.jx.RegisterPrize;

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class MyPrizeAction extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		isMenu("key_myPrize")
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def rp = RegisterPrize.findBySubscriber(subscriber)
		//PRIZE-TIPS-1:您已成功获得一份由中石油送出的小奖品，兑奖码为：
		def msg
		if(rp) {
			msg = KeyedMessage.findByKey('PRIZE-TIPS-1').message
			msg += rp.verifyCode
			if(rp.awardedBy) {
				//PRIZE-TIPS-HONORED:系统显示，您已经领过奖品，有问题，请随时联系我们
				msg += KeyedMessage.findByKey('PRIZE-TIPS-HONORED').message
			} else {
				//PRIZE-TIPS-GUIDE:请到任意中石油加油站领取。
				msg += KeyedMessage.findByKey('PRIZE-TIPS-GUIDE').message
			}
		} else {
			//PRIZE-TIPS-NO-PRIZE:系统没有找到您的相关奖品记录，可能由如下原因导致：\n1.系统故障\n2.您在本次活动前已经关注了本账号\n请取消关注，再次扫描二维码关注本账号
			msg = KeyedMessage.findByKey('PRIZE-TIPS-NO-PRIZE').message
		}
		put(new Attribute(Attribute.KEY_Content, msg))
	}

}
