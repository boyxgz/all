/**
 * 
 */
package com.surelution.wxmp.jx.vo

import com.surelution.wxmp.jx.GasStation

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class GasStationSubscribingDailyVo {

	GasStationDateKey key
	int count
	
	static List populate(List subscribings) {
		def map = [:]
		subscribings.each {
			def station = GasStation.get(it.comeFrom)
			if(station) {
				def key = new GasStationDateKey(gasStation:station, date:it.subscribingAt)
				def c = map[key]
				if(!c) {
					map.put(key, 1)
				} else {
					map[key] = c + 1
				}
			}
		}
		
		return map.keySet().sort().reverse().collect() {key->
			new GasStationSubscribingDailyVo(key:key, count:map[key])
		}
	}
}
