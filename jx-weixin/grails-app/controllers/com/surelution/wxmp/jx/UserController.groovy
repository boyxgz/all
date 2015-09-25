package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }
		def role = Role.get(params['role.id'])
		if(role) {
			def userRole = new UserRole(user:userInstance, role:role)
			userRole.save(flush:true)
		}

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }
		
		def userRole = UserRole.findByUser(userInstance)
        [userInstance: userInstance, userRole:userRole]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

		def psw = userInstance.password
        userInstance.properties = params
		if(!userInstance.password)
			userInstance.password = psw

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def showChangePw() {
		
	}
	
	def changePw() {
		def newPw1 = params.newPw1
		def newPw2 = params.newPw2
		if(newPw1 != newPw2) {
			flash.message = message(code: 'password.and.confirmPassword.not.match')
			redirect(action:'showChangePw')
			return
		}
		def user = springSecurityService.currentUser
		user = User.findByUsername(user.username)
		if(user) {
//			def pw1 = params.password // the old password which user input
//			def pw2 = springSecurityService.encodePassword(pw1, user.username) // the encrypted old password user input
//			def pw3 = user.password
//			println "${pw1},\n ${pw2},\n ${pw3}"
			
			if(springSecurityService.passwordEncoder.isPasswordValid(user.password, params.password, null)) {
				user.password = newPw1
				user.save(flush:true)
				flash.message = message(code: 'password.change.succeed')
				redirect(action:'showChangePw')
				return
			} else {
				flash.message = message(code: 'old.password.not.match')
				redirect(action:'showChangePw')
				return
			}
		}
	}
	
	def editData(Long id) {
		def user = User.get(id)
		def userRole = UserRole.findByUser(user)
		if(userRole) {
			def role = userRole.role
			if(role.authority == 'ROLE_STATION') {//
				def userData = UserGasStation.findByUser(user)
				def station = userData?.gasStation
				def districts
				def gasStations
				if(station) {
					def district = station.district
					def branch = district.branch
					districts = District.findAllByBranch(branch)
					gasStations = GasStation.findAllByDistrict(district)
				}
				render(view:'editStation', model:[user:user, userData:userData, 
					districts:districts, gasStations:gasStations])
				return
			}
			if(role.authority == 'ROLE_BRANCH') {
				def userData = UserBranch.findByUser(user)
				render(view:'editBranch', model:[user:user,userData:userData])
				return
			}
		}
	}
	
	def saveBranch() {
		def user = User.get(params['user.id'])
		def branch = Branch.get(params['branch.id'])
		def userBranch = UserBranch.create(user, branch)
		redirect(action:'editData', id:user.id)
	}
	
	def saveGasStation() {
		def user = User.get(params['user.id'])
		def gasStation = GasStation.get(params['gasStation.id'])
		if(user && gasStation) {
			def userGasStation = UserGasStation.create(user, gasStation)
			redirect(action:'editData', id:user.id)
		}
	}
}
