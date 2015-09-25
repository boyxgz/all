package com.surelution.wxmp.jx

import grails.converters.JSON;

import org.springframework.dao.DataIntegrityViolationException

class PrizeAwardingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", showVerify:["POST","GET"]]
    
    def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [prizeAwardingInstanceList: PrizeAwarding.list(params), prizeAwardingInstanceTotal: PrizeAwarding.count()]
    }

    def create() {
        [prizeAwardingInstance: new PrizeAwarding(params)]
    }

    def save() {
        def prizeAwardingInstance = new PrizeAwarding(params)
        if (!prizeAwardingInstance.save(flush: true)) {
            render(view: "create", model: [prizeAwardingInstance: prizeAwardingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'prizeAwarding.label', default: 'PrizeAwarding'), prizeAwardingInstance.id])
        redirect(action: "show", id: prizeAwardingInstance.id)
    }

    def show(Long id) {
        def prizeAwardingInstance = PrizeAwarding.get(id)
        if (!prizeAwardingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prizeAwarding.label', default: 'PrizeAwarding'), id])
            redirect(action: "list")
            return
        }

        [prizeAwardingInstance: prizeAwardingInstance]
    }

    def edit(Long id) {
        def prizeAwardingInstance = PrizeAwarding.get(id)
        if (!prizeAwardingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prizeAwarding.label', default: 'PrizeAwarding'), id])
            redirect(action: "list")
            return
        }

        [prizeAwardingInstance: prizeAwardingInstance]
    }

    def update(Long id, Long version) {
        def prizeAwardingInstance = PrizeAwarding.get(id)
        if (!prizeAwardingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prizeAwarding.label', default: 'PrizeAwarding'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (prizeAwardingInstance.version > version) {
                prizeAwardingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prizeAwarding.label', default: 'PrizeAwarding')] as Object[],
                          "Another user has updated this PrizeAwarding while you were editing")
                render(view: "edit", model: [prizeAwardingInstance: prizeAwardingInstance])
                return
            }
        }

        prizeAwardingInstance.properties = params

        if (!prizeAwardingInstance.save(flush: true)) {
            render(view: "edit", model: [prizeAwardingInstance: prizeAwardingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'prizeAwarding.label', default: 'PrizeAwarding'), prizeAwardingInstance.id])
        redirect(action: "show", id: prizeAwardingInstance.id)
    }

    def delete(Long id) {
        def prizeAwardingInstance = PrizeAwarding.get(id)
        if (!prizeAwardingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prizeAwarding.label', default: 'PrizeAwarding'), id])
            redirect(action: "list")
            return
        }

        try {
            prizeAwardingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'prizeAwarding.label', default: 'PrizeAwarding'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prizeAwarding.label', default: 'PrizeAwarding'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def showDraw() {
        def token = params.token
        def prizeAwarding = PrizeAwarding.findByToken(token)
        if(prizeAwarding.status.code == AwardingStatus.NEW) {
            List<WheelPrize> wps = WheelPrize.list()
            render(view:"showDraw", model:[prizeAwarding:prizeAwarding, allPrize:wps, token:token])
            return
        } else if(prizeAwarding.status.code == AwardingStatus.DRAWN) {
            //render(view:"awardingDesc", model:[prizeAwarding:prizeAwarding])
            render(view:"showPrize", model:[prizeAwarding:prizeAwarding])
            return
        } else if(prizeAwarding.status.code == AwardingStatus.AWARDED) {
            render(view:"showPrize", model:[prizeAwarding:prizeAwarding])
            return
        } else {
            render(view:"prizeError",model:[prizeAwarding:prizeAwarding])
        }
    }
    
    def draw() {
        def token = params.token
        def i = params.int('i')
        
        def wp = WheelPrize.list().get(i)
        
        def pa = PrizeAwarding.findByToken(token)
        if(pa) {
            pa.prize = wp.prize
            pa.wheelIndex = i
            AwardingStatus status
            pa.status = status
            if(wp.prize.empty) {
                pa.finished = true
                pa.awardedAt = new Date()
                pa.awardedBy = "空奖，无需兑奖"
                status = AwardingStatus.findByCode(AwardingStatus.AWARDED)
            } else {
                status = AwardingStatus.findByCode(AwardingStatus.DRAWN)
            }
            pa.status = status
            pa.save(flush:true)
            render pa.prize as JSON
        }
    }

    def showVerify() {
        def pa
        def history
        def verifyCode = params.verifyCode
        if(verifyCode) {
            pa = PrizeAwarding.findByVerifyCode(verifyCode)
            def awarded = AwardingStatus.findByCode(AwardingStatus.AWARDED)
            history = PrizeAwarding.findAllBySubscriberAndStatus(pa.subscriber, awarded)
        }
        render(view:"showVerify", model:[paInstance:pa, verifyCode:verifyCode, history:history])
    }
    
    def rejecting() {
        def awardedBy = springSecurityService.currentUser.username
        println awardedBy
        def pa
        def id = params.id
        if(id) {
            pa = PrizeAwarding.get(id)
            def status = AwardingStatus.findByCode(AwardingStatus.REJECTED)
            pa.status = status
            pa.awardedBy = awardedBy
            pa.awardedAt = new Date()
            pa.finished = true
            pa.save(flush:true)
        }
        redirect(action:"showVerify")
    }
    
    def verify() {
        def awardedBy = springSecurityService.currentUser.username
        def pa
        def id = params.id
        if(id) {
            pa = PrizeAwarding.get(id)
            def status = AwardingStatus.findByCode(AwardingStatus.AWARDED)
            pa.status = status
            pa.awardedBy = awardedBy
            pa.awardedAt = new Date()
            pa.finished = true
            pa.save(flush:true)
        }
        redirect(action:"showVerify")
    }
    
    def prizeResult() {
        
    }
}
