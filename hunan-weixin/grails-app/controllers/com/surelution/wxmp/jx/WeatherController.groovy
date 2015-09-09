package com.surelution.wxmp.jx

class WeatherController {

	def weatherService

    def index() {
		def weatherItems = weatherService.fetchWeather(new java.sql.Date(System.currentTimeMillis()))
		[weatherItems:weatherItems]
	}
}
