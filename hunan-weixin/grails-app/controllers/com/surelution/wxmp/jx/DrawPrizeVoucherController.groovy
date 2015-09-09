package com.surelution.wxmp.jx

import java.text.SimpleDateFormat

import org.springframework.dao.DataIntegrityViolationException

import com.surelution.wxmp.jx.Voucher.VoucherStatus;

class DrawPrizeVoucherController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def listInvitingTop(Integer max) {
		def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
		def dateFrom
		def dateTo
		
		try{
			if(params.paiedAtFrom) {
				dateFrom = sdf.parse(params.paiedAtFrom)
			}
			if(params.paiedAtTo) {
				dateTo = sdf.parse(params.paiedAtTo)
			}
		}catch(Exception e) {
			e.printStackTrace()
		}
		
		def offset = params.offset
		if(!offset) {
			offset = 0
		}
		def maxNo = params.max
		if(!maxNo) {
			maxNo = 10
		}
		def l = PresentVoucher.createCriteria().list(max: maxNo, offset: offset) {
			if(dateFrom) {
				ge('paiedAt', dateFrom)
			}
			if(dateTo) {
				le('paiedAt', dateTo)
			}
			if(params.whoPaied) {
				createAlias('whoPaied', 'u')
				eq('u.username', params.whoPaied)
			}
			if(params.fullSn) {
				eq('fullSn', params.fullSn)
			}
			if(params['batch.id']) {
				def batch = VoucherBatch.get(params.int('batch.id'))
				if(batch) {
					eq('batch', batch)
				}
			}
			if(params.status) {
				def status = VoucherStatus.valueOf(params.status)
				if(status) {
					params.status = status
					eq('status', status)
				}
			}
		}
        [drawPrizeVoucherInstanceList: l, drawPrizeVoucherInstanceTotal: l.totalCount]
    }

    def list(Integer max) {
		def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
		def dateFrom
		def dateTo
		
		try{
			if(params.paiedAtFrom) {
				dateFrom = sdf.parse(params.paiedAtFrom)
			}
			if(params.paiedAtTo) {
				dateTo = sdf.parse(params.paiedAtTo)
			}
		}catch(Exception e) {
			e.printStackTrace()
		}
		
		def offset = params.offset
		if(!offset) {
			offset = 0
		}
		def maxNo = params.max
		if(!maxNo) {
			maxNo = 10
		}
		def l = DrawPrizeVoucher.createCriteria().list(max: maxNo, offset: offset) {
			if(dateFrom) {
				ge('paiedAt', dateFrom)
			}
			if(dateTo) {
				le('paiedAt', dateTo)
			}
			if(params.whoPaied) {
				createAlias('whoPaied', 'u')
				eq('u.username', params.whoPaied)
			}
			if(params.fullSn) {
				eq('fullSn', params.fullSn)
			}
			if(params['batch.id']) {
				def batch = VoucherBatch.get(params.int('batch.id'))
				if(batch) {
					eq('batch', batch)
				}
			}
			if(params.status) {
				def status = VoucherStatus.valueOf(params.status)
				if(status) {
					params.status = status
					eq('status', status)
				}
			}
//			VoucherStatus.
			
//			firstResult(offset)
//			maxResults(maxNo)
		}
        [drawPrizeVoucherInstanceList: l, drawPrizeVoucherInstanceTotal: l.totalCount]
    }

    def create() {
        [drawPrizeVoucherInstance: new DrawPrizeVoucher(params)]
    }

//    def save() {
//        def drawPrizeVoucherInstance = new DrawPrizeVoucher(params)
//        if (!drawPrizeVoucherInstance.save(flush: true)) {
//            render(view: "create", model: [drawPrizeVoucherInstance: drawPrizeVoucherInstance])
//            return
//        }
//
//        flash.message = message(code: 'default.created.message', args: [message(code: 'drawPrizeVoucher.label', default: 'DrawPrizeVoucher'), drawPrizeVoucherInstance.id])
//        redirect(action: "show", id: drawPrizeVoucherInstance.id)
//    }

    def show(Long id) {
        def drawPrizeVoucherInstance = DrawPrizeVoucher.get(id)
        if (!drawPrizeVoucherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drawPrizeVoucher.label', default: 'DrawPrizeVoucher'), id])
            redirect(action: "list")
            return
        }

        [drawPrizeVoucherInstance: drawPrizeVoucherInstance]
    }

    def edit(Long id) {
        def drawPrizeVoucherInstance = DrawPrizeVoucher.get(id)
        if (!drawPrizeVoucherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drawPrizeVoucher.label', default: 'DrawPrizeVoucher'), id])
            redirect(action: "list")
            return
        }

        [drawPrizeVoucherInstance: drawPrizeVoucherInstance]
    }

//    def update(Long id, Long version) {
//        def drawPrizeVoucherInstance = DrawPrizeVoucher.get(id)
//        if (!drawPrizeVoucherInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drawPrizeVoucher.label', default: 'DrawPrizeVoucher'), id])
//            redirect(action: "list")
//            return
//        }
//
//        if (version != null) {
//            if (drawPrizeVoucherInstance.version > version) {
//                drawPrizeVoucherInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
//                          [message(code: 'drawPrizeVoucher.label', default: 'DrawPrizeVoucher')] as Object[],
//                          "Another user has updated this DrawPrizeVoucher while you were editing")
//                render(view: "edit", model: [drawPrizeVoucherInstance: drawPrizeVoucherInstance])
//                return
//            }
//        }
//
//        drawPrizeVoucherInstance.properties = params
//
//        if (!drawPrizeVoucherInstance.save(flush: true)) {
//            render(view: "edit", model: [drawPrizeVoucherInstance: drawPrizeVoucherInstance])
//            return
//        }
//
//        flash.message = message(code: 'default.updated.message', args: [message(code: 'drawPrizeVoucher.label', default: 'DrawPrizeVoucher'), drawPrizeVoucherInstance.id])
//        redirect(action: "show", id: drawPrizeVoucherInstance.id)
//    }

    def delete(Long id) {
        def drawPrizeVoucherInstance = DrawPrizeVoucher.get(id)
        if (!drawPrizeVoucherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drawPrizeVoucher.label', default: 'DrawPrizeVoucher'), id])
            redirect(action: "list")
            return
        }

        try {
            drawPrizeVoucherInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'drawPrizeVoucher.label', default: 'DrawPrizeVoucher'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'drawPrizeVoucher.label', default: 'DrawPrizeVoucher'), id])
            redirect(action: "show", id: id)
        }
    }
}
