package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

import com.surelution.whistle.core.TextCustomerServiceMessage;

class SubscriberCommentAssignmentController {
	
	def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
		def closedId = params['closedId']
		def user = springSecurityService.currentUser
		def subscriberCommentAssignmentInstanceList
			
		if (!closedId || closedId=="未处理"){
			subscriberCommentAssignmentInstanceList = SubscriberCommentAssignment.findAllByUserAndClosed(user, false)
		} else if (closedId=="已处理"){
			subscriberCommentAssignmentInstanceList = SubscriberCommentAssignment.findAllByUserAndClosed(user, true)
		} else {
			subscriberCommentAssignmentInstanceList = SubscriberCommentAssignment.findAllByUser(user)
		}
        [subscriberCommentAssignmentInstanceList: subscriberCommentAssignmentInstanceList,closedId:closedId]
    }

    def create() {
        [subscriberCommentAssignmentInstance: new SubscriberCommentAssignment(params)]
    }

    def save() {
        def subscriberCommentAssignmentInstance = new SubscriberCommentAssignment(params)
        if (!subscriberCommentAssignmentInstance.save(flush: true)) {
            render(view: "create", model: [subscriberCommentAssignmentInstance: subscriberCommentAssignmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'subscriberCommentAssignment.label', default: 'SubscriberCommentAssignment'), subscriberCommentAssignmentInstance.id])
        redirect(action: "show", id: subscriberCommentAssignmentInstance.id)
    }

    def show(Long id) {
        def subscriberCommentAssignmentInstance = SubscriberCommentAssignment.get(id)
        if (!subscriberCommentAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscriberCommentAssignment.label', default: 'SubscriberCommentAssignment'), id])
            redirect(action: "list")
            return
        }
		
		def subscriber = subscriberCommentAssignmentInstance.subscriber
		
		def subscriberComments =SubscriberComment.createCriteria().list {
			eq('subscriber', subscriber)
			order('createdAt', 'desc')
		}

        [subscriberCommentAssignmentInstance: subscriberCommentAssignmentInstance, subscriberComments: subscriberComments]
    }

    def edit(Long id) {
        def subscriberCommentAssignmentInstance = SubscriberCommentAssignment.get(id)
        if (!subscriberCommentAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscriberCommentAssignment.label', default: 'SubscriberCommentAssignment'), id])
            redirect(action: "list")
            return
        }

        [subscriberCommentAssignmentInstance: subscriberCommentAssignmentInstance]
    }

    def update(Long id, Long version) {
        def subscriberCommentAssignmentInstance = SubscriberCommentAssignment.get(id)
        if (!subscriberCommentAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscriberCommentAssignment.label', default: 'SubscriberCommentAssignment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (subscriberCommentAssignmentInstance.version > version) {
                subscriberCommentAssignmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'subscriberCommentAssignment.label', default: 'SubscriberCommentAssignment')] as Object[],
                          "Another user has updated this SubscriberCommentAssignment while you were editing")
                render(view: "edit", model: [subscriberCommentAssignmentInstance: subscriberCommentAssignmentInstance])
                return
            }
        }

        subscriberCommentAssignmentInstance.properties = params

        if (!subscriberCommentAssignmentInstance.save(flush: true)) {
            render(view: "edit", model: [subscriberCommentAssignmentInstance: subscriberCommentAssignmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'subscriberCommentAssignment.label', default: 'SubscriberCommentAssignment'), subscriberCommentAssignmentInstance.id])
        redirect(action: "show", id: subscriberCommentAssignmentInstance.id)
    }

    def delete(Long id) {
        def subscriberCommentAssignmentInstance = SubscriberCommentAssignment.get(id)
        if (!subscriberCommentAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscriberCommentAssignment.label', default: 'SubscriberCommentAssignment'), id])
            redirect(action: "list")
            return
        }

        try {
            subscriberCommentAssignmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subscriberCommentAssignment.label', default: 'SubscriberCommentAssignment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subscriberCommentAssignment.label', default: 'SubscriberCommentAssignment'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def reply() {
		def replyTo = params.replyTo
		def replyContent = params.replyContent
		def sc = SubscriberComment.get(replyTo)
		
		def scr = new SubscriberCommentReply()
		scr.comment = sc
		scr.user = springSecurityService.currentUser
		scr.repliedAt = new Date()
		scr.content = replyContent
		scr.save(flush:true)
		TextCustomerServiceMessage tcsm = new TextCustomerServiceMessage()
		tcsm.touser = sc.subscriber.openId
		tcsm.content = replyContent
		tcsm.send()

		redirect(action:"show", id:params.subscriberCommentAssignmentId)
	}
	
	def closeCommentAssignment(Long id) {
		def sca = SubscriberCommentAssignment.get(id)
		sca.closed = true
		sca.save(flush:true)
		redirect(action:"show", id:id)
	}
	
	def reAssign(Long id) {
		def sca = SubscriberCommentAssignment.get(id)
		sca.tips = "由${springSecurityService.currentUser.username}指派过来"
		sca.user = User.get(params.userId)
		sca.save(flush:true)
		redirect(action:"show", id:id)
	}
}
