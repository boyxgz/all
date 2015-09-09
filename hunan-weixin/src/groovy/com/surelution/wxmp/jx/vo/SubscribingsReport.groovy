package com.surelution.wxmp.jx.vo

import java.text.SimpleDateFormat

import com.surelution.wxmp.jx.Branch
import com.surelution.wxmp.jx.District
import com.surelution.wxmp.jx.GasStation
import com.surelution.wxmp.jx.Subscribing



class SubscribingsReport {
	 
	 GasStation station
	 District district
	 Branch  branch
	 Long count	
	 Long yestodayCount
	
	 Long getYestodayStationCount() {
		 def calendar = Calendar.instance

		 int orderYear = calendar.get(Calendar.YEAR)
		 int orderMoth = calendar.get(Calendar.MONTH)
		 int orderDay  = calendar.get(Calendar.DAY_OF_MONTH)
		 
		 def sdf = new SimpleDateFormat("yyyy-MM-dd")
		 
		 Date today = sdf.parse(orderYear+"-"+(orderMoth+1)+"-"+orderDay)
		 
		 def yestodayTime  = today.getTime() - 1000*60*60*24
		 
		 Date yestoday = new Date()
		 yestoday.setTime(yestodayTime);
		 
		if(station) {
			def searchClosure =  {
					between("subscribingAt",yestoday,today)
					eq("comeFrom",String.valueOf(station.id))
			}
			
			def c = Subscribing.createCriteria()
			def result = c.list (searchClosure)
			
			return result.size()
		}
		
		0
		
	 }
	 
	 
}
