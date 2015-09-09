package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class SubscribingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [subscribingInstanceList: Subscribing.list(params), subscribingInstanceTotal: Subscribing.count()]
    }

    def create() {
        [subscribingInstance: new Subscribing(params)]
    }

    def save() {
        def subscribingInstance = new Subscribing(params)
        if (!subscribingInstance.save(flush: true)) {
            render(view: "create", model: [subscribingInstance: subscribingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'subscribing.label', default: 'Subscribing'), subscribingInstance.id])
        redirect(action: "show", id: subscribingInstance.id)
    }

    def show(Long id) {
        def subscribingInstance = Subscribing.get(id)
        if (!subscribingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscribing.label', default: 'Subscribing'), id])
            redirect(action: "list")
            return
        }

        [subscribingInstance: subscribingInstance]
    }

    def edit(Long id) {
        def subscribingInstance = Subscribing.get(id)
        if (!subscribingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscribing.label', default: 'Subscribing'), id])
            redirect(action: "list")
            return
        }

        [subscribingInstance: subscribingInstance]
    }

    def update(Long id, Long version) {
        def subscribingInstance = Subscribing.get(id)
        if (!subscribingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscribing.label', default: 'Subscribing'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (subscribingInstance.version > version) {
                subscribingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subscribing.label', default: 'Subscribing')] as Object[],
                          "Another user has updated this Subscribing while you were editing")
                render(view: "edit", model: [subscribingInstance: subscribingInstance])
                return
            }
        }

        subscribingInstance.properties = params

        if (!subscribingInstance.save(flush: true)) {
            render(view: "edit", model: [subscribingInstance: subscribingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'subscribing.label', default: 'Subscribing'), subscribingInstance.id])
        redirect(action: "show", id: subscribingInstance.id)
    }

    def delete(Long id) {
        def subscribingInstance = Subscribing.get(id)
        if (!subscribingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscribing.label', default: 'Subscribing'), id])
            redirect(action: "list")
            return
        }

        try {
            subscribingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subscribing.label', default: 'Subscribing'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subscribing.label', default: 'Subscribing'), id])
            redirect(action: "show", id: id)
        }
    }
}
