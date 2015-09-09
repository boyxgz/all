package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

class DynArticleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [dynArticleInstanceList: DynArticle.list(params), dynArticleInstanceTotal: DynArticle.count()]
    }

    def create() {
        [dynArticleInstance: new DynArticle(params)]
    }

    def save() {
        def dynArticleInstance = new DynArticle(params)
        if (!dynArticleInstance.save(flush: true)) {
            render(view: "create", model: [dynArticleInstance: dynArticleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'dynArticle.label', default: 'DynArticle'), dynArticleInstance.id])
        redirect(action: "show", id: dynArticleInstance.id)
    }

    def show(Long id) {
        def dynArticleInstance = DynArticle.get(id)
        if (!dynArticleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dynArticle.label', default: 'DynArticle'), id])
            redirect(action: "list")
            return
        }

        [dynArticleInstance: dynArticleInstance]
    }

    def edit(Long id) {
        def dynArticleInstance = DynArticle.get(id)
        if (!dynArticleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dynArticle.label', default: 'DynArticle'), id])
            redirect(action: "list")
            return
        }

        [dynArticleInstance: dynArticleInstance]
    }

    def update(Long id, Long version) {
        def dynArticleInstance = DynArticle.get(id)
        if (!dynArticleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dynArticle.label', default: 'DynArticle'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dynArticleInstance.version > version) {
                dynArticleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dynArticle.label', default: 'DynArticle')] as Object[],
                          "Another user has updated this DynArticle while you were editing")
                render(view: "edit", model: [dynArticleInstance: dynArticleInstance])
                return
            }
        }

        dynArticleInstance.properties = params

        if (!dynArticleInstance.save(flush: true)) {
            render(view: "edit", model: [dynArticleInstance: dynArticleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dynArticle.label', default: 'DynArticle'), dynArticleInstance.id])
        redirect(action: "show", id: dynArticleInstance.id)
    }

    def delete(Long id) {
        def dynArticleInstance = DynArticle.get(id)
        if (!dynArticleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dynArticle.label', default: 'DynArticle'), id])
            redirect(action: "list")
            return
        }

        try {
            dynArticleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dynArticle.label', default: 'DynArticle'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dynArticle.label', default: 'DynArticle'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def filePath(String id) {
		def da = DynArticle.findByCode(id)
		def content
		if(da) {
			content = da.content
		} else {
			def km = KeyedMessage.findByKey("ARTICLE-ABSENT")
			if(km) {
				content = "${km.message}<br>[${id}]"
			} else {
				content = ""
			}
		}
		[content:content]
	}
}
