package com.surelution.wxmp.jx

import com.surelution.whistle.push.UserInfo;

class SubscriberGateController {

    def info(String id) {
		def subscriber = Subscriber.get(id)
		render UserInfo.loadUserInfo(subscriber.openId)
	}
}
