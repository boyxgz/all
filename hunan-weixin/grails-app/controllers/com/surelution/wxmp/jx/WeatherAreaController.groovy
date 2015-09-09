package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class WeatherAreaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [weatherAreaInstanceList: WeatherArea.list(params), weatherAreaInstanceTotal: WeatherArea.count()]
    }

    def create() {
        [weatherAreaInstance: new WeatherArea(params)]
    }

    def save() {
        def weatherAreaInstance = new WeatherArea(params)
        if (!weatherAreaInstance.save(flush: true)) {
            render(view: "create", model: [weatherAreaInstance: weatherAreaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'weatherArea.label', default: 'WeatherArea'), weatherAreaInstance.id])
        redirect(action: "show", id: weatherAreaInstance.id)
    }

    def show(Long id) {
        def weatherAreaInstance = WeatherArea.get(id)
        if (!weatherAreaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'weatherArea.label', default: 'WeatherArea'), id])
            redirect(action: "list")
            return
        }

        [weatherAreaInstance: weatherAreaInstance]
    }

    def edit(Long id) {
        def weatherAreaInstance = WeatherArea.get(id)
        if (!weatherAreaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'weatherArea.label', default: 'WeatherArea'), id])
            redirect(action: "list")
            return
        }

        [weatherAreaInstance: weatherAreaInstance]
    }

    def update(Long id, Long version) {
        def weatherAreaInstance = WeatherArea.get(id)
        if (!weatherAreaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'weatherArea.label', default: 'WeatherArea'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (weatherAreaInstance.version > version) {
                weatherAreaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'weatherArea.label', default: 'WeatherArea')] as Object[],
                          "Another user has updated this WeatherArea while you were editing")
                render(view: "edit", model: [weatherAreaInstance: weatherAreaInstance])
                return
            }
        }

        weatherAreaInstance.properties = params

        if (!weatherAreaInstance.save(flush: true)) {
            render(view: "edit", model: [weatherAreaInstance: weatherAreaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'weatherArea.label', default: 'WeatherArea'), weatherAreaInstance.id])
        redirect(action: "show", id: weatherAreaInstance.id)
    }

    def delete(Long id) {
        def weatherAreaInstance = WeatherArea.get(id)
        if (!weatherAreaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'weatherArea.label', default: 'WeatherArea'), id])
            redirect(action: "list")
            return
        }

        try {
            weatherAreaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'weatherArea.label', default: 'WeatherArea'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'weatherArea.label', default: 'WeatherArea'), id])
            redirect(action: "show", id: id)
        }
    }
}
