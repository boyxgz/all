package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class WeatherItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [weatherItemInstanceList: WeatherItem.list(params), weatherItemInstanceTotal: WeatherItem.count()]
    }

    def create() {
        [weatherItemInstance: new WeatherItem(params)]
    }

    def save() {
        def weatherItemInstance = new WeatherItem(params)
        if (!weatherItemInstance.save(flush: true)) {
            render(view: "create", model: [weatherItemInstance: weatherItemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'weatherItem.label', default: 'WeatherItem'), weatherItemInstance.id])
        redirect(action: "show", id: weatherItemInstance.id)
    }

    def show(Long id) {
        def weatherItemInstance = WeatherItem.get(id)
        if (!weatherItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'weatherItem.label', default: 'WeatherItem'), id])
            redirect(action: "list")
            return
        }

        [weatherItemInstance: weatherItemInstance]
    }

    def edit(Long id) {
        def weatherItemInstance = WeatherItem.get(id)
        if (!weatherItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'weatherItem.label', default: 'WeatherItem'), id])
            redirect(action: "list")
            return
        }

        [weatherItemInstance: weatherItemInstance]
    }

    def update(Long id, Long version) {
        def weatherItemInstance = WeatherItem.get(id)
        if (!weatherItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'weatherItem.label', default: 'WeatherItem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (weatherItemInstance.version > version) {
                weatherItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'weatherItem.label', default: 'WeatherItem')] as Object[],
                          "Another user has updated this WeatherItem while you were editing")
                render(view: "edit", model: [weatherItemInstance: weatherItemInstance])
                return
            }
        }

        weatherItemInstance.properties = params

        if (!weatherItemInstance.save(flush: true)) {
            render(view: "edit", model: [weatherItemInstance: weatherItemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'weatherItem.label', default: 'WeatherItem'), weatherItemInstance.id])
        redirect(action: "show", id: weatherItemInstance.id)
    }

    def delete(Long id) {
        def weatherItemInstance = WeatherItem.get(id)
        if (!weatherItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'weatherItem.label', default: 'WeatherItem'), id])
            redirect(action: "list")
            return
        }

        try {
            weatherItemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'weatherItem.label', default: 'WeatherItem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'weatherItem.label', default: 'WeatherItem'), id])
            redirect(action: "show", id: id)
        }
    }
}
