package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.KeyedMessage;

class CardServiceAction extends JxBaseAction {

	@Override
	public boolean accept() {
		"1" == getParam(Attribute.KEY_Content).trim()
	}

	@Override
	public void execute() {
		NewsAttribute nm = new NewsAttribute()
		def cardServiceTitle = KeyedMessage.findByKey("CARD-SERVICE-TITLE").message
		def cardServiceDesc = KeyedMessage.findByKey("CARD-SERVICE-DESC").message
		nm.add(cardServiceTitle, cardServiceDesc, "http://${rootPath}/app-images/card.png", "http://www.card.petrochina.com.cn/")
		put(nm);
	}

}
