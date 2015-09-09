package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class ChangshaSubscribingGiftTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [changshaSubscribingGiftTypeInstanceList: ChangshaSubscribingGiftType.list(params), changshaSubscribingGiftTypeInstanceTotal: ChangshaSubscribingGiftType.count()]
    }

    def create() {
        [changshaSubscribingGiftTypeInstance: new ChangshaSubscribingGiftType(params)]
    }

    def save() {
        def changshaSubscribingGiftTypeInstance = new ChangshaSubscribingGiftType(params)
        if (!changshaSubscribingGiftTypeInstance.save(flush: true)) {
            render(view: "create", model: [changshaSubscribingGiftTypeInstance: changshaSubscribingGiftTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'changshaSubscribingGiftType.label', default: 'ChangshaSubscribingGiftType'), changshaSubscribingGiftTypeInstance.id])
        redirect(action: "show", id: changshaSubscribingGiftTypeInstance.id)
    }

    def show(Long id) {
        def changshaSubscribingGiftTypeInstance = ChangshaSubscribingGiftType.get(id)
        if (!changshaSubscribingGiftTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changshaSubscribingGiftType.label', default: 'ChangshaSubscribingGiftType'), id])
            redirect(action: "list")
            return
        }

        [changshaSubscribingGiftTypeInstance: changshaSubscribingGiftTypeInstance]
    }

    def edit(Long id) {
        def changshaSubscribingGiftTypeInstance = ChangshaSubscribingGiftType.get(id)
        if (!changshaSubscribingGiftTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changshaSubscribingGiftType.label', default: 'ChangshaSubscribingGiftType'), id])
            redirect(action: "list")
            return
        }

        [changshaSubscribingGiftTypeInstance: changshaSubscribingGiftTypeInstance]
    }

    def update(Long id, Long version) {
        def changshaSubscribingGiftTypeInstance = ChangshaSubscribingGiftType.get(id)
        if (!changshaSubscribingGiftTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changshaSubscribingGiftType.label', default: 'ChangshaSubscribingGiftType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (changshaSubscribingGiftTypeInstance.version > version) {
                changshaSubscribingGiftTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'changshaSubscribingGiftType.label', default: 'ChangshaSubscribingGiftType')] as Object[],
                          "Another user has updated this ChangshaSubscribingGiftType while you were editing")
                render(view: "edit", model: [changshaSubscribingGiftTypeInstance: changshaSubscribingGiftTypeInstance])
                return
            }
        }

        changshaSubscribingGiftTypeInstance.properties = params

        if (!changshaSubscribingGiftTypeInstance.save(flush: true)) {
            render(view: "edit", model: [changshaSubscribingGiftTypeInstance: changshaSubscribingGiftTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'changshaSubscribingGiftType.label', default: 'ChangshaSubscribingGiftType'), changshaSubscribingGiftTypeInstance.id])
        redirect(action: "show", id: changshaSubscribingGiftTypeInstance.id)
    }

    def delete(Long id) {
        def changshaSubscribingGiftTypeInstance = ChangshaSubscribingGiftType.get(id)
        if (!changshaSubscribingGiftTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'changshaSubscribingGiftType.label', default: 'ChangshaSubscribingGiftType'), id])
            redirect(action: "list")
            return
        }

        try {
            changshaSubscribingGiftTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'changshaSubscribingGiftType.label', default: 'ChangshaSubscribingGiftType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'changshaSubscribingGiftType.label', default: 'ChangshaSubscribingGiftType'), id])
            redirect(action: "show", id: id)
        }
    }
}
