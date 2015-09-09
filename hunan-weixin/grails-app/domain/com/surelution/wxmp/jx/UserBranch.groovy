package com.surelution.wxmp.jx

import java.io.Serializable;

import org.apache.commons.lang.builder.HashCodeBuilder

class UserBranch implements Serializable {

    static constraints = {
    }
	
	static mapping = {
		id composite:['user', 'branch']
		version false
	}
	
	User user
	Branch branch
	
	static UserBranch create(User user, Branch branch) {
		def userBranch = UserBranch.findAllByUser(user)
		if(userBranch) {
//			UserBranch.removeAll(user)
			userBranch.each {
				it.delete(flush:true)
			}
		}
		return new UserBranch(user:user, branch:branch).save(flush:true, insert:true)
	}
	
	static boolean remove(User user, Branch branch, boolean flush = false) {
		def instance = findByUserAndBranch(user, branch)
		if(instance) {
			instance.delete(flush:flush)
			return true
		}
		return false
	}
	
	static void removeAll(User user) {
		executeUpdate("delete from UserBranch where user=:user", [user:user])
	}
	
	static void removeAll(Branch branch) {
		executeQuery("delete from UserBranch where branch=:branch", [branch:branch])
	}
	
	int hashCode() {
		def hc = new HashCodeBuilder()
		if(user) hc.append(user.id)
		if(branch) hc.append(branch.id)
		hc.toHashCode()
	}
	
	boolean equals(other) {
		if(!(other instanceof UserBranch)) {
			return false
		}
		other.user?.id == user?.id && other.branch?.id == branch?.id
		
	}
}
