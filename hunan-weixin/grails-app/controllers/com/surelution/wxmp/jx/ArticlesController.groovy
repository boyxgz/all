package com.surelution.wxmp.jx

class ArticlesController {

    def index() { }
	
	def network(Long id) {
		if(!id) {
			id = 1
		}
		def branch = Branch.get(id)
		def districts = District.findAllByBranch(branch)
		def lng = params.longitude
		def lat = params.latitude
		if(lng && lat) {
			double longitude = Double.parseDouble(lng)
			double latitude = Double.parseDouble(lat)
			println latitude
			println longitude
			//http://${rootPath}/navigation/go?orig=${x},${y}&dest=${stationId}
			return [longitude:longitude, latitude:latitude, districts:districts]
		}
		[districts:districts, branch:branch]
	}
	
	def branch() {
		def lng = params.longitude
		def lat = params.latitude
		[lng:lng,lat:lat]
	}
	
	def test() {}
	
	def uploadIt() {
		def myeditor = params.myeditor
		println myeditor
	}
}
