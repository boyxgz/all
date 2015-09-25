package com.surelution.wxmp.jx

import com.surelution.whistle.core.Auth2Util
import com.surelution.whistle.core.Auth2Util.AuthScope
import com.surelution.whistle.push.UserInfo;

class TestController {

    def index() { }

	def path(String id) {
		def dest = "http://surelution.jios.org/jx-weixin/test/path2"
		def url = Auth2Util.buildRedirectUrl(dest, id, AuthScope.BASE)
		redirect(url:url) 
	}

	def path2() {
		def code = params.code
		def uuid = params.state
		def readerOpenId = Auth2Util.getOpenidByCode(code)
		def userInfo = UserInfo.loadUserInfo(readerOpenId)
		println uuid
		println userInfo.nickname
		render(userInfo.nickname)
	}
}
