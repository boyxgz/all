package com.surelution.wxmp.jx
import static groovyx.net.http.ContentType.*
import static groovyx.net.http.Method.*
import groovyx.net.http.EncoderRegistry
import groovyx.net.http.HTTPBuilder
import groovy.json.JsonSlurper

class WeatherService {
	
    def fetchWeather(java.sql.Date date) {
		def weather = Weather.findByDate(date)
		if(!weather) {
			weather = new Weather()
			weather.date = date
			weather.completed = false
			weather.save(flush:true)
		}
		if(!weather.completed) {
			def withException = false
			def areaes = WeatherArea.list()
			areaes.each {area->
				def item = WeatherItem.findByWeatherAndBranch(weather, area.branch)
				if(!item) {
					try{
						def code = WeatherArea.findByBranch(area.branch)
						def url = "/data/cityinfo/${code.code}.html"
						println url
						def weatherItem = getItem(url)
						weatherItem.branch = area.branch
						weatherItem.weather = weather
						weatherItem.save(flush:true)
					}catch(e) {
						withException = true
					}
				}
				if(!withException) {
					weather.completed = true
					weather.save(flush:true)
				}
			}
		}
		return WeatherItem.findAllByWeather(weather)
	}

	private WeatherItem getItem(String url) {
		def slurper = new JsonSlurper()
		
		def http = new HTTPBuilder('http://www.weather.com.cn')
		http.encoderRegistry = new EncoderRegistry( charset: 'utf-8' )
		def map
		
		http.get(path: url, requestContentType: URLENC ) {resp,json ->
			map = slurper.parseText(json.text()).weatherinfo
			def item = new WeatherItem()
			item.description = map.weather
			item.temp1 = map.temp1
			item.temp2 = map.temp2
			item.img1 = map.img1
			item.img2 = map.img2
			return item
		}
	}
}
