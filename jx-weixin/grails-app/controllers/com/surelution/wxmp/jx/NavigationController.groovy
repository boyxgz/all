package com.surelution.wxmp.jx

import org.apache.commons.io.IOUtils
import org.json.JSONArray
import org.json.JSONObject

class NavigationController {

    def index() { }
	
	def go() {
//        def os = "android"
//        request.headerNames.each {
//            def value = request.getHeader(it)
//            println "${it}:${value}"
//        }
//        def userAgent = request.getHeader("user-agent")
//        if(userAgent) {
//            userAgent = userAgent.toLowerCase()
//            if(userAgent.contains("iphone")) {
//                os = "iphone"
//            }
//        }
		String orig = params.orig
		String dest = params.dest
		int destId = Integer.parseInt(dest);
		GasStation station = GasStation.get(destId);
	
		URL url = new URL(getBaiduDirectionApi(orig, station.latitude + "," + station.longitude));
		String lines = IOUtils.toString(url.openStream(), "utf-8");
		
		JSONObject root = new JSONObject(lines);
		JSONObject routes = root.getJSONObject("result").getJSONArray("routes").getJSONObject(0);
		
		List rs = new ArrayList()
		
		JSONArray steps = routes.getJSONArray("steps");
		for(int i = 0; i < steps.length(); i++) {
			JSONObject step = steps.getJSONObject(i);
			String html_instructions = step.getString("instructions");
			String distance = step.getString("distance");
			String duration = step.getString("duration");
			String[] words = [html_instructions,distance,duration]
			rs.add(words)
		}
		
		[routes:rs, station:station]
	}

	private String getBaiduDirectionApi(String origAddress, String destAddress) {
		StringBuilder apiUrl = new StringBuilder("http://api.map.baidu.com/direction/v1?mode=driving&origin=");
		apiUrl.append(origAddress);
		apiUrl.append("&destination=");
		apiUrl.append(destAddress);
		apiUrl.append("&output=json&ak=IcI1pSft9eplKbUm0p2487bd");
		apiUrl.append("&origin_region=北京&destination_region=北京")
		return apiUrl.toString();
	}
}
