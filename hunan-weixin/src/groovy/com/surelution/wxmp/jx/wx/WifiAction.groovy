/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.KeyedMessage;

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class WifiAction extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		if(getParam(Attribute.KEY_MsgType) == Attribute.Msg_Type_TEXT) {
			def key = KeyedMessage.findByKey("WIFI-KEY").message
			return getParam(Attribute.KEY_Content).trim().toLowerCase() == key
		}
		return false
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def url = KeyedMessage.findByKey("WIFI-URL")?.message
		put(new Attribute(Attribute.KEY_Content, url))
	}

}
