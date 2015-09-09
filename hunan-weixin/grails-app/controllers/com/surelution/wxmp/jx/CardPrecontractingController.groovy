package com.surelution.wxmp.jx

import java.text.SimpleDateFormat

import org.springframework.dao.DataIntegrityViolationException

import com.surelution.wxmp.jx.CardPrecontracting.CardPrecontractingStatus;

class CardPrecontractingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cardPrecontractingInstanceList: CardPrecontracting.list(params), cardPrecontractingInstanceTotal: CardPrecontracting.count()]
    }

	def queryCondtion(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		if(!params.offset) params.offset = 0
		

		def stationOfFetchId = params['stationOfFetchId']
		def sdf = new SimpleDateFormat('yyyy-MM-dd') 
	
		
		def beginDate  = null
		def endDate  = null
		
		if(params.beginDate_year && params.beginDate_month && params.beginDate_day) {
			beginDate = params.beginDate_year +"-" + params.beginDate_month +"-"+params.beginDate_day
			params.beginDate = sdf.parse(beginDate);
			
		}
		
		if(params.endDate_year && params.endDate_month && params.endDate_day) {
			endDate = params.endDate_year +"-" + params.endDate_month +"-"+params.endDate_day
			params.endDate = sdf.parse(endDate);
		}
		
		def searchClosure = {
			   if(stationOfFetchId) {
				stationOfFetch {
					eq("id",Long.parseLong(stationOfFetchId))
					
				}
			   }
				
				if(beginDate) {
					and {
						ge("precontractingDate",params.beginDate)
					}
					
					 
				}
				if(endDate) {
					and {
					 le("precontractingDate",params.endDate)
					}
				}
		}
		def c = CardPrecontracting.createCriteria();
		def result = c.list (params, searchClosure)
		def resultCount = result.totalCount
		[cardPrecontractingInstanceList: result, cardPrecontractingInstanceTotal: resultCount]
	}
	
	

	def updateStatus(Long id,String status) {
		def cardPrecontracting = null
		if(id && status) {
			 cardPrecontracting  = CardPrecontracting.get(id)
			 cardPrecontracting?.status = status
			 render  ""+status
		} 
		render ""
	}
    def create() {
        [cardPrecontractingInstance: new CardPrecontracting(params)]
    }

    def save() {
        def cardPrecontractingInstance = new CardPrecontracting(params)
        if (!cardPrecontractingInstance.save(flush: true)) {
            render(view: "create", model: [cardPrecontractingInstance: cardPrecontractingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cardPrecontracting.label', default: 'CardPrecontracting'), cardPrecontractingInstance.id])
        redirect(action: "show", id: cardPrecontractingInstance.id)
    }

    def show(Long id) {
        def cardPrecontractingInstance = CardPrecontracting.get(id)
        if (!cardPrecontractingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cardPrecontracting.label', default: 'CardPrecontracting'), id])
            redirect(action: "list")
            return
        }

        [cardPrecontractingInstance: cardPrecontractingInstance]
    }

    def edit(Long id) {
        def cardPrecontractingInstance = CardPrecontracting.get(id)
        if (!cardPrecontractingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cardPrecontracting.label', default: 'CardPrecontracting'), id])
            redirect(action: "list")
            return
        }

        [cardPrecontractingInstance: cardPrecontractingInstance]
    }

    def update(Long id, Long version) {
        def cardPrecontractingInstance = CardPrecontracting.get(id)
        if (!cardPrecontractingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cardPrecontracting.label', default: 'CardPrecontracting'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cardPrecontractingInstance.version > version) {
                cardPrecontractingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cardPrecontracting.label', default: 'CardPrecontracting')] as Object[],
                          "Another user has updated this CardPrecontracting while you were editing")
                render(view: "edit", model: [cardPrecontractingInstance: cardPrecontractingInstance])
                return
            }
        }

        cardPrecontractingInstance.properties = params

        if (!cardPrecontractingInstance.save(flush: true)) {
            render(view: "edit", model: [cardPrecontractingInstance: cardPrecontractingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cardPrecontracting.label', default: 'CardPrecontracting'), cardPrecontractingInstance.id])
        redirect(action: "show", id: cardPrecontractingInstance.id)
    }

    def delete(Long id) {
        def cardPrecontractingInstance = CardPrecontracting.get(id)
        if (!cardPrecontractingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cardPrecontracting.label', default: 'CardPrecontracting'), id])
            redirect(action: "list")
            return
        }

        try {
            cardPrecontractingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cardPrecontracting.label', default: 'CardPrecontracting'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cardPrecontracting.label', default: 'CardPrecontracting'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def showOrder(String id) {
		def vc = VerifyCode.findByCode(id)
		if(vc) {
			if(vc.expireAt > new Date()) {
				return [verifycode:id]
			}
		}
		render(view:"noSuchCode")
	}
	
	def mobileSave() {
		def vc = VerifyCode.findByCode(params.id)
		if(vc) {
			if(vc.expireAt > new Date()) {
				def subscriber = Subscriber.get(vc.content)
				def dateOfFetch = params.dateOfFetch
				def sdf = new SimpleDateFormat("yyyy-MM-dd")
				def stationOfFetchId = params['stationOfFetch.id']
				def remark = params.remark
				def cp = new CardPrecontracting()
				cp.subscriber = subscriber
				cp.dateOfFetch = sdf.parse(dateOfFetch)
				cp.stationOfFetch = GasStation.get(stationOfFetchId)
				cp.remark = remark
				cp.precontractingDate = new Date()
				cp.contactTel = params.contactTel
				cp.holderName = params.holderName
				cp.holderSId = params.holderSId
				cp.status = CardPrecontractingStatus.INIT
				cp.save(flush:true)
				flash.message = "预约成功，请前往${cp.stationOfFetch.name}领取"
				println cp.errors
				render(view:'showOrder',model: [cardPrecontractingInstance:cp])
				return
			}
		}
		render(view:"noSuchCode")
	}
}
