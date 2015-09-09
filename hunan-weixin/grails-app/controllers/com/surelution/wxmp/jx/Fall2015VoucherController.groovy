package com.surelution.wxmp.jx

import grails.util.Holders

import org.springframework.dao.DataIntegrityViolationException

import com.surelution.whistle.core.TemplateMessage;
import com.surelution.wxmp.jx.Fall2015Voucher.ReviewStatus

class Fall2015VoucherController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.offset = params.offset?params.offset:0
		def vouchers
		if(params.reviewStatus) {
			def status = ReviewStatus.valueOf(params.reviewStatus)
			vouchers = Fall2015Voucher.createCriteria().list(max: params.max, offset: params.offset) {
				eq('reviewStatus', status)
			}
		}
		
        [fall2015VoucherInstanceList: vouchers, fall2015VoucherInstanceTotal: vouchers?.totalCount?vouchers.totalCount:0]
    }

    def create() {
        [fall2015VoucherInstance: new Fall2015Voucher(params)]
    }

    def save() {
        def fall2015VoucherInstance = new Fall2015Voucher(params)
        if (!fall2015VoucherInstance.save(flush: true)) {
            render(view: "create", model: [fall2015VoucherInstance: fall2015VoucherInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher'), fall2015VoucherInstance.id])
        redirect(action: "show", id: fall2015VoucherInstance.id)
    }

    def show(Long id) {
        def fall2015VoucherInstance = Fall2015Voucher.get(id)
        if (!fall2015VoucherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher'), id])
            redirect(action: "list")
            return
        }

        [fall2015VoucherInstance: fall2015VoucherInstance]
    }

    def edit(Long id) {
        def fall2015VoucherInstance = Fall2015Voucher.get(id)
        if (!fall2015VoucherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher'), id])
            redirect(action: "list")
            return
        }

        [fall2015VoucherInstance: fall2015VoucherInstance]
    }

    def update(Long id, Long version) {
        def fall2015VoucherInstance = Fall2015Voucher.get(id)
        if (!fall2015VoucherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (fall2015VoucherInstance.version > version) {
                fall2015VoucherInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher')] as Object[],
                          "Another user has updated this Fall2015Voucher while you were editing")
                render(view: "edit", model: [fall2015VoucherInstance: fall2015VoucherInstance])
                return
            }
        }

        fall2015VoucherInstance.properties = params

        if (!fall2015VoucherInstance.save(flush: true)) {
            render(view: "edit", model: [fall2015VoucherInstance: fall2015VoucherInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher'), fall2015VoucherInstance.id])
        redirect(action: "show", id: fall2015VoucherInstance.id)
    }

    def delete(Long id) {
        def fall2015VoucherInstance = Fall2015Voucher.get(id)
        if (!fall2015VoucherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher'), id])
            redirect(action: "list")
            return
        }

        try {
            fall2015VoucherInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'fall2015Voucher.label', default: 'Fall2015Voucher'), id])
            redirect(action: "show", id: id)
        }
    }

	def receiptPic(Long id) {
		def path = "${Holders.config.app.fall2015.file.upload.path}${id}"
		response.outputStream << new FileInputStream(new File(path))
	}
	
	def approve(Long id) {
		Fall2015Voucher voucher = Fall2015Voucher.get(id)
		if(voucher && voucher.reviewStatus == ReviewStatus.WAITING_REVIEW) {
			voucher.reviewStatus = ReviewStatus.APPROVED
			voucher.save(flush:true)

			def tm = new TemplateMessage()
			tm.toUser = voucher.owner.openId
			//XVXm9tgSTgYH9gaxJorhJLuIQ76VDbEhJTm0QBzpZdg  test template
			tm.templateId = "ziOZKYE0izDgdNtj-QG6U1bUqEM-FQ9tJjNibxvZA-c"
			tm.url = "http://${Holders.config.app.web.path}/fall2015"
			tm.addEntry("first","您参与抽奖的信息已经人工审核通过")
			tm.addEntry("keyword1", voucher.batch.name)
			tm.addEntry("keyword2", "小U")
			tm.addEntry("keyword3", new Date().format("yyyy-MM-dd HH:mm"))
			tm.addEntry("remark", "感谢你的参与")
			tm.send()
		}
		redirect(action:'show', id:id)
	}
	
	def reject(Long id) {
		Fall2015Voucher voucher = Fall2015Voucher.get(id)
		if(voucher && voucher.reviewStatus == ReviewStatus.WAITING_REVIEW) {
			voucher.reviewStatus = ReviewStatus.REJECTED
			voucher.save(flush:true)

			def tm = new TemplateMessage()
			tm.toUser = voucher.owner.openId
			//KwpiNls3bvnwYDhMGD-KcRoKvlmhuBXtoXiCdmuo6X4  test template
			tm.templateId = "-paJvBs2ySzRAi7ImhSD6iuR5RGNxHUJOdoRhqVtcV8"
			tm.url = "http://${Holders.config.app.web.path}/fall2015"
			tm.addEntry("first","你好，您提交的抽奖申请已审核完毕")
			tm.addEntry("keyword1", "未通过")
			tm.addEntry("keyword2", "充值小票等信息有误")
			tm.addEntry("keyword3", new Date().format("yyyy-MM-dd HH:mm"))
			tm.addEntry("remark", "请继续关注我们的后续活动")
			tm.send()
		}
		redirect(action:'show', id:id)
	}

	def changeAddress(Long id) {
		Fall2015Voucher voucher = Fall2015Voucher.get(id)
		if(voucher && voucher.reviewStatus == ReviewStatus.WAITING_REVIEW) {
			voucher.reviewStatus = ReviewStatus.WAITING_ADDRESS
			voucher.save(flush:true)

			def tm = new TemplateMessage()
			tm.toUser = voucher.owner.openId
			//KwpiNls3bvnwYDhMGD-KcRoKvlmhuBXtoXiCdmuo6X4  test template
			tm.templateId = "-paJvBs2ySzRAi7ImhSD6iuR5RGNxHUJOdoRhqVtcV8"
			tm.url = "http://${Holders.config.app.web.path}/fall2015"
			tm.addEntry("first","你好，您提交的抽奖申请已审核完毕")
			tm.addEntry("keyword1", "未通过")
			tm.addEntry("keyword2", "收件人信息不正确")
			tm.addEntry("keyword3", new Date().format("yyyy-MM-dd HH:mm"))
			tm.addEntry("remark", "请戳此处，修改收件人信息")
			tm.send()
		}
		redirect(action:'show', id:id)
	}

	def approvedList() {
		def vouchers = Fall2015Voucher.findAllByReviewStatus(ReviewStatus.APPROVED)
		[vouchers:vouchers]
	}
	
	def changeToDeliveied() {
		def voucherIds = params.list('voucherId')
		def vouchers = []
		voucherIds.each {voucherId->
			Fall2015Voucher voucher = Fall2015Voucher.get(voucherId)
			if(voucher.reviewStatus == ReviewStatus.APPROVED) {
				voucher.deliveriedAt = new Date()
				voucher.reviewStatus = ReviewStatus.DELIVERIED
				voucher.save(flush:true)
				vouchers.add(voucher)
			}
		}
		render(view:'address', model:[vouchers:vouchers])
	}
	
	def addressList() {
		def dateTo = params.date('dateTo', 'yyyy-MM-dd HH:mm')
		def dateFrom = params.date('dateFrom', 'yyyy-MM-dd HH:mm')
		def vouchers
		if(dateTo && dateFrom) 
			vouchers = Fall2015Voucher.findAllByReviewStatusAndDeliveriedAtBetween(ReviewStatus.DELIVERIED, dateFrom, dateTo)
		render(view:'address', model:[vouchers:vouchers])
	}
	
	def cardNo(String id) {
		def receipts = Fall2015Receipt.findAllByCardNo(id)
		[receipts:receipts, id:id]
	}
}
