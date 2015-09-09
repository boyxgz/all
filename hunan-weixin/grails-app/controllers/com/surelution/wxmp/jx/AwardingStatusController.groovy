package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class AwardingStatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [awardingStatusInstanceList: AwardingStatus.list(params), awardingStatusInstanceTotal: AwardingStatus.count()]
    }

    def create() {
        [awardingStatusInstance: new AwardingStatus(params)]
    }

    def save() {
        def awardingStatusInstance = new AwardingStatus(params)
        if (!awardingStatusInstance.save(flush: true)) {
            render(view: "create", model: [awardingStatusInstance: awardingStatusInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'awardingStatus.label', default: 'AwardingStatus'), awardingStatusInstance.id])
        redirect(action: "show", id: awardingStatusInstance.id)
    }

    def show(Long id) {
        def awardingStatusInstance = AwardingStatus.get(id)
        if (!awardingStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'awardingStatus.label', default: 'AwardingStatus'), id])
            redirect(action: "list")
            return
        }

        [awardingStatusInstance: awardingStatusInstance]
    }

    def edit(Long id) {
        def awardingStatusInstance = AwardingStatus.get(id)
        if (!awardingStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'awardingStatus.label', default: 'AwardingStatus'), id])
            redirect(action: "list")
            return
        }

        [awardingStatusInstance: awardingStatusInstance]
    }

    def update(Long id, Long version) {
        def awardingStatusInstance = AwardingStatus.get(id)
        if (!awardingStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'awardingStatus.label', default: 'AwardingStatus'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (awardingStatusInstance.version > version) {
                awardingStatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'awardingStatus.label', default: 'AwardingStatus')] as Object[],
                          "Another user has updated this AwardingStatus while you were editing")
                render(view: "edit", model: [awardingStatusInstance: awardingStatusInstance])
                return
            }
        }

        awardingStatusInstance.properties = params

        if (!awardingStatusInstance.save(flush: true)) {
            render(view: "edit", model: [awardingStatusInstance: awardingStatusInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'awardingStatus.label', default: 'AwardingStatus'), awardingStatusInstance.id])
        redirect(action: "show", id: awardingStatusInstance.id)
    }

    def delete(Long id) {
        def awardingStatusInstance = AwardingStatus.get(id)
        if (!awardingStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'awardingStatus.label', default: 'AwardingStatus'), id])
            redirect(action: "list")
            return
        }

        try {
            awardingStatusInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'awardingStatus.label', default: 'AwardingStatus'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'awardingStatus.label', default: 'AwardingStatus'), id])
            redirect(action: "show", id: id)
        }
    }
}
