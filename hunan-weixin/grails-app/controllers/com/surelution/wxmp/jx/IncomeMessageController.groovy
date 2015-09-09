package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class IncomeMessageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [incomeMessageInstanceList: IncomeMessage.list(params), incomeMessageInstanceTotal: IncomeMessage.count()]
    }

    def create() {
        [incomeMessageInstance: new IncomeMessage(params)]
    }

    def save() {
        def incomeMessageInstance = new IncomeMessage(params)
        if (!incomeMessageInstance.save(flush: true)) {
            render(view: "create", model: [incomeMessageInstance: incomeMessageInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'incomeMessage.label', default: 'IncomeMessage'), incomeMessageInstance.id])
        redirect(action: "show", id: incomeMessageInstance.id)
    }

    def show(Long id) {
        def incomeMessageInstance = IncomeMessage.get(id)
        if (!incomeMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'incomeMessage.label', default: 'IncomeMessage'), id])
            redirect(action: "list")
            return
        }

        [incomeMessageInstance: incomeMessageInstance]
    }

    def edit(Long id) {
        def incomeMessageInstance = IncomeMessage.get(id)
        if (!incomeMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'incomeMessage.label', default: 'IncomeMessage'), id])
            redirect(action: "list")
            return
        }

        [incomeMessageInstance: incomeMessageInstance]
    }

    def update(Long id, Long version) {
        def incomeMessageInstance = IncomeMessage.get(id)
        if (!incomeMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'incomeMessage.label', default: 'IncomeMessage'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (incomeMessageInstance.version > version) {
                incomeMessageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'incomeMessage.label', default: 'IncomeMessage')] as Object[],
                          "Another user has updated this IncomeMessage while you were editing")
                render(view: "edit", model: [incomeMessageInstance: incomeMessageInstance])
                return
            }
        }

        incomeMessageInstance.properties = params

        if (!incomeMessageInstance.save(flush: true)) {
            render(view: "edit", model: [incomeMessageInstance: incomeMessageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'incomeMessage.label', default: 'IncomeMessage'), incomeMessageInstance.id])
        redirect(action: "show", id: incomeMessageInstance.id)
    }

    def delete(Long id) {
        def incomeMessageInstance = IncomeMessage.get(id)
        if (!incomeMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'incomeMessage.label', default: 'IncomeMessage'), id])
            redirect(action: "list")
            return
        }

        try {
            incomeMessageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'incomeMessage.label', default: 'IncomeMessage'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'incomeMessage.label', default: 'IncomeMessage'), id])
            redirect(action: "show", id: id)
        }
    }
}
