package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class MultiNewsMessageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [multiNewsMessageInstanceList: MultiNewsMessage.list(params), multiNewsMessageInstanceTotal: MultiNewsMessage.count()]
    }

    def create() {
        [multiNewsMessageInstance: new MultiNewsMessage(params)]
    }

    def save() {
        def multiNewsMessageInstance = new MultiNewsMessage(params)
        if (!multiNewsMessageInstance.save(flush: true)) {
            render(view: "create", model: [multiNewsMessageInstance: multiNewsMessageInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'multiNewsMessage.label', default: 'MultiNewsMessage'), multiNewsMessageInstance.id])
        redirect(action: "show", id: multiNewsMessageInstance.id)
    }

    def show(Long id) {
        def multiNewsMessageInstance = MultiNewsMessage.get(id)
        if (!multiNewsMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'multiNewsMessage.label', default: 'MultiNewsMessage'), id])
            redirect(action: "list")
            return
        }

        [multiNewsMessageInstance: multiNewsMessageInstance]
    }

    def edit(Long id) {
        def multiNewsMessageInstance = MultiNewsMessage.get(id)
        if (!multiNewsMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'multiNewsMessage.label', default: 'MultiNewsMessage'), id])
            redirect(action: "list")
            return
        }

        [multiNewsMessageInstance: multiNewsMessageInstance]
    }

    def update(Long id, Long version) {
        def multiNewsMessageInstance = MultiNewsMessage.get(id)
        if (!multiNewsMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'multiNewsMessage.label', default: 'MultiNewsMessage'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (multiNewsMessageInstance.version > version) {
                multiNewsMessageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'multiNewsMessage.label', default: 'MultiNewsMessage')] as Object[],
                          "Another user has updated this MultiNewsMessage while you were editing")
                render(view: "edit", model: [multiNewsMessageInstance: multiNewsMessageInstance])
                return
            }
        }

        multiNewsMessageInstance.properties = params

        if (!multiNewsMessageInstance.save(flush: true)) {
            render(view: "edit", model: [multiNewsMessageInstance: multiNewsMessageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'multiNewsMessage.label', default: 'MultiNewsMessage'), multiNewsMessageInstance.id])
        redirect(action: "show", id: multiNewsMessageInstance.id)
    }

    def delete(Long id) {
        def multiNewsMessageInstance = MultiNewsMessage.get(id)
        if (!multiNewsMessageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'multiNewsMessage.label', default: 'MultiNewsMessage'), id])
            redirect(action: "list")
            return
        }

        try {
            multiNewsMessageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'multiNewsMessage.label', default: 'MultiNewsMessage'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'multiNewsMessage.label', default: 'MultiNewsMessage'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def history(String id) {
		def mnm = MultiNewsMessage.findByMenuKey(id)
		if(mnm) {
			def mnmi = MultiNewsMessageItem.findAllByMessageAndActive(mnm, false)
			[messages:mnmi]
		}
	}
}
