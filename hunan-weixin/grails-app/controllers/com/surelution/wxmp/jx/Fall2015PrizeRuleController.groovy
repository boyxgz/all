package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class Fall2015PrizeRuleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [fall2015PrizeRuleInstanceList: Fall2015PrizeRule.list(params), fall2015PrizeRuleInstanceTotal: Fall2015PrizeRule.count()]
    }

    def create() {
        [fall2015PrizeRuleInstance: new Fall2015PrizeRule(params)]
    }

    def save() {
        def fall2015PrizeRuleInstance = new Fall2015PrizeRule(params)
        if (!fall2015PrizeRuleInstance.save(flush: true)) {
            render(view: "create", model: [fall2015PrizeRuleInstance: fall2015PrizeRuleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'fall2015PrizeRule.label', default: 'Fall2015PrizeRule'), fall2015PrizeRuleInstance.id])
        redirect(action: "show", id: fall2015PrizeRuleInstance.id)
    }

    def show(Long id) {
        def fall2015PrizeRuleInstance = Fall2015PrizeRule.get(id)
        if (!fall2015PrizeRuleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fall2015PrizeRule.label', default: 'Fall2015PrizeRule'), id])
            redirect(action: "list")
            return
        }

        [fall2015PrizeRuleInstance: fall2015PrizeRuleInstance]
    }

    def edit(Long id) {
        def fall2015PrizeRuleInstance = Fall2015PrizeRule.get(id)
        if (!fall2015PrizeRuleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fall2015PrizeRule.label', default: 'Fall2015PrizeRule'), id])
            redirect(action: "list")
            return
        }

        [fall2015PrizeRuleInstance: fall2015PrizeRuleInstance]
    }

    def update(Long id, Long version) {
        def fall2015PrizeRuleInstance = Fall2015PrizeRule.get(id)
        if (!fall2015PrizeRuleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fall2015PrizeRule.label', default: 'Fall2015PrizeRule'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (fall2015PrizeRuleInstance.version > version) {
                fall2015PrizeRuleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'fall2015PrizeRule.label', default: 'Fall2015PrizeRule')] as Object[],
                          "Another user has updated this Fall2015PrizeRule while you were editing")
                render(view: "edit", model: [fall2015PrizeRuleInstance: fall2015PrizeRuleInstance])
                return
            }
        }

        fall2015PrizeRuleInstance.properties = params

        if (!fall2015PrizeRuleInstance.save(flush: true)) {
            render(view: "edit", model: [fall2015PrizeRuleInstance: fall2015PrizeRuleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'fall2015PrizeRule.label', default: 'Fall2015PrizeRule'), fall2015PrizeRuleInstance.id])
        redirect(action: "show", id: fall2015PrizeRuleInstance.id)
    }

    def delete(Long id) {
        def fall2015PrizeRuleInstance = Fall2015PrizeRule.get(id)
        if (!fall2015PrizeRuleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fall2015PrizeRule.label', default: 'Fall2015PrizeRule'), id])
            redirect(action: "list")
            return
        }

        try {
            fall2015PrizeRuleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'fall2015PrizeRule.label', default: 'Fall2015PrizeRule'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fall2015PrizeRule.label', default: 'Fall2015PrizeRule'), id])
            redirect(action: "show", id: id)
        }
    }
}
