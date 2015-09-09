package com.surelution.wxmp.jx

import org.apache.commons.lang.builder.HashCodeBuilder

class UserGasStation implements Serializable {

    static constraints = {
    }
	
	static mapping = {
		id composite:['user', 'gasStation']
		version false
	}
	
	User user
	GasStation gasStation
	
	static UserGasStation create(User user, GasStation gasStation) {
		def stations = findAllByUser(user)
		if(stations) {
			stations.each {
				it.delete(flush:true)
			}
//			removeAll(user)
		}
		return new UserGasStation(user:user, gasStation:gasStation).save(flush:true, insert:true)
	}
	
	static boolean remove(User user, GasStation gasStation, boolean flush = false) {
		def instance = findByUserAndGasStation(user, gasStation)
		if(instance) {
			instance.delete(flush:flush)
			return true
		}
		return false
	}
	
	static void removeAll(User user) {
		executeUpdate("delete from UserGasStation where user=:user", [user:user])
	}
	
	static void removeAll(GasStation gasStation) {
		executeQuery("delete from UserGasStation where gasStation=:gasStation", [gasStation:gasStation])
	}
	
	int hashCode() {
		def hc = new HashCodeBuilder()
		if(user) hc.append(user.id)
		if(gasStation) hc.append(gasStation.id)
		hc.toHashCode()
	}
	
	boolean equals(other) {
		if(!(other instanceof UserGasStation)) {
			return false
		}
		other.user?.id == user?.id && other.gasStation?.id == gasStation?.id
	}
}
