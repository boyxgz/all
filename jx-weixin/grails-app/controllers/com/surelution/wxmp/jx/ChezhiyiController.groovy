package com.surelution.wxmp.jx

import com.surelution.whistle.core.Auth2Util

class ChezhiyiController {

    def index() { }
	
	def dalaGift() {
		
	}

	def thirdpartTakingOn() {
		def takingOn
		def openId = params.openId
		if(!openId) {
			def code = params.code
			openId = Auth2Util.getOpenidByCode(code)
			takingOn = new ThirdpartTakingOn()
			takingOn.openId = openId
		} else {
			takingOn = new ThirdpartTakingOn(params)
			takingOn.save(flush:true)
			flash.message = "提交成功，我们会尽快联系您。中国石油浙江嘉兴分公司感谢您的支持！"
		}
		[thirdpartTakingOnInstance:takingOn]
	}
}
