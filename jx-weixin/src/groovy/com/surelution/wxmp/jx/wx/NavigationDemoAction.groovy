package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute;
import com.surelution.whistle.core.NewsAttribute;
import com.surelution.wxmp.jx.KeyedMessage;

class NavigationDemoAction extends JxBaseAction {

	@Override
	public boolean accept() {
        def content = getParam(Attribute.KEY_Content)
		(content && "2" == getParam(Attribute.KEY_Content).trim()) || isMenu("navigation")
	}

	@Override
	public void execute() {
		NewsAttribute nm = new NewsAttribute()
		def navTitle = KeyedMessage.findByKey("NAVIGATION-DEMO-TITLE").message
		def navDesc = KeyedMessage.findByKey("NAVIGATION-DEMO-DESC").message
		nm.add(navTitle, navDesc, "http://" + getRootPath() + "/app-images/navigation_demo.jpg", "http://" + getRootPath() + "/promotion/locationDemo");
		put(nm);
	}

}
