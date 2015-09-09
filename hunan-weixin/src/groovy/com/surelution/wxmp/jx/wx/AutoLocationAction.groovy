/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.locator.Locator
import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute
import com.surelution.whistle.push.UserInfo;
import com.surelution.wxmp.jx.AutoLocation
import com.surelution.wxmp.jx.GasStation
import com.surelution.wxmp.jx.KeyedMessage

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class AutoLocationAction extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		getParam(Attribute.KEY_MsgType) == "event" && getParam("Event") == "LOCATION"
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {		
		def lastAls = AutoLocation.createCriteria().list() {
			eq('subscriber',subscriber)
			order('createAt', 'desc')
		}
		boolean needPushMessage = true
		if(lastAls) {
			def als = lastAls.first()
			needPushMessage = (System.currentTimeMillis() - als.createAt.time) > (20 * 60 * 1000)
		}
		
		def location = new AutoLocation()
		location.subscriber = subscriber
		location.latitude = Double.parseDouble(getParam("Latitude"))
		location.longitude = Double.parseDouble(getParam("Longitude"))
		location.precision = Double.parseDouble(getParam("Precision"))
		def time = Long.parseLong(getParam("CreateTime")) * 1000
		location.createAt = new Date(time)
		location.save(flush:true)
		
		def pois = Locator.instance.near(needPushMessage?5:1, location.longitude.floatValue(), location.latitude.floatValue())
		def stationId = pois.first().location.id
		def station = GasStation.get(stationId)
		def branch = station.district.branch
		subscriber.preferedBranch = branch
		if(subscriber?.preferedBranch?.wxGroupId) {
			UserInfo.updateUserGroup(subscriber.openId,subscriber.preferedBranch.wxGroupId)
		}
		subscriber.save(flush:true)

		if(needPushMessage) {
			NewsAttribute na = new NewsAttribute()
			boolean first = true
			pois.each {poi->
				def sId = poi.location.id
				def s = GasStation.get(sId)
				def title = "${s.name}(${s.address}),距离约${(int)(poi.distance/1000)}公里,驾车约需${(int)(poi.duration/60)}分钟"
				
				String description = "祝您行车平安"
				def url = "http://${rootPath}/navigation/go?orig=${location.latitude},${location.longitude}&dest=${sId}"
				def picUrl = "http://${rootPath}/app-images/${first?'map.png':'pc_logo.png'}"
				first = false
				na.add(title, description, picUrl, url)
			}
			def moreStation = KeyedMessage.findByKey("MORE-STATION").message
			na.add(moreStation, "", "http://${rootPath}/app-images/${first?'map.png':'pc_logo.png'}", 
				"http://${rootPath}/articles/branch?latitude=${location.latitude}&longitude=${location.longitude}")
			put(na);
		}
	}

}
