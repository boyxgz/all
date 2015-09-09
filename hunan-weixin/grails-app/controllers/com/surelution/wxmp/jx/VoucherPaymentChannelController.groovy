package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class VoucherPaymentChannelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [voucherPaymentChannelInstanceList: VoucherPaymentChannel.list(params), voucherPaymentChannelInstanceTotal: VoucherPaymentChannel.count()]
    }

    def create() {
        [voucherPaymentChannelInstance: new VoucherPaymentChannel(params)]
    }

    def save() {
        def voucherPaymentChannelInstance = new VoucherPaymentChannel(params)
        if (!voucherPaymentChannelInstance.save(flush: true)) {
            render(view: "create", model: [voucherPaymentChannelInstance: voucherPaymentChannelInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'voucherPaymentChannel.label', default: 'VoucherPaymentChannel'), voucherPaymentChannelInstance.id])
        redirect(action: "show", id: voucherPaymentChannelInstance.id)
    }

    def show(Long id) {
        def voucherPaymentChannelInstance = VoucherPaymentChannel.get(id)
        if (!voucherPaymentChannelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voucherPaymentChannel.label', default: 'VoucherPaymentChannel'), id])
            redirect(action: "list")
            return
        }

        [voucherPaymentChannelInstance: voucherPaymentChannelInstance]
    }

    def edit(Long id) {
        def voucherPaymentChannelInstance = VoucherPaymentChannel.get(id)
        if (!voucherPaymentChannelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voucherPaymentChannel.label', default: 'VoucherPaymentChannel'), id])
            redirect(action: "list")
            return
        }

        [voucherPaymentChannelInstance: voucherPaymentChannelInstance]
    }

    def update(Long id, Long version) {
        def voucherPaymentChannelInstance = VoucherPaymentChannel.get(id)
        if (!voucherPaymentChannelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voucherPaymentChannel.label', default: 'VoucherPaymentChannel'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (voucherPaymentChannelInstance.version > version) {
                voucherPaymentChannelInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'voucherPaymentChannel.label', default: 'VoucherPaymentChannel')] as Object[],
                          "Another user has updated this VoucherPaymentChannel while you were editing")
                render(view: "edit", model: [voucherPaymentChannelInstance: voucherPaymentChannelInstance])
                return
            }
        }

        voucherPaymentChannelInstance.properties = params

        if (!voucherPaymentChannelInstance.save(flush: true)) {
            render(view: "edit", model: [voucherPaymentChannelInstance: voucherPaymentChannelInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'voucherPaymentChannel.label', default: 'VoucherPaymentChannel'), voucherPaymentChannelInstance.id])
        redirect(action: "show", id: voucherPaymentChannelInstance.id)
    }

    def delete(Long id) {
        def voucherPaymentChannelInstance = VoucherPaymentChannel.get(id)
        if (!voucherPaymentChannelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voucherPaymentChannel.label', default: 'VoucherPaymentChannel'), id])
            redirect(action: "list")
            return
        }

        try {
            voucherPaymentChannelInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'voucherPaymentChannel.label', default: 'VoucherPaymentChannel'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'voucherPaymentChannel.label', default: 'VoucherPaymentChannel'), id])
            redirect(action: "show", id: id)
        }
    }
}
