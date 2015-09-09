package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class Fall2015ReceiptController {
//
//    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
//
//    def index() {
//        redirect(action: "list", params: params)
//    }
//
//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        [fall2015ReceiptInstanceList: Fall2015Receipt.list(params), fall2015ReceiptInstanceTotal: Fall2015Receipt.count()]
//    }
//
//    def create() {
//        [fall2015ReceiptInstance: new Fall2015Receipt(params)]
//    }
//
//    def save() {
//        def fall2015ReceiptInstance = new Fall2015Receipt(params)
//        if (!fall2015ReceiptInstance.save(flush: true)) {
//            render(view: "create", model: [fall2015ReceiptInstance: fall2015ReceiptInstance])
//            return
//        }
//
//        flash.message = message(code: 'default.created.message', args: [message(code: 'fall2015Receipt.label', default: 'Fall2015Receipt'), fall2015ReceiptInstance.id])
//        redirect(action: "show", id: fall2015ReceiptInstance.id)
//    }
//
//    def show(Long id) {
//        def fall2015ReceiptInstance = Fall2015Receipt.get(id)
//        if (!fall2015ReceiptInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fall2015Receipt.label', default: 'Fall2015Receipt'), id])
//            redirect(action: "list")
//            return
//        }
//
//        [fall2015ReceiptInstance: fall2015ReceiptInstance]
//    }
//
//    def edit(Long id) {
//        def fall2015ReceiptInstance = Fall2015Receipt.get(id)
//        if (!fall2015ReceiptInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fall2015Receipt.label', default: 'Fall2015Receipt'), id])
//            redirect(action: "list")
//            return
//        }
//
//        [fall2015ReceiptInstance: fall2015ReceiptInstance]
//    }
//
//    def update(Long id, Long version) {
//        def fall2015ReceiptInstance = Fall2015Receipt.get(id)
//        if (!fall2015ReceiptInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fall2015Receipt.label', default: 'Fall2015Receipt'), id])
//            redirect(action: "list")
//            return
//        }
//
//        if (version != null) {
//            if (fall2015ReceiptInstance.version > version) {
//                fall2015ReceiptInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
//                          [message(code: 'fall2015Receipt.label', default: 'Fall2015Receipt')] as Object[],
//                          "Another user has updated this Fall2015Receipt while you were editing")
//                render(view: "edit", model: [fall2015ReceiptInstance: fall2015ReceiptInstance])
//                return
//            }
//        }
//
//        fall2015ReceiptInstance.properties = params
//
//        if (!fall2015ReceiptInstance.save(flush: true)) {
//            render(view: "edit", model: [fall2015ReceiptInstance: fall2015ReceiptInstance])
//            return
//        }
//
//        flash.message = message(code: 'default.updated.message', args: [message(code: 'fall2015Receipt.label', default: 'Fall2015Receipt'), fall2015ReceiptInstance.id])
//        redirect(action: "show", id: fall2015ReceiptInstance.id)
//    }
//
//    def delete(Long id) {
//        def fall2015ReceiptInstance = Fall2015Receipt.get(id)
//        if (!fall2015ReceiptInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fall2015Receipt.label', default: 'Fall2015Receipt'), id])
//            redirect(action: "list")
//            return
//        }
//
//        try {
//            fall2015ReceiptInstance.delete(flush: true)
//            flash.message = message(code: 'default.deleted.message', args: [message(code: 'fall2015Receipt.label', default: 'Fall2015Receipt'), id])
//            redirect(action: "list")
//        }
//        catch (DataIntegrityViolationException e) {
//            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fall2015Receipt.label', default: 'Fall2015Receipt'), id])
//            redirect(action: "show", id: id)
//        }
//    }
}
