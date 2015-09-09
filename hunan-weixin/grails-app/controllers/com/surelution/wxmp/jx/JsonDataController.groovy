package com.surelution.wxmp.jx

import com.surelution.locator.Locator;
import com.surelution.whistle.core.NewsAttribute;

import grails.converters.JSON;

class JsonDataController {

    def branch() {
		render Branch.list() as JSON
	}
	
	def district(Long id) {
		def branch = Branch.get(id)
		if(branch) {
			def districts = District.findAllByBranch(branch)
			render districts as JSON
		}
	}
	
	def station(Long id) {
		def district = District.get(id)
		def stations = GasStation.findAllByDistrict(district)
		render stations as JSON
	}
	
	def test() {
		def subscriber = Subscriber.get(1)
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
		location.subscriber = Subscriber.get(1)
		location.latitude = 30
		location.longitude = 120
		location.precision = 60
//		def time = Long.parseLong(getParam("CreateTime")) * 1000
		location.createAt = new Date()
		location.save(flush:true)
		
		def pois = Locator.instance.near(needPushMessage?5:1, location.longitude.floatValue(), location.latitude.floatValue())
		def stationId = pois.first().location.id
		def station = GasStation.get(stationId)
		def branch = station.district.branch
		subscriber.preferedBranch = branch
		subscriber.save(flush:true)
		
//		if(needPushMessage) {
//			NewsAttribute na = new NewsAttribute()
//			boolean first = true
//			pois.each {poi->
//				def sId = poi.location.id
//				def s = GasStation.get(sId)
//				def title = "${s.name}(${s.address}),距离约${(int)(poi.distance/1000)}公里,驾车约需${(int)(poi.duration/60)}分钟"
//				
//				String description = "祝您行车平安"
//				def url = "http://${rootPath}/navigation/go?orig=${x},${y}&dest=${sId}"
//				def picUrl = "http://${rootPath}/app-images/${first?'map.png':'pc_logo.png'}"
//				first = false
//				na.add(title, description, picUrl, url)
//			}
//			def moreStation = KeyedMessage.findByKey("MORE-STATION").message
//			na.add(moreStation, "", "http://${rootPath}/app-images/${first?'map.png':'pc_logo.png'}", "http://${rootPath}/articles/network?latitude=${location.latitude}&longitude=${location.longitude}")
////			put(na);
//		}
	
	}
}
