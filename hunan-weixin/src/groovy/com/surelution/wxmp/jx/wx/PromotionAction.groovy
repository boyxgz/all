package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.KeyedMessage

class PromotionAction extends JxBaseAction {

	@Override
	public boolean accept() {
        def content = getParam(Attribute.KEY_Content)
		(content && "1" == content.trim()) || isMenu("saving")
	}

	@Override
	public void execute() {
		NewsAttribute na = new NewsAttribute()
		na.add("最红星期五", "", "http://${rootPath}/app-images/hongxingqi5.jpg", "http://${rootPath}/promotion/uSmile")
        na.add("优惠资讯轻松享", "", "http://${rootPath}/app-images/qrcode.jpg", "http://${rootPath}/promotion/gas")
		put(na)
	}

}
