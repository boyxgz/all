/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.MultiNewsMessage
import com.surelution.wxmp.jx.MultiNewsMessageItem;
import com.surelution.wxmp.jx.MultiNewsMessageItemBranch;
import com.surelution.wxmp.jx.KeyedMessage;

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class DynMatchAction extends JxBaseAction {
	private MultiNewsMessage mnm;

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		if(getParam(Attribute.KEY_MsgType) == "event" && getParam("Event") == "CLICK") {
			String eventKey = getParam("EventKey")
			mnm = MultiNewsMessage.findByMenuKey(eventKey)
		}
		return mnm != null;
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		NewsAttribute na = new NewsAttribute()
		def items = MultiNewsMessageItem.createCriteria().list {
			eq('message', mnm)
			eq('active', true)
			order('firstNews', 'desc')
		}
		def branch = subscriber.preferedBranch
		items.each {item->
			if(item.globalMessage ||
				(branch && MultiNewsMessageItemBranch.findByItemAndBranch(item, branch))) {
				na.add(item.title, item.description, item.pictureUrl, item.url)
			}
		}
		def km = KeyedMessage.findByKey("history-message")
		def title = km?km.message:"过期内容"
		if(mnm.keepHistory) {
			na.add(title, "", "http://${rootPath}/images/refresh.png", "${rootPath}/multiNewsMessage/history/${mnm.menuKey}")
		}
		put(na)
	}

}
