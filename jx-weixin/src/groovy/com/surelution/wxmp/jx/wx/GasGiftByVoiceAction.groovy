/**
 * 
 */
package com.surelution.wxmp.jx.wx

import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.exceptions.RoarGift2TimesException

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class GasGiftByVoiceAction extends JxBaseAction {
	
	public static final String TEXT = "中国石油在我身边"

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		getParam("MsgType") == "voice"
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def ctx = requestContext.servletContext.getAttribute(GrailsApplicationAttributes.APPLICATION_CONTEXT)
		def roarGiftService = ctx.getBean("roarGiftService")
		def att
		def content = getParam("Recognition")
		if(content == TEXT) {
			try{
				roarGiftService.confirmGift(subscriber, 760, content)
				def dest = "http://${rootPath}/gasGiftByVoice/myGift/${subscriber.openId}"
				att = new NewsAttribute()
				
				att.add("您获得了1升汽油", "点击查看使用方法。还有一个免费加满一箱油的机会，看仔细哦", "http://${rootPath}/images/roar-post.jpg", dest)
			}catch(RoarGift2TimesException e) {
				att = new Attribute(Attribute.KEY_Content, "本次活动您已经参加了一次，不能太贪心哦，您说的是：${content}")
			}
		} else {
			def msg
			if(content) {
				msg = "小U傻傻听不懂，再来，您说的是：${content}，请说：${TEXT}"
			} else {
				msg = "噶小声音？小U听勿清桑，再来"
			}
			att = new Attribute(Attribute.KEY_Content, msg)
		}
		put(att)
	}

	
}
