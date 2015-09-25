package com.surelution.wxmp.jx

import com.surelution.whistle.push.UserInfo;

class SubscriberController {

    def index() { }
	
	def headImg(Long id) {
		def subscriber = Subscriber.get(id)
		def userInfo = UserInfo.loadUserInfo(subscriber.openId)
		def url = new URL(userInfo.headImgUrl)
		response.outputStream << url.openStream()
	}
	
	def userInfo(Long id) {
		def subscriber = Subscriber.get(id)
		def json = UserInfo.loadUserInfoAsJson(subscriber.openId)
		response.getWriter().write(json)
	}
}
