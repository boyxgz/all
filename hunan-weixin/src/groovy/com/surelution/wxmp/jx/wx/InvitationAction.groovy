/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class InvitationAction extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		getParam(Attribute.KEY_Content) == "100" || isMenu("invitation-gift")
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def na = new NewsAttribute()
		na.add("邀请朋友一起关注我们", "查看我邀请的朋友列表，查看我的邀请奖励积分", "http://${rootPath}/images/gifts.jpg", "http://${rootPath}/invitation/dashboard/${subscriber.openId}")
		put(na)
	}

}
