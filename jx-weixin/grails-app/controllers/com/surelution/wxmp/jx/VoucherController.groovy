package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class VoucherController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [voucherInstanceList: Voucher.list(params), voucherInstanceTotal: Voucher.count()]
    }

    def create() {
        [voucherInstance: new Voucher(params)]
    }

    def save() {
        def voucherInstance = new Voucher(params)
        if (!voucherInstance.save(flush: true)) {
            render(view: "create", model: [voucherInstance: voucherInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'voucher.label', default: 'Voucher'), voucherInstance.id])
        redirect(action: "show", id: voucherInstance.id)
    }

    def show(Long id) {
        def voucherInstance = Voucher.get(id)
        if (!voucherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voucher.label', default: 'Voucher'), id])
            redirect(action: "list")
            return
        }

        [voucherInstance: voucherInstance]
    }

    def edit(Long id) {
        def voucherInstance = Voucher.get(id)
        if (!voucherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voucher.label', default: 'Voucher'), id])
            redirect(action: "list")
            return
        }

        [voucherInstance: voucherInstance]
    }

    def update(Long id, Long version) {
        def voucherInstance = Voucher.get(id)
        if (!voucherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voucher.label', default: 'Voucher'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (voucherInstance.version > version) {
                voucherInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'voucher.label', default: 'Voucher')] as Object[],
                          "Another user has updated this Voucher while you were editing")
                render(view: "edit", model: [voucherInstance: voucherInstance])
                return
            }
        }

        voucherInstance.properties = params

        if (!voucherInstance.save(flush: true)) {
            render(view: "edit", model: [voucherInstance: voucherInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'voucher.label', default: 'Voucher'), voucherInstance.id])
        redirect(action: "show", id: voucherInstance.id)
    }

    def delete(Long id) {
        def voucherInstance = Voucher.get(id)
        if (!voucherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voucher.label', default: 'Voucher'), id])
            redirect(action: "list")
            return
        }

        try {
            voucherInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'voucher.label', default: 'Voucher'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'voucher.label', default: 'Voucher'), id])
            redirect(action: "show", id: id)
        }
    }
}
