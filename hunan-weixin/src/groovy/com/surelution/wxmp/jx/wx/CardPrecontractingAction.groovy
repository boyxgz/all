/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.KeyedMessage
import com.surelution.wxmp.jx.VerifyCode;

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class CardPrecontractingAction extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		isMenu("precontract-card")
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def na = new NewsAttribute()
		def title = KeyedMessage.findByKey("card-precontract-title").message
		def desc = KeyedMessage.findByKey("card-precontract-desc").message
		def picUrl = "http://${rootPath}/app-images/card.jpg"
		def vc = VerifyCode.generate(subscriber.id.toString(), "card-precontract", 30)
		def url = "http://${rootPath}/cardPrecontracting/showOrder/${vc.code}"
		na.add(title, desc, picUrl, url)
		put(na)
	}

}
