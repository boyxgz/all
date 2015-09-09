package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

import com.surelution.whistle.core.NewsAttribute

class MultiNewsMessageItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [multiNewsMessageItemInstanceList: MultiNewsMessageItem.list(params), multiNewsMessageItemInstanceTotal: MultiNewsMessageItem.count()]
    }

    def create() {
        [multiNewsMessageItemInstance: new MultiNewsMessageItem(params)]
    }

    def save() {
        def multiNewsMessageItemInstance = new MultiNewsMessageItem(params)
		multiNewsMessageItemInstance.clearErrors()
		def createdAt = params.date('createdAt', 'yyyy-MM-dd')
		multiNewsMessageItemInstance.createdAt = createdAt
        if (!multiNewsMessageItemInstance.save(flush: true)) {
			println multiNewsMessageItemInstance.errors
            render(view: "create", model: [multiNewsMessageItemInstance: multiNewsMessageItemInstance])
            return
        }
		
		if(!multiNewsMessageItemInstance.globalMessage) {
			params.itemBranch.each {branchId->
				def branch = Branch.get(branchId)
				if(branch) {
					def mnmib = new MultiNewsMessageItemBranch()
					mnmib.branch = branch
					mnmib.item = multiNewsMessageItemInstance
					mnmib.save(flush:true)
				}
			}
		}
		multiNewsMessageItemInstance.errors.each {
			println it
		}

        flash.message = message(code: 'default.created.message', args: [message(code: 'multiNewsMessageItem.label', default: 'MultiNewsMessageItem'), multiNewsMessageItemInstance.id])
        redirect(action: "show", id: multiNewsMessageItemInstance.id)
    }

    def show(Long id) {
        def multiNewsMessageItemInstance = MultiNewsMessageItem.get(id)
        if (!multiNewsMessageItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'multiNewsMessageItem.label', default: 'MultiNewsMessageItem'), id])
            redirect(action: "list")
            return
        }

        [multiNewsMessageItemInstance: multiNewsMessageItemInstance]
    }

    def edit(Long id) {
        def multiNewsMessageItemInstance = MultiNewsMessageItem.get(id)
        if (!multiNewsMessageItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'multiNewsMessageItem.label', default: 'MultiNewsMessageItem'), id])
            redirect(action: "list")
            return
        }

        [multiNewsMessageItemInstance: multiNewsMessageItemInstance]
    }

    def update(Long id, Long version) {
        def multiNewsMessageItemInstance = MultiNewsMessageItem.get(id)
        if (!multiNewsMessageItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'multiNewsMessageItem.label', default: 'MultiNewsMessageItem'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (multiNewsMessageItemInstance.version > version) {
                multiNewsMessageItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'multiNewsMessageItem.label', default: 'MultiNewsMessageItem')] as Object[],
                          "Another user has updated this MultiNewsMessageItem while you were editing")
                render(view: "edit", model: [multiNewsMessageItemInstance: multiNewsMessageItemInstance])
                return
            }
        }

        multiNewsMessageItemInstance.properties = params
		multiNewsMessageItemInstance.clearErrors()
		if(params.createdAt) {
			multiNewsMessageItemInstance.createdAt = params.date('createdAt', "yyyy-MM-dd")
		}
		if(params.expiredAt) {
			multiNewsMessageItemInstance.exipredAt = params.date('expiredAt', 'yyyy-MM-dd')
		}

        if (!multiNewsMessageItemInstance.save(flush: true)) {
            render(view: "edit", model: [multiNewsMessageItemInstance: multiNewsMessageItemInstance])
            return
        }
		
		if(!multiNewsMessageItemInstance.globalMessage) {
			def items = MultiNewsMessageItemBranch.findAllByItem(multiNewsMessageItemInstance)
			if(items) {
				items.each {it.delete(flush:true)}
			}
			params.list('itemBranch').each {branchId->
				def branch = Branch.get(branchId)
				if(branch) {
					def mnmib = new MultiNewsMessageItemBranch()
					mnmib.branch = branch
					mnmib.item = multiNewsMessageItemInstance
					mnmib.save(flush:true)
				}
			}
		}

        flash.message = message(code: 'default.updated.message', args: [message(code: 'multiNewsMessageItem.label', default: 'MultiNewsMessageItem'), multiNewsMessageItemInstance.id])
        redirect(action: "show", id: multiNewsMessageItemInstance.id)
    }

    def delete(Long id) {
        def multiNewsMessageItemInstance = MultiNewsMessageItem.get(id)
        if (!multiNewsMessageItemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'multiNewsMessageItem.label', default: 'MultiNewsMessageItem'), id])
            redirect(action: "list")
            return
        }

        try {
            multiNewsMessageItemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'multiNewsMessageItem.label', default: 'MultiNewsMessageItem'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'multiNewsMessageItem.label', default: 'MultiNewsMessageItem'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def test(String id) {
		def mnm = MultiNewsMessage.findByMenuKey(id)
		NewsAttribute na = new NewsAttribute()
		def items = MultiNewsMessageItem.createCriteria().list {
			eq('message', mnm)
			order('firstNews', 'desc')
		}
		items.each {item->
			na.add(item.title, item.description, item.pictureUrl, item.url)
		}
		render(na.toXml())
	}
}
