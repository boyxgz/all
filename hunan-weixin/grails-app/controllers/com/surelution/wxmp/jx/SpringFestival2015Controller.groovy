package com.surelution.wxmp.jx

import grails.util.Holders

import java.text.SimpleDateFormat

import com.surelution.whistle.core.Auth2Util
import com.surelution.whistle.core.Auth2Util.AuthScope
import com.surelution.whistle.push.UserInfo

class SpringFestival2015Controller {

	def spring2015InvitingTopService
	
    def registerGreeting(Long id) {
		def voucher = RegisterVoucher.get(id)
		def subscriber = voucher.owner
		
		def dest = Auth2Util.buildRedirectUrl("http://${Holders.config.app.web.path}/springFestival2015/description", subscriber.openId, AuthScope.BASE)
		[voucher:voucher, dest:dest]
	}

	/**
	 * 
	 * @param id
	 * @return
	 * 用户微信上面分享了，才激活兑奖码
	 */
	def shareVoucher(Long id) {
		def voucher = RegisterVoucher.get(id)
		if(voucher) {
			voucher.enabled = true
			voucher.save(flush:true)
		}
		render(contentType: "application/json") {
			share(status:"true")
		}
	}

	def description() {
		def code = params.code
		def sharer = Subscriber.findByOpenId(params.state)
		def reader = Auth2Util.getOpenidByCode(code)
//		def c = Invitation.countByHostAndGuestOpenid(sharer, reader)
//		if(c < 1) {
			def invitation = new Invitation()
			invitation.host = sharer
			invitation.guestOpenid = reader
			invitation.save(flush:true)
//		}
		def readerSubscribed = false
		def u = UserInfo.loadUserInfo(reader)
		if(u) {
			readerSubscribed = (u.subscribe != 0)
		}
		[readerSubscribed:readerSubscribed]
	}

	def invitationTop() {
		def code = params.code
		def openId = Auth2Util.getOpenidByCode(code)
//		def openId = "oqV4Pt9VEzR9dAd0zOfDo4-ghDXg"
		def subscriber = Subscriber.findByOpenId(openId)
		def cri = DealInvitation.createCriteria().get() {
			eq('host', subscriber)
			le('dateCreated', new Date(1425571199000l))
			projections {
				count('guest', 'c')
			}
		}
		int myCount = cri
		int myPositon = spring2015InvitingTopService.topAt(myCount)
		def dest = Auth2Util.buildRedirectUrl("http://${Holders.config.app.web.path}/springFestival2015/description", subscriber.openId, AuthScope.BASE)
		[myCount:myCount, myPositon:myPositon,
			top100:spring2015InvitingTopService.top(100),
			top5:spring2015InvitingTopService.top(5),
			top10:spring2015InvitingTopService.top(10),
			top50:spring2015InvitingTopService.top(50), 
			maxCount : spring2015InvitingTopService.maxCount(), 
			dest:dest]
	}
}
