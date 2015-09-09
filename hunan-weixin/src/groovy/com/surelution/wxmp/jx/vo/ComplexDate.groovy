/**
 * 
 */
package com.surelution.wxmp.jx.vo

import groovy.time.TimeCategory

import java.text.SimpleDateFormat

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class ComplexDate {

	Date label
	Date firstSight
	Date firstSightNextDay
	
	public ComplexDate(Date seed) {
		label = new Date(seed.time)
		label = label.clearTime()
		firstSight = label
		use(TimeCategory) {
			firstSightNextDay = label + 1.days
		}
	}
	
	public static List<ComplexDate> generate(Date from, Date to) {
		def ts = []
		def curr = new Date(from.time)
		use(TimeCategory) {
			while(curr < to) {
				def date = new ComplexDate(curr)
				ts.add(date)
				curr = curr + 1.days
			}
		}
		ts
	}
	
	public static main(String[] args) {
		def sdf = new SimpleDateFormat("yyyy-MM-dd")
		def ts = generate(sdf.parse("2015-1-1"), new Date())
		ts.each {
			println "${it.label}, ${it.firstSightNextDay}"
		}
	}
}
