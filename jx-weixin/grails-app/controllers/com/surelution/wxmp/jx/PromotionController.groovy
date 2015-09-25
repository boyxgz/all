package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class PromotionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        def pros = Promotion.createCriteria().list {
			eq('active', true)
			eq('main', true)
		}
		if(pros) {
			render(view: "content", model: [promotionInstance: pros[0]])
			return
		}
    }
	
	def item(Long id) {
		def pros = Promotion.get(id)
		if(pros) {
			render(view: "content", model: [promotionInstance: pros])
			return
		}
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [promotionInstanceList: Promotion.list(params), promotionInstanceTotal: Promotion.count()]
    }

    def create() {
        [promotionInstance: new Promotion(params)]
    }

    def save() {
        def promotionInstance = new Promotion(params)
        if (!promotionInstance.save(flush: true)) {
            render(view: "create", model: [promotionInstance: promotionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'promotion.label', default: 'Promotion'), promotionInstance.id])
        redirect(action: "show", id: promotionInstance.id)
    }

    def show(Long id) {
        def promotionInstance = Promotion.get(id)
        if (!promotionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'promotion.label', default: 'Promotion'), id])
            redirect(action: "list")
            return
        }

        [promotionInstance: promotionInstance]
    }

    def edit(Long id) {
        def promotionInstance = Promotion.get(id)
        if (!promotionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'promotion.label', default: 'Promotion'), id])
            redirect(action: "list")
            return
        }

        [promotionInstance: promotionInstance]
    }

    def update(Long id, Long version) {
        def promotionInstance = Promotion.get(id)
        if (!promotionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'promotion.label', default: 'Promotion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (promotionInstance.version > version) {
                promotionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'promotion.label', default: 'Promotion')] as Object[],
                          "Another user has updated this Promotion while you were editing")
                render(view: "edit", model: [promotionInstance: promotionInstance])
                return
            }
        }

        promotionInstance.properties = params

        if (!promotionInstance.save(flush: true)) {
            render(view: "edit", model: [promotionInstance: promotionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'promotion.label', default: 'Promotion'), promotionInstance.id])
        redirect(action: "show", id: promotionInstance.id)
    }

    def delete(Long id) {
        def promotionInstance = Promotion.get(id)
        if (!promotionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'promotion.label', default: 'Promotion'), id])
            redirect(action: "list")
            return
        }

        try {
            promotionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'promotion.label', default: 'Promotion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'promotion.label', default: 'Promotion'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def uSmile() {
        
    }
    
    def gas() {
        
    }
    
    def card() {
        
    }
    
    def selfHelp() {
        
    }
    
    def locationDemo() {
        
    }
    
    def gameDemo() {
        
    }
}
