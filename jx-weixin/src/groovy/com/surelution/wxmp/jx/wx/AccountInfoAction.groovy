/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.SubscriberBalance

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class AccountInfoAction extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		isMenu("account-info")
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def sb = SubscriberBalance.ofSubscriber(subscriber)
		def msg = "您当前有U豆${sb.amount}颗"
		put(new Attribute(Attribute.KEY_Content, msg))
	}

}
