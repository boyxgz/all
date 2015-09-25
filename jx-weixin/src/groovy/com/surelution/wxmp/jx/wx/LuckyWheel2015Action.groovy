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
class LuckyWheel2015Action extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		isMenu("lucky-wheel-2015") || 
			(getParam(Attribute.KEY_MsgType) == Attribute.Msg_Type_TEXT 
			&& getParam(Attribute.KEY_Content)?.contains("大转盘"))
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def na = new NewsAttribute()
		na.add("幸运轮盘转！转！转！千元油卡等你拿！", 
			"中国石油嘉兴公司幸运大转盘送千元油卡！活动期间每天转一次，转到就是赚到！点击页面立即参与抽奖活动！", 
			"http://${rootPath}/images/lucky-wheel-2015.jpg?v=2", 
			KeyedMessage.findByKey("fall-2015-lucky-wheel").message)
		put(na)
	}

}
