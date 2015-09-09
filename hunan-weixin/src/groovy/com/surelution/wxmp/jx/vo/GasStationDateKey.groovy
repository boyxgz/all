/**
 * 
 */
package com.surelution.wxmp.jx.vo

import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

import com.surelution.wxmp.jx.GasStation

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class GasStationDateKey implements Comparable<GasStationDateKey> {

	GasStation gasStation
	Date date
	
	void setDate(Date date) {
		if(date) {
			this.date = date.clearTime() 
		}
	}
	
	int hashCode() {
		HashCodeBuilder hcb = new HashCodeBuilder()
		hcb.append(gasStation?.id)
		hcb.append(date)
		hcb.toHashCode()
	}
	
	boolean equals(other) {
		if(!(other instanceof GasStationDateKey)) {
			return false
		}
		other.gasStation?.id == gasStation?.id && date == other.date
	}
	
//	String toString() {
//		def tsb = new ToStringBuilder()
//		tsb.append(gasStation)
//		tsb.append(date)
//		tsb.toString()
	
//	}

	/* (non-Javadoc)
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	@Override
	public int compareTo(GasStationDateKey o) {
		if(gasStation?.id == o.gasStation?.id) {
			return date.compareTo(o.date)
		}
		return gasStation?.id.compareTo(o.gasStation?.id)
	}
}
