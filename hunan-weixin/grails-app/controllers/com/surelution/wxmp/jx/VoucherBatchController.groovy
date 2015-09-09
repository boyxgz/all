package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class VoucherBatchController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [voucherBatchInstanceList: VoucherBatch.list(params), voucherBatchInstanceTotal: VoucherBatch.count()]
    }

    def create() {
        [voucherBatchInstance: new VoucherBatch(params)]
    }

    def save() {
        def voucherBatchInstance = new VoucherBatch(params)
        if (!voucherBatchInstance.save(flush: true)) {
            render(view: "create", model: [voucherBatchInstance: voucherBatchInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'voucherBatch.label', default: 'VoucherBatch'), voucherBatchInstance.id])
        redirect(action: "show", id: voucherBatchInstance.id)
    }

    def show(Long id) {
        def voucherBatchInstance = VoucherBatch.get(id)
        if (!voucherBatchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voucherBatch.label', default: 'VoucherBatch'), id])
            redirect(action: "list")
            return
        }

        [voucherBatchInstance: voucherBatchInstance]
    }

    def edit(Long id) {
        def voucherBatchInstance = VoucherBatch.get(id)
        if (!voucherBatchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voucherBatch.label', default: 'VoucherBatch'), id])
            redirect(action: "list")
            return
        }

        [voucherBatchInstance: voucherBatchInstance]
    }

    def update(Long id, Long version) {
        def voucherBatchInstance = VoucherBatch.get(id)
        if (!voucherBatchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voucherBatch.label', default: 'VoucherBatch'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (voucherBatchInstance.version > version) {
                voucherBatchInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'voucherBatch.label', default: 'VoucherBatch')] as Object[],
                          "Another user has updated this VoucherBatch while you were editing")
                render(view: "edit", model: [voucherBatchInstance: voucherBatchInstance])
                return
            }
        }

        voucherBatchInstance.properties = params

        if (!voucherBatchInstance.save(flush: true)) {
            render(view: "edit", model: [voucherBatchInstance: voucherBatchInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'voucherBatch.label', default: 'VoucherBatch'), voucherBatchInstance.id])
        redirect(action: "show", id: voucherBatchInstance.id)
    }

    def delete(Long id) {
        def voucherBatchInstance = VoucherBatch.get(id)
        if (!voucherBatchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'voucherBatch.label', default: 'VoucherBatch'), id])
            redirect(action: "list")
            return
        }

        try {
            voucherBatchInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'voucherBatch.label', default: 'VoucherBatch'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'voucherBatch.label', default: 'VoucherBatch'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def a() {
		def sb = new StringBuffer()
		if(params.step && params.amount) {
			int step = params.int('step')
			int amount = params.int('amount')
			def r = new Random()
			for(int i = 0; i < amount; i++) {
				int a = r.nextInt(step)
				sb.append("${i*step+a},")
			}
		}
		[line:sb.toString()]
	}
}
