package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.push.UserInfo
import com.surelution.wxmp.jx.AppVar
import com.surelution.wxmp.jx.DealInvitation
import com.surelution.wxmp.jx.GasStation
import com.surelution.wxmp.jx.Invitation
import com.surelution.wxmp.jx.KeyedMessage
import com.surelution.wxmp.jx.Subscriber
import com.surelution.wxmp.jx.Subscribing

class SubscribeAction extends JxBaseAction {

	@Override
	public boolean accept() {
		getParam(Attribute.KEY_MsgType) == "event" && getParam("Event") == "subscribe"
	}

	@Override
	public void execute() {
		def now = new Date()
		def av = AppVar.findByKey("2015-register-id-from")?.value
		def eventKey = getParam("EventKey")
		if(eventKey) {
			//qrscene_8
			if(eventKey.startsWith("qrscene_")) {
				def comeFrom = eventKey.substring("qrscene_".length())
				def subscribing = new Subscribing()
				subscribing.subscriber = subscriber
				subscribing.subscribingAt = now
				subscribing.comeFrom = comeFrom
				subscribing.save(flush:true)
				
				if(comeFrom) {
					try{
						GasStation station = GasStation.get(comeFrom)
						if(station) {
							subscriber.preferedBranch = station.district?.branch
							if(subscriber?.preferedBranch?.wxGroupId) {
								UserInfo.updateUserGroup(subscriber.openId,subscriber.preferedBranch.wxGroupId)
							}
							subscriber.save(flush:true)
						}
					}catch(Throwable e){}
				}
			}
		}
		
		def invitations = Invitation.createCriteria().list() {
			eq('guestOpenid', subscriber.openId)
			order('dateCreated', 'desc')
		}

		def invitation
		if(invitations && invitations.size() > 0) {
			invitation = invitations.get(0)
			def di = new DealInvitation()
			di.host = invitation.host
			di.guest = Subscriber.findByOpenId(invitation.guestOpenid)
			di.invitation = invitation
			di.save(flush:true)
		}
		
//		def voucher = RegisterVoucher.findByOwner(subscriber)
//		if(!voucher) {
//			voucher = new RegisterVoucher()
//			voucher.owner = subscriber
//			voucher.status = VoucherStatus.ACTIVED
//			def sdf = new SimpleDateFormat("yyyy-MM-dd")
//			voucher.availableBeginAt = sdf.parse("2015-2-11")
//			voucher.availableEndAt = sdf.parse("2015-3-6")
//			voucher.amount = 2
//			voucher.enabled = true
//			voucher.save(flush:true)
//		}
		def msg = KeyedMessage.findByKey("WELCOME").message
		def att = new Attribute(Attribute.KEY_Content, msg)
//		def na = new NewsAttribute()
//		def title = KeyedMessage.findByKey('register-welcome-title').message
//		def description= KeyedMessage.findByKey('register-welcome-desc').message
//		def picUrl = "http://${rootPath}/images/spring-2015-title.jpg"
//		def url = "http://${rootPath}/springFestival2015/registerGreeting/${voucher.id}"
//		na.add(title, description, picUrl, url)
		put(att)
	}

}
