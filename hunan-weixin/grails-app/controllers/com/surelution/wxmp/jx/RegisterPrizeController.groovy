package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException
import com.surelution.wxmp.jx.vo.BranchRegisterPrizeSummaryDailyVo;
import com.surelution.wxmp.jx.vo.GasStationRegisterPrizeDailyVo
import com.surelution.wxmp.jx.vo.GasStationRegisterPrizeSummaryDailyVo

class RegisterPrizeController {
	
	def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		def user = springSecurityService.currentUser
		def userGasStation = UserGasStation.findByUser(user)
		def awardedAtFrom = params.date('awardedAtFrom')
		def awardedAtTo = params.date('awardedAtTo')
		
		if(userGasStation) {
			def gasStation = userGasStation.gasStation
			if(gasStation) {
				def result = RegisterPrize.createCriteria().list(max:params.max, offset:params.offset) {
					eq('gasStation', gasStation)
					eq('paied', true)
					if(awardedAtFrom) {
						ge('awardedAt', awardedAtFrom)
					}
					if(awardedAtTo) {
						le('awardedAt', awardedAtTo)
					}
				}
		        return [registerPrizeInstanceList: result, registerPrizeInstanceTotal: result.totalCount]
			}
		}
		[registerPrizeInstanceList: [], registerPrizeInstanceTotal: 0]
    }

    def create() {
        [registerPrizeInstance: new RegisterPrize(params)]
    }

    def save() {
        def registerPrizeInstance = new RegisterPrize(params)
        if (!registerPrizeInstance.save(flush: true)) {
            render(view: "create", model: [registerPrizeInstance: registerPrizeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'registerPrize.label', default: 'RegisterPrize'), registerPrizeInstance.id])
        redirect(action: "show", id: registerPrizeInstance.id)
    }

    def show(Long id) {
        def registerPrizeInstance = RegisterPrize.get(id)
        if (!registerPrizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registerPrize.label', default: 'RegisterPrize'), id])
            redirect(action: "list")
            return
        }

        [registerPrizeInstance: registerPrizeInstance]
    }
	
	def showAwarding() {
		def user = springSecurityService.currentUser
		def prizes = RegisterPrize.createCriteria().list {
			eq("awardedBy", user)
			order("awardedAt", "desc")
		}
		[prizes:prizes]
	}

    def edit(Long id) {
        def registerPrizeInstance = RegisterPrize.get(id)
        if (!registerPrizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registerPrize.label', default: 'RegisterPrize'), id])
            redirect(action: "list")
            return
        }

        [registerPrizeInstance: registerPrizeInstance]
    }

    def update(Long id, Long version) {
        def registerPrizeInstance = RegisterPrize.get(id)
        if (!registerPrizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registerPrize.label', default: 'RegisterPrize'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (registerPrizeInstance.version > version) {
                registerPrizeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'registerPrize.label', default: 'RegisterPrize')] as Object[],
                          "Another user has updated this RegisterPrize while you were editing")
                render(view: "edit", model: [registerPrizeInstance: registerPrizeInstance])
                return
            }
        }

        registerPrizeInstance.properties = params

        if (!registerPrizeInstance.save(flush: true)) {
            render(view: "edit", model: [registerPrizeInstance: registerPrizeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'registerPrize.label', default: 'RegisterPrize'), registerPrizeInstance.id])
        redirect(action: "show", id: registerPrizeInstance.id)
    }

    def delete(Long id) {
        def registerPrizeInstance = RegisterPrize.get(id)
        if (!registerPrizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registerPrize.label', default: 'RegisterPrize'), id])
            redirect(action: "list")
            return
        }

        try {
            registerPrizeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'registerPrize.label', default: 'RegisterPrize'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'registerPrize.label', default: 'RegisterPrize'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def dailyReport() {
		def user = springSecurityService.currentUser
		def userGasStation = UserGasStation.findByUser(user)
		def awardedAtFrom = params.awardedAtFrom
		def awardedAtTo = params.awardedAtTo
		if(userGasStation) {
			def gasStation = userGasStation.gasStation
			if(gasStation) {
				def result = RegisterPrize.createCriteria().list() {
					eq('gasStation', gasStation)
					eq('paied', true)
				}
				def list = GasStationRegisterPrizeDailyVo.populate(result)
				return [registerPrizeInstanceList: list, total:result.size()]
			}
		}
		[registerPrizeInstanceList: [], registerPrizeInstanceTotal: 0]
	}

	def summaryReport() {
		def user = springSecurityService.currentUser
		def branches
		if(user.restrictedByBranch) {
			branches = [user.branch]
		} else {
			branches = Branch.findAllByParentIsNotNull()
		}
		def branch
		def result
		def branchId = params['branch.id']
		if(branchId) {
			branch = Branch.get(branchId)
		}
		
		if(branch) {
			def stationIds = GasStation.createCriteria().list() {
				createAlias('district', 'd')
				eq('d.branch', branch)
			}.collect() {
				it.id
			}
			
			def prizes = RegisterPrize.createCriteria().list() {
				'in'('gasStation.id', stationIds)
				eq('paied', true)
			}
			result = GasStationRegisterPrizeSummaryDailyVo.populate(prizes)
		}
		
		[branches:branches, result:result]
	}

	def summaryHeadquarterReport() {
		def user = springSecurityService.currentUser
		
		def prizes = RegisterPrize.list()
		def result = BranchRegisterPrizeSummaryDailyVo.populate(prizes)
	
		
		[result:result]
	}

	
	def verifyAwarding() {
		def rp = RegisterPrize.findByVerifyCode(params.verifyCode)
		[rp:rp]
	}
	
	def awarding() {
		def user = springSecurityService.currentUser
		def rp = RegisterPrize.findByVerifyCode(params.verifyCode)
		if(rp) {
			rp.awardedAt = new Date()
			rp.awardedBy = user
			rp.save(flush:true)
		}
		redirect(action:"showAwarding")
	}
}
