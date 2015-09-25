package com.surelution.wxmp.jx.wx;

import com.surelution.id.IDUtil
import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.KeyedMessage

public class PriseStationAction extends JxBaseAction {

	@Override
	public boolean accept() {
		"9" == getParam(Attribute.KEY_Content).trim()
	}

	@Override
	public void execute() {
		def msg = KeyedMessage.findByKey("PRISE-STATION").message
		def refedId = IDUtil.getRefusedId((int)(long)subscriber.id, 3)
		put(new Attribute(Attribute.KEY_Content, "${msg}[${refedId}]"))
	}

}
