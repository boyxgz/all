package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class PromotionNoticeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [promotionNoticeInstanceList: PromotionNotice.list(params), promotionNoticeInstanceTotal: PromotionNotice.count()]
    }

    def create() {
        [promotionNoticeInstance: new PromotionNotice(params)]
    }

    def save() {
        def promotionNoticeInstance = new PromotionNotice(params)
        if (!promotionNoticeInstance.save(flush: true)) {
            render(view: "create", model: [promotionNoticeInstance: promotionNoticeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'promotionNotice.label', default: 'PromotionNotice'), promotionNoticeInstance.id])
        redirect(action: "show", id: promotionNoticeInstance.id)
    }

    def show(Long id) {
        def promotionNoticeInstance = PromotionNotice.get(id)
        if (!promotionNoticeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'promotionNotice.label', default: 'PromotionNotice'), id])
            redirect(action: "list")
            return
        }

        [promotionNoticeInstance: promotionNoticeInstance]
    }

    def edit(Long id) {
        def promotionNoticeInstance = PromotionNotice.get(id)
        if (!promotionNoticeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'promotionNotice.label', default: 'PromotionNotice'), id])
            redirect(action: "list")
            return
        }

        [promotionNoticeInstance: promotionNoticeInstance]
    }

    def update(Long id, Long version) {
        def promotionNoticeInstance = PromotionNotice.get(id)
        if (!promotionNoticeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'promotionNotice.label', default: 'PromotionNotice'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (promotionNoticeInstance.version > version) {
                promotionNoticeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'promotionNotice.label', default: 'PromotionNotice')] as Object[],
                          "Another user has updated this PromotionNotice while you were editing")
                render(view: "edit", model: [promotionNoticeInstance: promotionNoticeInstance])
                return
            }
        }

        promotionNoticeInstance.properties = params

        if (!promotionNoticeInstance.save(flush: true)) {
            render(view: "edit", model: [promotionNoticeInstance: promotionNoticeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'promotionNotice.label', default: 'PromotionNotice'), promotionNoticeInstance.id])
        redirect(action: "show", id: promotionNoticeInstance.id)
    }

    def delete(Long id) {
        def promotionNoticeInstance = PromotionNotice.get(id)
        if (!promotionNoticeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'promotionNotice.label', default: 'PromotionNotice'), id])
            redirect(action: "list")
            return
        }

        try {
            promotionNoticeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'promotionNotice.label', default: 'PromotionNotice'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'promotionNotice.label', default: 'PromotionNotice'), id])
            redirect(action: "show", id: id)
        }
    }
}
