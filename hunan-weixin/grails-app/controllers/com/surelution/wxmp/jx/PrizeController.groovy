package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class PrizeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [prizeInstanceList: Prize.list(params), prizeInstanceTotal: Prize.count()]
    }

    def create() {
        [prizeInstance: new Prize(params)]
    }

    def save() {
        def prizeInstance = new Prize(params)
        if (!prizeInstance.save(flush: true)) {
            render(view: "create", model: [prizeInstance: prizeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'prize.label', default: 'Prize'), prizeInstance.id])
        redirect(action: "show", id: prizeInstance.id)
    }

    def show(Long id) {
        def prizeInstance = Prize.get(id)
        if (!prizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prize.label', default: 'Prize'), id])
            redirect(action: "list")
            return
        }

        [prizeInstance: prizeInstance]
    }

    def edit(Long id) {
        def prizeInstance = Prize.get(id)
        if (!prizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prize.label', default: 'Prize'), id])
            redirect(action: "list")
            return
        }

        [prizeInstance: prizeInstance]
    }

    def update(Long id, Long version) {
        def prizeInstance = Prize.get(id)
        if (!prizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prize.label', default: 'Prize'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (prizeInstance.version > version) {
                prizeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prize.label', default: 'Prize')] as Object[],
                          "Another user has updated this Prize while you were editing")
                render(view: "edit", model: [prizeInstance: prizeInstance])
                return
            }
        }

        prizeInstance.properties = params

        if (!prizeInstance.save(flush: true)) {
            render(view: "edit", model: [prizeInstance: prizeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'prize.label', default: 'Prize'), prizeInstance.id])
        redirect(action: "show", id: prizeInstance.id)
    }

    def delete(Long id) {
        def prizeInstance = Prize.get(id)
        if (!prizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prize.label', default: 'Prize'), id])
            redirect(action: "list")
            return
        }

        try {
            prizeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'prize.label', default: 'Prize'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prize.label', default: 'Prize'), id])
            redirect(action: "show", id: id)
        }
    }
}
