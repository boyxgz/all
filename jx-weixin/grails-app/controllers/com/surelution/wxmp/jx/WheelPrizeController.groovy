package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class WheelPrizeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [wheelPrizeInstanceList: WheelPrize.list(params), wheelPrizeInstanceTotal: WheelPrize.count()]
    }

    def create() {
        [wheelPrizeInstance: new WheelPrize(params)]
    }

    def save() {
        def wheelPrizeInstance = new WheelPrize(params)
        if (!wheelPrizeInstance.save(flush: true)) {
            render(view: "create", model: [wheelPrizeInstance: wheelPrizeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'wheelPrize.label', default: 'WheelPrize'), wheelPrizeInstance.id])
        redirect(action: "show", id: wheelPrizeInstance.id)
    }

    def show(Long id) {
        def wheelPrizeInstance = WheelPrize.get(id)
        if (!wheelPrizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wheelPrize.label', default: 'WheelPrize'), id])
            redirect(action: "list")
            return
        }

        [wheelPrizeInstance: wheelPrizeInstance]
    }

    def edit(Long id) {
        def wheelPrizeInstance = WheelPrize.get(id)
        if (!wheelPrizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wheelPrize.label', default: 'WheelPrize'), id])
            redirect(action: "list")
            return
        }

        [wheelPrizeInstance: wheelPrizeInstance]
    }

    def update(Long id, Long version) {
        def wheelPrizeInstance = WheelPrize.get(id)
        if (!wheelPrizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wheelPrize.label', default: 'WheelPrize'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (wheelPrizeInstance.version > version) {
                wheelPrizeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'wheelPrize.label', default: 'WheelPrize')] as Object[],
                          "Another user has updated this WheelPrize while you were editing")
                render(view: "edit", model: [wheelPrizeInstance: wheelPrizeInstance])
                return
            }
        }

        wheelPrizeInstance.properties = params

        if (!wheelPrizeInstance.save(flush: true)) {
            render(view: "edit", model: [wheelPrizeInstance: wheelPrizeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'wheelPrize.label', default: 'WheelPrize'), wheelPrizeInstance.id])
        redirect(action: "show", id: wheelPrizeInstance.id)
    }

    def delete(Long id) {
        def wheelPrizeInstance = WheelPrize.get(id)
        if (!wheelPrizeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wheelPrize.label', default: 'WheelPrize'), id])
            redirect(action: "list")
            return
        }

        try {
            wheelPrizeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'wheelPrize.label', default: 'WheelPrize'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wheelPrize.label', default: 'WheelPrize'), id])
            redirect(action: "show", id: id)
        }
    }
}
