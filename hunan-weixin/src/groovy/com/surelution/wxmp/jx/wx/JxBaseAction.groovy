package com.surelution.wxmp.jx.wx

import static com.surelution.whistle.core.Attribute.KEY_Content
import static com.surelution.whistle.core.Attribute.KEY_CreateTime
import static com.surelution.whistle.core.Attribute.KEY_FromUserName
import static com.surelution.whistle.core.Attribute.KEY_MsgType
import static com.surelution.whistle.core.Attribute.KEY_ToUserName
import grails.util.Holders

import javax.servlet.ServletRequest

import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.BaseAction
import com.surelution.wxmp.jx.AdditionalIncomeMessage
import com.surelution.wxmp.jx.IncomeMessage
import com.surelution.wxmp.jx.Subscriber


abstract class JxBaseAction extends BaseAction {
	private static ThreadLocal<ServletRequest> map = new ThreadLocal<ServletRequest>()
	
	public static void initRequest(ServletRequest sr) {
		map.set(sr)
	}
	
	private Subscriber subscriber;
	
	final public String getRootPath() {
//		ServletRequest r = map.get()
//		return r.getServerName() + r.getServletContext().getContextPath()
		"${Holders.config.app.web.path}"
	}

	final public void preExecute() {
		String openId = getParam(KEY_FromUserName)
		subscriber = Subscriber.findByOpenId(openId)
		if(!subscriber) {
			subscriber = new Subscriber()
			subscriber.openId = openId
			subscriber.save(flush:true)
		}
		
		Set<String> paramNames = paramNames()
		IncomeMessage sub = new IncomeMessage()
		sub.setContent(getParam(KEY_Content))
		
		sub.setCreateTime(Long.parseLong(getParam(KEY_CreateTime)))
		sub.setFromUserName(getParam(KEY_FromUserName)) 
		sub.setMsgId(getParam("MsgId"))
		sub.setMsgType(getParam(KEY_MsgType))
		sub.setToUserName(getParam(KEY_ToUserName))
		sub.save(flush:true)

		paramNames.remove(KEY_Content)
		paramNames.remove(KEY_CreateTime)
		paramNames.remove(KEY_FromUserName)
		paramNames.remove("MsgId")
		paramNames.remove(KEY_MsgType)
		paramNames.remove(KEY_ToUserName)

		paramNames.each {name ->
			AdditionalIncomeMessage a = new AdditionalIncomeMessage()
			a.setMessage(sub)
			a.setName(name)
			a.setValue(getParam(name))
			a.save(flush:true)
		}
		
	}
	
	protected Subscriber getSubscriber() {
		subscriber
	}
    
    protected boolean isMenu(String key) {
        getParam(Attribute.KEY_MsgType) == "event" && getParam("Event") == "CLICK" && getParam("EventKey") == key
    }
	
	def loadService(String name) {
		def ctx = map.get().servletContext.getAttribute(GrailsApplicationAttributes.APPLICATION_CONTEXT)
		return ctx.getBean(name)
	}
}
