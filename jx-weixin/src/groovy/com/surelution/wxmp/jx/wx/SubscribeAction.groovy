package com.surelution.wxmp.jx.wx

import com.surelution.id.IDUtil;
import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.KeyedMessage;
import com.surelution.wxmp.jx.Subscriber

class SubscribeAction extends JxBaseAction {

	@Override
	public boolean accept() {
		getParam(Attribute.KEY_MsgType) == "event" && getParam("Event") == "subscribe"
	}

	@Override
	public void execute() {
		def msg = KeyedMessage.findByKey("WELCOME").message
		def refedId = IDUtil.getRefusedId((int)(long)subscriber.id, 3)
		put(new Attribute(Attribute.KEY_Content, "${msg}"))
	}

}
