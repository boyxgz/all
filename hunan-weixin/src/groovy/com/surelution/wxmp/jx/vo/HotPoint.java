package com.surelution.wxmp.jx.vo;

import com.surelution.wxmp.jx.Location;


/**
 * a location, caculate the distance to the center
 * 
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
public class HotPoint implements Comparable<HotPoint> {

	private Location location;

	/**
	 * center lat
	 */
	private double cLat;
	
	/**
	 * center lng
	 */
	private double cLng;

	/**
	 * distance to the center, pow with 2
	 */
	private double distance;
	
	public HotPoint(Location location, double lat, double lng) {
		this.location = location;
		
		cLat = lat;
		cLng = lng;
		double d1 = location.getLatitude() - cLat;
		double d2 = location.getLongitude() - cLng;
		distance = d1 * d1 + d2 * d2;
	}

	public Location getLocation() {
		return location;
	}

	@Override
	public int compareTo(HotPoint o) {
		if(distance > o.distance) {
			return 1;
		} else if(distance < o.distance) {
			return -1;
		}
		return 0;
	}
	
}
