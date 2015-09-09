package com.surelution.wxmp.jx

class SubscribingFrom {

    static constraints = {
		comeFrom unique:true
		gasStation nullable:true
		branch nullable:true
    }
	
	String comeFrom
	GasStation gasStation
	Branch branch
	String name
	String description
	
	public static SubscribingFrom searchByComeFrom(String comeFrom) {
		int cf = comeFrom as int
		def gasStation = GasStation.get(cf)
		if(gasStation) {
			def sf = new SubscribingFrom()
			sf.comeFrom = comeFrom
			sf.gasStation = gasStation
			sf.branch = gasStation.district.branch
			sf.name = gasStation.name
			sf.description = "${gasStation.district.branch.name}>>${gasStation.district.name}>>${gasStation.name}"
			return sf
		} else {
			return SubscribingFrom.findByComeFrom(comeFrom)
		}
	}
}
