package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class WikiController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [wikiInstanceList: Wiki.list(params), wikiInstanceTotal: Wiki.count()]
    }

    def create() {
        [wikiInstance: new Wiki(params)]
    }

    def save() {
        def wikiInstance = new Wiki(params)
        if (!wikiInstance.save(flush: true)) {
            render(view: "create", model: [wikiInstance: wikiInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'wiki.label', default: 'Wiki'), wikiInstance.id])
        redirect(action: "show", id: wikiInstance.id)
    }

    def show(Long id) {
        def wikiInstance = Wiki.get(id)
        if (!wikiInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wiki.label', default: 'Wiki'), id])
            redirect(action: "list")
            return
        }

        [wikiInstance: wikiInstance]
    }

    def edit(Long id) {
        def wikiInstance = Wiki.get(id)
        if (!wikiInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wiki.label', default: 'Wiki'), id])
            redirect(action: "list")
            return
        }

        [wikiInstance: wikiInstance]
    }

    def update(Long id, Long version) {
        def wikiInstance = Wiki.get(id)
        if (!wikiInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wiki.label', default: 'Wiki'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (wikiInstance.version > version) {
                wikiInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'wiki.label', default: 'Wiki')] as Object[],
                          "Another user has updated this Wiki while you were editing")
                render(view: "edit", model: [wikiInstance: wikiInstance])
                return
            }
        }

        wikiInstance.properties = params

        if (!wikiInstance.save(flush: true)) {
            render(view: "edit", model: [wikiInstance: wikiInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'wiki.label', default: 'Wiki'), wikiInstance.id])
        redirect(action: "show", id: wikiInstance.id)
    }

    def delete(Long id) {
        def wikiInstance = Wiki.get(id)
        if (!wikiInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wiki.label', default: 'Wiki'), id])
            redirect(action: "list")
            return
        }

        try {
            wikiInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'wiki.label', default: 'Wiki'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wiki.label', default: 'Wiki'), id])
            redirect(action: "show", id: id)
        }
    }
}
