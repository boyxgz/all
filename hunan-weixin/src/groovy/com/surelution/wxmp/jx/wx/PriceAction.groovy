/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute;
import com.surelution.wxmp.jx.PriceLog;

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class PriceAction extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		getParam(Attribute.KEY_MsgType == Attribute.Msg_Type_TEXT) {
			def content = getParam(Attribute.KEY_Content)
			if(content) {
				return content.contains("油价")
			}
		}
		false
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def price
		def now = new Date()
		def prices = PriceLog.createCriteria().list() {
			ge('from', now)
			le('to', now)
		}
		if(prices) {
			price = prices[0]
		}
		if(price) {
			def a = new Attribute(Attribute.Msg_Type_TEXT, price.price.toString())
			put(a)
		}
	}

}
