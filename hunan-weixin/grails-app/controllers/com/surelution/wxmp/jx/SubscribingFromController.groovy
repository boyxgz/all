package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class SubscribingFromController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [subscribingFromInstanceList: SubscribingFrom.list(params), subscribingFromInstanceTotal: SubscribingFrom.count()]
    }

    def create() {
        [subscribingFromInstance: new SubscribingFrom(params)]
    }

    def save() {
        def subscribingFromInstance = new SubscribingFrom(params)
        if (!subscribingFromInstance.save(flush: true)) {
            render(view: "create", model: [subscribingFromInstance: subscribingFromInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'subscribingFrom.label', default: 'SubscribingFrom'), subscribingFromInstance.id])
        redirect(action: "show", id: subscribingFromInstance.id)
    }

    def show(Long id) {
        def subscribingFromInstance = SubscribingFrom.get(id)
        if (!subscribingFromInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscribingFrom.label', default: 'SubscribingFrom'), id])
            redirect(action: "list")
            return
        }

        [subscribingFromInstance: subscribingFromInstance]
    }

    def edit(Long id) {
        def subscribingFromInstance = SubscribingFrom.get(id)
        if (!subscribingFromInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscribingFrom.label', default: 'SubscribingFrom'), id])
            redirect(action: "list")
            return
        }

        [subscribingFromInstance: subscribingFromInstance]
    }

    def update(Long id, Long version) {
        def subscribingFromInstance = SubscribingFrom.get(id)
        if (!subscribingFromInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscribingFrom.label', default: 'SubscribingFrom'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (subscribingFromInstance.version > version) {
                subscribingFromInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subscribingFrom.label', default: 'SubscribingFrom')] as Object[],
                          "Another user has updated this SubscribingFrom while you were editing")
                render(view: "edit", model: [subscribingFromInstance: subscribingFromInstance])
                return
            }
        }

        subscribingFromInstance.properties = params

        if (!subscribingFromInstance.save(flush: true)) {
            render(view: "edit", model: [subscribingFromInstance: subscribingFromInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'subscribingFrom.label', default: 'SubscribingFrom'), subscribingFromInstance.id])
        redirect(action: "show", id: subscribingFromInstance.id)
    }

    def delete(Long id) {
        def subscribingFromInstance = SubscribingFrom.get(id)
        if (!subscribingFromInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscribingFrom.label', default: 'SubscribingFrom'), id])
            redirect(action: "list")
            return
        }

        try {
            subscribingFromInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subscribingFrom.label', default: 'SubscribingFrom'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subscribingFrom.label', default: 'SubscribingFrom'), id])
            redirect(action: "show", id: id)
        }
    }
}
