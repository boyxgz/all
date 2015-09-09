package com.surelution.wxmp.jx

import grails.util.Holders

import com.surelution.whistle.core.Auth2Util

class InvitationController {
	
	def dashboard() {
//		println Auth2Util.buildRedirectUrl("http://shhansi.jios.org/hunan-weixin/invitation/dashboard", null, Auth2Util.AuthScope.BASE)
		def code = params.code
		def readerOpenId = Auth2Util.getOpenidByCode(code)
		def me = Subscriber.findByOpenId(readerOpenId)
		def type = ChangshaSubscribingGiftType.findByKey("blank")
		def opens = ChangshaSubscribingGift.createCriteria().list() {
			eq('subscriber', me)
			ne('type', type)
			eq('status', ChangshaSubscribingGift.GiftStatus.OPENED)
		}
		
		def waitingOpen = ChangshaSubscribingGift.createCriteria().list() {
			eq('subscriber', me)
			eq('status', ChangshaSubscribingGift.GiftStatus.NEW)
		}
		
		def paids = ChangshaSubscribingGift.createCriteria().list() {
			eq('subscriber', me)
			or {
				eq('status', ChangshaSubscribingGift.GiftStatus.PAID)
				and {
					eq('status', ChangshaSubscribingGift.GiftStatus.OPENED)
					eq('type', type)
				}
			}
		}
		
//		def dest = KeyedMessage.findByKey("subscribing-guide-url").message
//		def invitations = Invitation.findAllByHost(me)
////		def dest = "http://mp.weixin.qq.com/s?__biz=MzA3MTIzNzgwMQ==&mid=201386795&idx=1&sn=aa4d4b1b059d275d8081b9c3b6023681#rd"
		def dest = "${Holders.config.app.web.path}invitation/path"
		println dest
		def url = Auth2Util.buildRedirectUrl(dest, readerOpenId, Auth2Util.AuthScope.BASE)
//		def targets = InvitationScoreSubscribingLog.findAllBySubscriber(me)?.collect() {
//			UserInfo.loadUserInfo(it.target.openId)
//		}
//		
//		def score = InvitationScore.findBySubscriber(me)?.balance
		[opens:opens, waitingOpen:waitingOpen, paids:paids, url:url]
	}

	def path() {
		if(System.currentTimeMillis()  < 1419091200000) {
			//the url will be ../trackableArticle/path/(articleId)?code=(TheCodeFromAuth2.0)&state=(sharerOpenId)
			def code = params.code
			def sharerOpenId = params.state
			def readerOpenId = Auth2Util.getOpenidByCode(code)
			def sharer = Subscriber.findByOpenId(sharerOpenId)
			def invitation = new Invitation()
			invitation.host = sharer
			invitation.guestOpenid = readerOpenId
			invitation.save(flush:true)
		}
		
		def dest = KeyedMessage.findByKey("subscribing-guide-url").message
		
		redirect(url:dest)
	}

	def swipe(Long id) {
		if(System.currentTimeMillis()  < 1419091200000) {
			def gift = ChangshaSubscribingGift.get(id)
			
			def dest = "${Holders.config.app.web.path}invitation/path"
			def url = Auth2Util.buildRedirectUrl(dest, gift.subscriber.openId, Auth2Util.AuthScope.BASE)
			[gift:gift, url:url]
		} else {
			render(view:'outOfTime')
		}
	}

	def open(Long id) {
		def gift = ChangshaSubscribingGift.get(id)
		gift.status = ChangshaSubscribingGift.GiftStatus.OPENED
		gift.save(flush:true)
		
		render(contentType: "application/json") {
			g(status:"open")
		}
	}
}
