package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.KeyedMessage

class DefaultAction extends JxBaseAction {

	@Override
	public boolean accept() {
		return true;
	}

	@Override
	public void execute() {
		def cmd = KeyedMessage.findByKey('TEXT-COMMAND')
		put(new Attribute(Attribute.KEY_Content, cmd.message))
	}

}
