package com.surelution.wxmp.jx

class MapController {
	
	def proxy() {
		def url = new URL(params.url)
		response.outputStream << url.openConnection().inputStream
	}
}
