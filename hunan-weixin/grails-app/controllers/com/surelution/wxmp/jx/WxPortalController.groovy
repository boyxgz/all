package com.surelution.wxmp.jx

import com.surelution.whistle.core.Auth2Util;
import com.surelution.wxmp.jx.Voucher.VoucherStatus;

class WxPortalController {

//    def index() { }

	def myVouchers() {
		def code = params.code
		def openId = Auth2Util.getOpenidByCode(code)
		def subscriber, vouchers
		if(openId) {
			subscriber = Subscriber.findByOpenId(openId)
			vouchers = Voucher.findAllByOwnerAndEnabled(subscriber, true)
		}
		[vouchers:vouchers]
	}
	
	def articles(String id) {
		def url = KeyedMessage.findByKey("article-url-${id}")?.message
		redirect(url:url)
	}
}
