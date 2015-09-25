/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute;
import com.surelution.wxmp.jx.KeyedMessage;

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class PriseAction extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		isMenu("gasPrise") ||
			(getParam(Attribute.KEY_MsgType) == Attribute.Msg_Type_TEXT 
				&& getParam(Attribute.KEY_Content)?.contains("油价"))
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def msg = KeyedMessage.findByKey("gas-prise")?.message
		put(new Attribute(Attribute.KEY_Content, msg))
	}

}
