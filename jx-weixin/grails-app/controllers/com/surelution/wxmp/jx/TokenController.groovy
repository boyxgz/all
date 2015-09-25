package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class TokenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tokenInstanceList: Token.list(params), tokenInstanceTotal: Token.count()]
    }

    def create() {
        [tokenInstance: new Token(params)]
    }

    def save() {
        def tokenInstance = new Token(params)
        if (!tokenInstance.save(flush: true)) {
            render(view: "create", model: [tokenInstance: tokenInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'token.label', default: 'Token'), tokenInstance.id])
        redirect(action: "show", id: tokenInstance.id)
    }

    def show(Long id) {
        def tokenInstance = Token.get(id)
        if (!tokenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'token.label', default: 'Token'), id])
            redirect(action: "list")
            return
        }

        [tokenInstance: tokenInstance]
    }

    def edit(Long id) {
        def tokenInstance = Token.get(id)
        if (!tokenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'token.label', default: 'Token'), id])
            redirect(action: "list")
            return
        }

        [tokenInstance: tokenInstance]
    }

    def update(Long id, Long version) {
        def tokenInstance = Token.get(id)
        if (!tokenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'token.label', default: 'Token'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tokenInstance.version > version) {
                tokenInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'token.label', default: 'Token')] as Object[],
                          "Another user has updated this Token while you were editing")
                render(view: "edit", model: [tokenInstance: tokenInstance])
                return
            }
        }

        tokenInstance.properties = params

        if (!tokenInstance.save(flush: true)) {
            render(view: "edit", model: [tokenInstance: tokenInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'token.label', default: 'Token'), tokenInstance.id])
        redirect(action: "show", id: tokenInstance.id)
    }

    def delete(Long id) {
        def tokenInstance = Token.get(id)
        if (!tokenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'token.label', default: 'Token'), id])
            redirect(action: "list")
            return
        }

        try {
            tokenInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'token.label', default: 'Token'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'token.label', default: 'Token'), id])
            redirect(action: "show", id: id)
        }
    }

	def some() {
		def token = new UbeanToken()
		token.amount = 100;
		token.save()
		render(token.sn)
	}
}
