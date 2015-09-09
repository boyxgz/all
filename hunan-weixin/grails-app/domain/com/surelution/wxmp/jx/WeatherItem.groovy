package com.surelution.wxmp.jx

class WeatherItem {

    static constraints = {
		weather unique:'branch'
    }
	
	Weather weather
	Branch branch
	String temp1
	String temp2
	String description
	String img1
	String img2
}
