package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class ThirdpartTakingOnController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [thirdpartTakingOnInstanceList: ThirdpartTakingOn.list(params), thirdpartTakingOnInstanceTotal: ThirdpartTakingOn.count()]
    }

    def create() {
        [thirdpartTakingOnInstance: new ThirdpartTakingOn(params)]
    }

    def save() {
        def thirdpartTakingOnInstance = new ThirdpartTakingOn(params)
        if (!thirdpartTakingOnInstance.save(flush: true)) {
            render(view: "create", model: [thirdpartTakingOnInstance: thirdpartTakingOnInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'thirdpartTakingOn.label', default: 'ThirdpartTakingOn'), thirdpartTakingOnInstance.id])
        redirect(action: "show", id: thirdpartTakingOnInstance.id)
    }

    def show(Long id) {
        def thirdpartTakingOnInstance = ThirdpartTakingOn.get(id)
        if (!thirdpartTakingOnInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'thirdpartTakingOn.label', default: 'ThirdpartTakingOn'), id])
            redirect(action: "list")
            return
        }

        [thirdpartTakingOnInstance: thirdpartTakingOnInstance]
    }

    def edit(Long id) {
        def thirdpartTakingOnInstance = ThirdpartTakingOn.get(id)
        if (!thirdpartTakingOnInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'thirdpartTakingOn.label', default: 'ThirdpartTakingOn'), id])
            redirect(action: "list")
            return
        }

        [thirdpartTakingOnInstance: thirdpartTakingOnInstance]
    }

    def update(Long id, Long version) {
        def thirdpartTakingOnInstance = ThirdpartTakingOn.get(id)
        if (!thirdpartTakingOnInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'thirdpartTakingOn.label', default: 'ThirdpartTakingOn'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (thirdpartTakingOnInstance.version > version) {
                thirdpartTakingOnInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'thirdpartTakingOn.label', default: 'ThirdpartTakingOn')] as Object[],
                          "Another user has updated this ThirdpartTakingOn while you were editing")
                render(view: "edit", model: [thirdpartTakingOnInstance: thirdpartTakingOnInstance])
                return
            }
        }

        thirdpartTakingOnInstance.properties = params

        if (!thirdpartTakingOnInstance.save(flush: true)) {
            render(view: "edit", model: [thirdpartTakingOnInstance: thirdpartTakingOnInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'thirdpartTakingOn.label', default: 'ThirdpartTakingOn'), thirdpartTakingOnInstance.id])
        redirect(action: "show", id: thirdpartTakingOnInstance.id)
    }

    def delete(Long id) {
        def thirdpartTakingOnInstance = ThirdpartTakingOn.get(id)
        if (!thirdpartTakingOnInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'thirdpartTakingOn.label', default: 'ThirdpartTakingOn'), id])
            redirect(action: "list")
            return
        }

        try {
            thirdpartTakingOnInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'thirdpartTakingOn.label', default: 'ThirdpartTakingOn'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'thirdpartTakingOn.label', default: 'ThirdpartTakingOn'), id])
            redirect(action: "show", id: id)
        }
    }
}
