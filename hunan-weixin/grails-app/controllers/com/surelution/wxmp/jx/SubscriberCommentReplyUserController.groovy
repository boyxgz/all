package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class SubscriberCommentReplyUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [subscriberCommentReplyUserInstanceList: SubscriberCommentReplyUser.list(params), subscriberCommentReplyUserInstanceTotal: SubscriberCommentReplyUser.count()]
    }

    def create() {
        [subscriberCommentReplyUserInstance: new SubscriberCommentReplyUser(params)]
    }

    def save() {
        def subscriberCommentReplyUserInstance = new SubscriberCommentReplyUser(params)
        if (!subscriberCommentReplyUserInstance.save(flush: true)) {
            render(view: "create", model: [subscriberCommentReplyUserInstance: subscriberCommentReplyUserInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'subscriberCommentReplyUser.label', default: 'SubscriberCommentReplyUser'), subscriberCommentReplyUserInstance.id])
        redirect(action: "show", id: subscriberCommentReplyUserInstance.id)
    }

    def show(Long id) {
        def subscriberCommentReplyUserInstance = SubscriberCommentReplyUser.get(id)
        if (!subscriberCommentReplyUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscriberCommentReplyUser.label', default: 'SubscriberCommentReplyUser'), id])
            redirect(action: "list")
            return
        }

        [subscriberCommentReplyUserInstance: subscriberCommentReplyUserInstance]
    }

    def edit(Long id) {
        def subscriberCommentReplyUserInstance = SubscriberCommentReplyUser.get(id)
        if (!subscriberCommentReplyUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscriberCommentReplyUser.label', default: 'SubscriberCommentReplyUser'), id])
            redirect(action: "list")
            return
        }

        [subscriberCommentReplyUserInstance: subscriberCommentReplyUserInstance]
    }

    def update(Long id, Long version) {
        def subscriberCommentReplyUserInstance = SubscriberCommentReplyUser.get(id)
        if (!subscriberCommentReplyUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscriberCommentReplyUser.label', default: 'SubscriberCommentReplyUser'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (subscriberCommentReplyUserInstance.version > version) {
                subscriberCommentReplyUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subscriberCommentReplyUser.label', default: 'SubscriberCommentReplyUser')] as Object[],
                          "Another user has updated this SubscriberCommentReplyUser while you were editing")
                render(view: "edit", model: [subscriberCommentReplyUserInstance: subscriberCommentReplyUserInstance])
                return
            }
        }

        subscriberCommentReplyUserInstance.properties = params

        if (!subscriberCommentReplyUserInstance.save(flush: true)) {
            render(view: "edit", model: [subscriberCommentReplyUserInstance: subscriberCommentReplyUserInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'subscriberCommentReplyUser.label', default: 'SubscriberCommentReplyUser'), subscriberCommentReplyUserInstance.id])
        redirect(action: "show", id: subscriberCommentReplyUserInstance.id)
    }

    def delete(Long id) {
        def subscriberCommentReplyUserInstance = SubscriberCommentReplyUser.get(id)
        if (!subscriberCommentReplyUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscriberCommentReplyUser.label', default: 'SubscriberCommentReplyUser'), id])
            redirect(action: "list")
            return
        }

        try {
            subscriberCommentReplyUserInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subscriberCommentReplyUser.label', default: 'SubscriberCommentReplyUser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subscriberCommentReplyUser.label', default: 'SubscriberCommentReplyUser'), id])
            redirect(action: "show", id: id)
        }
    }
}
