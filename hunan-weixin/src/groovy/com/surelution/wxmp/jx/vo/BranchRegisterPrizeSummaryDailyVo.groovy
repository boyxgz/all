/**
 * 
 */
package com.surelution.wxmp.jx.vo

import groovy.time.TimeCategory

import com.surelution.wxmp.jx.Branch;
import com.surelution.wxmp.jx.GasStation

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class BranchRegisterPrizeSummaryDailyVo {

	Branch key
	int yesterday
	int total
	
	static List populate(List registerPrizes) {
		def map = [:]
		def lastday = new Date().clearTime()
		use(TimeCategory) {
			lastday = lastday - 1.day
		}
		registerPrizes.each {prize->
			if(prize.awardedAt && prize.gasStation) {
				def key = prize.gasStation.district.branch
				def c = map[key]
				if(!c) {
					c = new BranchRegisterPrizeSummaryDailyVo(key:key)
					map.put(key, c)
				}
				if(prize.awardedAt.clearTime() == lastday) {
					c.yesterday = c.yesterday + 1
				}
				c.total = c.total + 1
			}
		}
		map.keySet().sort().reverse().collect() {key->
			map[key]
		}
	}
}
