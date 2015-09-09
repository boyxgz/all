package com.surelution.wxmp.jx.vo;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import com.surelution.wxmp.jx.Location;


public class LocationRadar {

	/**
	 * center
	 */
	private double cLat;

	/**
	 * center
	 */
	private double cLng;

	private TreeSet<HotPoint> list = new TreeSet<HotPoint>();

	public LocationRadar(double cLat, double cLng) {
		this.cLat = cLat;
		this.cLng = cLng;
	}

	public void put(Location location) {
		HotPoint s = new HotPoint(location, cLat, cLng);
		list.add(s);
	}

	public List<Location> getNear(int count) {
		ArrayList<Location> ss = new ArrayList<Location>();
		for(int i = 0; i < count; i++) {
			HotPoint s = list.pollFirst();
			if(s != null)
				ss.add(s.getLocation());
			else {
				break;
			}
		}
		return ss;
	}
}
