package com.surelution.wxmp.jx

import com.surelution.whistle.core.Auth2Util;

class ArticlesController {

    def carExhibition() { }
	
	def timelineShare() {
		def dest = "http://180.173.75.45/jx-weixin/trackableArticle/path/1"
		def url = Auth2Util.buildRedirectUrl(dest, null, Auth2Util.AuthScope.BASE)
		[url:url]
	}
	
	def waiting() {
		def code = params.code
		def state = params.state
		println code
		def openId = Auth2Util.getOpenidByCode(code)
		render("shit${openId}")
	}
	
}
