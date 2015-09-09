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
//		String googleImageApi = "http://maps.googleapis.com/maps/api/staticmap?";
//		googleImageApi += "key=AIzaSyB76eufhJiBHXBQFXRE_d9S3AKxXYKpsEc&";
//		googleImageApi += "markers=color:green%7C";
//		
//		googleImageApi += station.latitude
//		googleImageApi += ",";
//		googleImageApi += station.longitude
//		googleImageApi += "&";
//		googleImageApi += "markers=color:red%7C";
//		googleImageApi += orig;
//		googleImageApi += "&";
//		googleImageApi += "sensor=true&size=480x640&path=weight:10%7Ccolor:green%7Cenc:";
	
		URL url = new URL(getGoogleDirectionApi(orig, station.latitude + "," + station.longitude));
		String lines = IOUtils.toString(url.openStream(), "utf-8");
//		println lines
//		JSONObject root = new JSONObject(lines);
//		JSONObject routes = root.getJSONArray("routes").getJSONObject(0);
//		String overview = routes.getJSONObject("overview_polyline").getString("points");
//		
//		List rs = new ArrayList()
//		
//		JSONArray steps = routes.getJSONArray("legs").getJSONObject(0).getJSONArray("steps");
//		for(int i = 0; i < steps.length(); i++) {
//			JSONObject step = steps.getJSONObject(i);
//			String html_instructions = step.getString("html_instructions");
//			String distance = step.getJSONObject("distance").getString("text");
//			String duration = step.getJSONObject("duration").getString("text");
//			String[] words = [html_instructions,distance,duration]
//			rs.add(words)
//		}
		
		JSONObject root = new JSONObject(lines);
		JSONObject routes = root.getJSONObject("result").getJSONArray("routes").getJSONObject(0);
//		String overview = routes.getJSONObject("overview_polyline").getString("points");
		
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
		
		[//overview:overview, 
			routes:rs, 
//			googleImageApi:googleImageApi, 
			station:station]
	}
	
	private String getGoogleDirectionApi(String origAddress, String destAddress) {
		StringBuilder googleDirectionApi = new StringBuilder("http://api.map.baidu.com/direction/v1?mode=driving&origin=");
		googleDirectionApi.append(origAddress);
		googleDirectionApi.append("&destination=");
		googleDirectionApi.append(destAddress);
		googleDirectionApi.append("&output=json&ak=IcI1pSft9eplKbUm0p2487bd");
		googleDirectionApi.append("&origin_region=北京&destination_region=北京")
		return googleDirectionApi.toString();
	}
}
