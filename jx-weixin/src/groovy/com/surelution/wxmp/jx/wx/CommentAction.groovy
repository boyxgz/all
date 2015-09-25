package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.KeyedMessage

class CommentAction extends JxBaseAction {

	private String content

	@Override
	public boolean accept() {
		content = getParam(Attribute.KEY_Content)
//		if(content) {
//			content = content.trim()
//			return content.startsWith("4") || content.startsWith("意见")
//		}
//		return false;
        content && (content.trim().startsWith("小U") || content.trim().startsWith("小u"))
	}

	@Override
	public void execute() {
        content = content.trim();
        content = content.substring(2);
		def msg
		if(content) {
			def title = KeyedMessage.findByKey("COMMENT-ACCEPTED").message
			msg = "${title}${content}"
		} else {
			def title = KeyedMessage.findByKey("COMMENT-DESCRIPTION").message
			msg = "${title}"
		}
		put(new Attribute(Attribute.KEY_Content, msg))
	}

}
