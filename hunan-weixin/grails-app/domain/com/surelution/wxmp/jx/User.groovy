package com.surelution.wxmp.jx

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	static transients = ['springSecurityService', 'branch', 'gasStation', 'restrictedByBranch', 'restrictedByStation','uploadFilePath']

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
	
	GasStation getGasStation() {
		def userGasStation = UserGasStation.findByUser(this)
		userGasStation?.gasStation
	}
	
	Branch getBranch() {
		if(gasStation) {
			return gasStation.district?.branch
		}
		def userBranch = UserBranch.findByUser(this)
		userBranch?.branch
	}
	
	boolean isRestrictedByBranch() {
		def roles = authorities.collect() {
			it.authority
		}
		return !(roles.contains("ROLE_ADMIN") || roles.contains("ROLE_HEADQUARTER"))
	}
	
	boolean isRestrictedByStation() {
		def roles = authorities.collect() {
			it.authority
		}
		return roles.contains("ROLE_STATION")
	}
	
	String getUploadFilePath() {
		if(restrictedByBranch) {
			return branch.uploadFilePath
		} else {
			return 'headquarter'
		}
	}
}
