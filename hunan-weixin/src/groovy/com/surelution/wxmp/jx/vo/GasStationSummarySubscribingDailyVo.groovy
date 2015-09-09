/**
 * 
 */
package com.surelution.wxmp.jx.vo

import groovy.time.TimeCategory;

import com.surelution.wxmp.jx.GasStation

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class GasStationSummarySubscribingDailyVo {

	GasStation key
	int total
	int yesterday
	
	static List populate(List subscribings) {
		def map = [:]
		def lastday = new Date().clearTime()
		use(TimeCategory) {
			lastday = lastday - 1.day
		}
		subscribings.each {
			def station = GasStation.get(it.comeFrom)
			if(station) {
				def c = map[station]
				if(!c) {
					c = new GasStationSummarySubscribingDailyVo(key:station)
					map.put(station, c)
				}
				c.total = c.total + 1
				def subscribingAt = it.subscribingAt.clearTime()
				if(subscribingAt == lastday) {
					c.yesterday = c.yesterday + 1
				}
			}
		}
		
		return map.keySet().sort().reverse().collect() {key->
			map[key]
		}
	}
}
