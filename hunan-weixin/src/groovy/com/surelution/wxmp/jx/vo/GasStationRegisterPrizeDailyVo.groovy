/**
 * 
 */
package com.surelution.wxmp.jx.vo

import com.surelution.wxmp.jx.GasStation;

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class GasStationRegisterPrizeDailyVo {

	GasStationDateKey key
	int count
	
	static List populate(List registerPrizes) {
		def s
		def map = [:]
		registerPrizes.each {prize->
			if(prize.awardedAt && prize.gasStation) {
				def key = new GasStationDateKey(gasStation:prize.gasStation, date:prize.awardedAt)
				def c = map[key]
				if(!c) {
					map.put(key, 1)
				} else {
					map[key] = c + 1
				}
			}
		}
		map.keySet().sort().reverse().collect() {key->
			new GasStationRegisterPrizeDailyVo(key:key, count: map[key])
		}
	}
}
