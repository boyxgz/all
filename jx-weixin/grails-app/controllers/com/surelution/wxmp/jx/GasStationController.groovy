package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class GasStationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [gasStationInstanceList: GasStation.list(params), gasStationInstanceTotal: GasStation.count()]
    }

    def create() {
        [gasStationInstance: new GasStation(params)]
    }

    def save() {
        def gasStationInstance = new GasStation(params)
        if (!gasStationInstance.save(flush: true)) {
            render(view: "create", model: [gasStationInstance: gasStationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'gasStation.label', default: 'GasStation'), gasStationInstance.id])
        redirect(action: "show", id: gasStationInstance.id)
    }

    def show(Long id) {
        def gasStationInstance = GasStation.get(id)
        if (!gasStationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gasStation.label', default: 'GasStation'), id])
            redirect(action: "list")
            return
        }

        [gasStationInstance: gasStationInstance]
    }

    def edit(Long id) {
        def gasStationInstance = GasStation.get(id)
        if (!gasStationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gasStation.label', default: 'GasStation'), id])
            redirect(action: "list")
            return
        }

        [gasStationInstance: gasStationInstance]
    }

    def update(Long id, Long version) {
        def gasStationInstance = GasStation.get(id)
        if (!gasStationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gasStation.label', default: 'GasStation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gasStationInstance.version > version) {
                gasStationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gasStation.label', default: 'GasStation')] as Object[],
                          "Another user has updated this GasStation while you were editing")
                render(view: "edit", model: [gasStationInstance: gasStationInstance])
                return
            }
        }

        gasStationInstance.properties = params

        if (!gasStationInstance.save(flush: true)) {
            render(view: "edit", model: [gasStationInstance: gasStationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'gasStation.label', default: 'GasStation'), gasStationInstance.id])
        redirect(action: "show", id: gasStationInstance.id)
    }

    def delete(Long id) {
        def gasStationInstance = GasStation.get(id)
        if (!gasStationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gasStation.label', default: 'GasStation'), id])
            redirect(action: "list")
            return
        }

        try {
            gasStationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gasStation.label', default: 'GasStation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gasStation.label', default: 'GasStation'), id])
            redirect(action: "show", id: id)
        }
    }
}
