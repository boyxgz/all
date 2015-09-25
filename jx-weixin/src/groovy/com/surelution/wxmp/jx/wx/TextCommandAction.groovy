package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.KeyedMessage;

class TextCommandAction extends JxBaseAction {

	@Override
	public boolean accept() {
		"0" == getParam(Attribute.KEY_Content).trim()
	}

	@Override
	public void execute() {
		def cmd = KeyedMessage.findByKey('TEXT-COMMAND')
		put(new Attribute(Attribute.KEY_Content, cmd.message))
	}

}
