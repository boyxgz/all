package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class ReadingTrackingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [readingTrackingInstanceList: ReadingTracking.list(params), readingTrackingInstanceTotal: ReadingTracking.count()]
    }

    def create() {
        [readingTrackingInstance: new ReadingTracking(params)]
    }

    def save() {
        def readingTrackingInstance = new ReadingTracking(params)
        if (!readingTrackingInstance.save(flush: true)) {
            render(view: "create", model: [readingTrackingInstance: readingTrackingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'readingTracking.label', default: 'ReadingTracking'), readingTrackingInstance.id])
        redirect(action: "show", id: readingTrackingInstance.id)
    }

    def show(Long id) {
        def readingTrackingInstance = ReadingTracking.get(id)
        if (!readingTrackingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'readingTracking.label', default: 'ReadingTracking'), id])
            redirect(action: "list")
            return
        }

        [readingTrackingInstance: readingTrackingInstance]
    }

    def edit(Long id) {
        def readingTrackingInstance = ReadingTracking.get(id)
        if (!readingTrackingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'readingTracking.label', default: 'ReadingTracking'), id])
            redirect(action: "list")
            return
        }

        [readingTrackingInstance: readingTrackingInstance]
    }

    def update(Long id, Long version) {
        def readingTrackingInstance = ReadingTracking.get(id)
        if (!readingTrackingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'readingTracking.label', default: 'ReadingTracking'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (readingTrackingInstance.version > version) {
                readingTrackingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'readingTracking.label', default: 'ReadingTracking')] as Object[],
                          "Another user has updated this ReadingTracking while you were editing")
                render(view: "edit", model: [readingTrackingInstance: readingTrackingInstance])
                return
            }
        }

        readingTrackingInstance.properties = params

        if (!readingTrackingInstance.save(flush: true)) {
            render(view: "edit", model: [readingTrackingInstance: readingTrackingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'readingTracking.label', default: 'ReadingTracking'), readingTrackingInstance.id])
        redirect(action: "show", id: readingTrackingInstance.id)
    }

    def delete(Long id) {
        def readingTrackingInstance = ReadingTracking.get(id)
        if (!readingTrackingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'readingTracking.label', default: 'ReadingTracking'), id])
            redirect(action: "list")
            return
        }

        try {
            readingTrackingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'readingTracking.label', default: 'ReadingTracking'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'readingTracking.label', default: 'ReadingTracking'), id])
            redirect(action: "show", id: id)
        }
    }
}
