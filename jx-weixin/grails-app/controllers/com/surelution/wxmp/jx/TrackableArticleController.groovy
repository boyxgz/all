package com.surelution.wxmp.jx

import org.springframework.dao.DataIntegrityViolationException

import com.surelution.whistle.core.Auth2Util;
import com.surelution.whistle.push.UserInfo;

class TrackableArticleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [trackableArticleInstanceList: TrackableArticle.list(params), trackableArticleInstanceTotal: TrackableArticle.count()]
    }

    def create() {
        [trackableArticleInstance: new TrackableArticle(params)]
    }

    def save() {
        def trackableArticleInstance = new TrackableArticle(params)
        if (!trackableArticleInstance.save(flush: true)) {
            render(view: "create", model: [trackableArticleInstance: trackableArticleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'trackableArticle.label', default: 'TrackableArticle'), trackableArticleInstance.id])
        redirect(action: "show", id: trackableArticleInstance.id)
    }

    def show(Long id) {
        def trackableArticleInstance = TrackableArticle.get(id)
        if (!trackableArticleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trackableArticle.label', default: 'TrackableArticle'), id])
            redirect(action: "list")
            return
        }

        [trackableArticleInstance: trackableArticleInstance]
    }

    def edit(Long id) {
        def trackableArticleInstance = TrackableArticle.get(id)
        if (!trackableArticleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trackableArticle.label', default: 'TrackableArticle'), id])
            redirect(action: "list")
            return
        }

        [trackableArticleInstance: trackableArticleInstance]
    }

    def update(Long id, Long version) {
        def trackableArticleInstance = TrackableArticle.get(id)
        if (!trackableArticleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trackableArticle.label', default: 'TrackableArticle'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (trackableArticleInstance.version > version) {
                trackableArticleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'trackableArticle.label', default: 'TrackableArticle')] as Object[],
                          "Another user has updated this TrackableArticle while you were editing")
                render(view: "edit", model: [trackableArticleInstance: trackableArticleInstance])
                return
            }
        }

        trackableArticleInstance.properties = params

        if (!trackableArticleInstance.save(flush: true)) {
            render(view: "edit", model: [trackableArticleInstance: trackableArticleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'trackableArticle.label', default: 'TrackableArticle'), trackableArticleInstance.id])
        redirect(action: "show", id: trackableArticleInstance.id)
    }

    def delete(Long id) {
        def trackableArticleInstance = TrackableArticle.get(id)
        if (!trackableArticleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trackableArticle.label', default: 'TrackableArticle'), id])
            redirect(action: "list")
            return
        }

        try {
            trackableArticleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'trackableArticle.label', default: 'TrackableArticle'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'trackableArticle.label', default: 'TrackableArticle'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def path(Long id) {
		//the url will be ../trackableArticle/path/(articleId)?code=(TheCodeFromAuth2.0)&state=(sharerOpenId)
		def code = params.code
		def sharerOpenId = params.state
		def readerOpenId = Auth2Util.getOpenidByCode(code)
		def article = TrackableArticle.get(id)
		
		def sharer = UserInfo.loadUserInfo(sharerOpenId)
		def reader = UserInfo.loadUserInfo(readerOpenId)
		
		def dest = "http://${request.serverName}${servletContext.contextPath}/trackableArticle/path/${id}"
		def url = Auth2Util.buildRedirectUrl(dest, sharerOpenId, Auth2Util.AuthScope.BASE)
		def tracking = new ReadingTracking()
		tracking.sharerOpenId = sharerOpenId
		tracking.readerOpenId = readerOpenId
		tracking.article = article
		tracking.readAt = new Date()
		tracking.save(flush:true)
		println url
		def subReader = Subscriber.findByOpenId(readerOpenId)
		def readerInvovled = false
		if(subReader) {
			def batch = VoucherBatch.findByCode("voice-gas")
			
			readerInvovled = Voucher.findBySubscriberAndBatch(subReader, batch) != null
		}
		[reader:reader, article:article, url:url, sharer:sharer, readerInvovled:readerInvovled]
	
	}
	
}
