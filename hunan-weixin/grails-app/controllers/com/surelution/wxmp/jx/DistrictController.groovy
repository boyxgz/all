package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class DistrictController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [districtInstanceList: District.list(params), districtInstanceTotal: District.count()]
    }

    def create() {
        [districtInstance: new District(params)]
    }

    def save() {
        def districtInstance = new District(params)
        if (!districtInstance.save(flush: true)) {
            render(view: "create", model: [districtInstance: districtInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'district.label', default: 'District'), districtInstance.id])
        redirect(action: "show", id: districtInstance.id)
    }

    def show(Long id) {
        def districtInstance = District.get(id)
        if (!districtInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'district.label', default: 'District'), id])
            redirect(action: "list")
            return
        }

        [districtInstance: districtInstance]
    }

    def edit(Long id) {
        def districtInstance = District.get(id)
        if (!districtInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'district.label', default: 'District'), id])
            redirect(action: "list")
            return
        }

        [districtInstance: districtInstance]
    }

    def update(Long id, Long version) {
        def districtInstance = District.get(id)
        if (!districtInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'district.label', default: 'District'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (districtInstance.version > version) {
                districtInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'district.label', default: 'District')] as Object[],
                          "Another user has updated this District while you were editing")
                render(view: "edit", model: [districtInstance: districtInstance])
                return
            }
        }

        districtInstance.properties = params

        if (!districtInstance.save(flush: true)) {
            render(view: "edit", model: [districtInstance: districtInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'district.label', default: 'District'), districtInstance.id])
        redirect(action: "show", id: districtInstance.id)
    }

    def delete(Long id) {
        def districtInstance = District.get(id)
        if (!districtInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'district.label', default: 'District'), id])
            redirect(action: "list")
            return
        }

        try {
            districtInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'district.label', default: 'District'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'district.label', default: 'District'), id])
            redirect(action: "show", id: id)
        }
    }
}
