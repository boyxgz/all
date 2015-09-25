package com.surelution.wxmp.jx

import java.text.SimpleDateFormat

import org.springframework.dao.DataIntegrityViolationException

import com.surelution.id.IDUtil;

class HorseGiftApplyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [horseGiftApplyInstanceList: HorseGiftApply.list(params), horseGiftApplyInstanceTotal: HorseGiftApply.count()]
    }

    def create() {
        [horseGiftApplyInstance: new HorseGiftApply(params)]
    }

    def save() {
        def horseGiftApplyInstance = new HorseGiftApply(params)
        if (!horseGiftApplyInstance.save(flush: true)) {
            render(view: "create", model: [horseGiftApplyInstance: horseGiftApplyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'horseGiftApply.label', default: 'HorseGiftApply'), horseGiftApplyInstance.id])
        redirect(action: "show", id: horseGiftApplyInstance.id)
    }

    def show(Long id) {
        def horseGiftApplyInstance = HorseGiftApply.get(id)
        if (!horseGiftApplyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horseGiftApply.label', default: 'HorseGiftApply'), id])
            redirect(action: "list")
            return
        }

        [horseGiftApplyInstance: horseGiftApplyInstance]
    }

    def edit(Long id) {
        def horseGiftApplyInstance = HorseGiftApply.get(id)
        if (!horseGiftApplyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horseGiftApply.label', default: 'HorseGiftApply'), id])
            redirect(action: "list")
            return
        }

        [horseGiftApplyInstance: horseGiftApplyInstance]
    }

    def update(Long id, Long version) {
        def horseGiftApplyInstance = HorseGiftApply.get(id)
        if (!horseGiftApplyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horseGiftApply.label', default: 'HorseGiftApply'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (horseGiftApplyInstance.version > version) {
                horseGiftApplyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'horseGiftApply.label', default: 'HorseGiftApply')] as Object[],
                          "Another user has updated this HorseGiftApply while you were editing")
                render(view: "edit", model: [horseGiftApplyInstance: horseGiftApplyInstance])
                return
            }
        }

        horseGiftApplyInstance.properties = params

        if (!horseGiftApplyInstance.save(flush: true)) {
            render(view: "edit", model: [horseGiftApplyInstance: horseGiftApplyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'horseGiftApply.label', default: 'HorseGiftApply'), horseGiftApplyInstance.id])
        redirect(action: "show", id: horseGiftApplyInstance.id)
    }

    def delete(Long id) {
        def horseGiftApplyInstance = HorseGiftApply.get(id)
        if (!horseGiftApplyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'horseGiftApply.label', default: 'HorseGiftApply'), id])
            redirect(action: "list")
            return
        }

        try {
            horseGiftApplyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'horseGiftApply.label', default: 'HorseGiftApply'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'horseGiftApply.label', default: 'HorseGiftApply'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def detail(String id) {
		def vc = VerifyCode.findByCode(id)
		if(vc) {
			def subscriberId = Long.parseLong(vc.content)
			def subscriber = Subscriber.get(subscriberId)
			def hg = HorseGiftApply.findBySubscriber(subscriber)
			if(hg.status == HorseGiftApply.ApplyStatus.NEW) {
				render(view:'selectGift', model:[verifyCode:vc.code, hg:hg])
				return
			} else if(hg.status == HorseGiftApply.ApplyStatus.DETAILED_INFO) {
				render(view:'infoReceived')
				return
			} else if(hg.status == HorseGiftApply.ApplyStatus.APPROVED) {
				render(view:'approved', model:[hg:hg])
				return
			} else if(hg.status == HorseGiftApply.ApplyStatus.REJECTED) {
				render(view:'pictureRejected', model:[hg:hg])
				return
			} else if(hg.status == HorseGiftApply.ApplyStatus.UNLUCKLY) {
				render(view:'unlucky.gsp', model:[hg:hg])
				return
			} else if(hg.status == HorseGiftApply.ApplyStatus.PAID) {
				render(view:'paid.gsp')
				return
			}
		}
		render(view:"error")
	}

	def showNewCard(String id) {
		def vc = VerifyCode.findByCode(id)
		if(vc) {
			def subscriberId = Long.parseLong(vc.content)
			def subscriber = Subscriber.get(subscriberId)
			def hga = HorseGiftApply.findBySubscriber(subscriber)
			def apply = hga.gasCardApply
			return [verifyCode:id, apply:apply]
		}
	}
	
	def showEditCard(String id) {
		def vc = VerifyCode.findByCode(id)
		if(vc) {
			def subscriberId = Long.parseLong(vc.content)
			def subscriber = Subscriber.get(subscriberId)
			def hg = HorseGiftApply.findBySubscriber(subscriber)
			
			def card = hg.gasCard
			return [verifyCode:id, card:card]
		}
		
	}
	
	def saveNewCard() {
		def code = params.verifyCode
		def vc = VerifyCode.findByCode(code)
		if(vc) {
			def subscriberId = Long.parseLong(vc.content)
			def subscriber = Subscriber.get(subscriberId)
			def hg = HorseGiftApply.findBySubscriber(subscriber)
			def apply = hg.gasCardApply
			if(!apply) {
				apply = new GasCardApply()
				apply.subscriber = subscriber
				hg.gasCardApply = apply
			}
			apply.holderName = params.holderName
			apply.holderSId = params.holderSId
			apply.createAt = new Date()
			apply.status = GasCardApply.Status.NEW
			apply.save(flush:true)
			
			hg.status = HorseGiftApply.ApplyStatus.DETAILED_INFO
			hg.giftType = HorseGiftApply.GiftType.APPLY_CARD
			hg.save(flush:true)
			render(view:'infoReceived')
		}
	}
	
	def saveEditCard() {
		def code = params.verifyCode
		def vc = VerifyCode.findByCode(code)
		if(vc) {
			def subscriberId = Long.parseLong(vc.content)
			def subscriber = Subscriber.get(subscriberId)
			def hg = HorseGiftApply.findBySubscriber(subscriber)
			if(hg.status == HorseGiftApply.ApplyStatus.NEW) {
				def card = new GasCard()
				card.subscriber = subscriber
				card.cardNo = params.cardNo
				card.holderName = params.holderName
				card.holderSId = params.holderSId
				card.save(flush:true)
				
				hg.status = HorseGiftApply.ApplyStatus.DETAILED_INFO
				hg.giftType = HorseGiftApply.GiftType.OLD_CARD
				hg.gasCard = card
				hg.save(flush:true)
			}
			render(view:'infoReceived')
		}
		
	}
	
	def passed(Long id) {
		println "id:${id},passed"
		def horseGiftApplyInstance = HorseGiftApply.get(id)
		if (!horseGiftApplyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'horseGiftApply.label', default: 'HorseGiftApply'), id])
			redirect(action: "list")
			return
		}

		horseGiftApplyInstance.status = 'APPROVED'
		def verifyCode = IDUtil.getRefusedId(id.toInteger(), 5, HorseGiftApply.REFUSED_ID_SEEDS)
		horseGiftApplyInstance.verifyCode = verifyCode
		horseGiftApplyInstance.save(flush: true)
		render(view: "close")
	}
	
	/**
	 * 图片通过，但是卡号等信息不对
	 * @param id
	 * @return
	 */
	def passPic(Long id) {
		println "id:${id},passPic"
		def horseGiftApplyInstance = HorseGiftApply.get(id)
		if (!horseGiftApplyInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'horseGiftApply.label', default: 'HorseGiftApply'), id])
			redirect(action: "list")
			return
		}
		horseGiftApplyInstance.status = 'NEW'
		horseGiftApplyInstance.properties = params
		horseGiftApplyInstance.giftType = HorseGiftApply.GiftType.NOT_SET
		def gasCardApply = horseGiftApplyInstance.gasCardApply
		def gasCard = horseGiftApplyInstance.gasCard
		if(gasCardApply) {
			horseGiftApplyInstance.gasCardApply = null
			gasCardApply.delete()
		}
		if(gasCard) {
			horseGiftApplyInstance.gasCard = null
			gasCard.delete()
		}
		horseGiftApplyInstance.save(flush: true)
		render(view: "close")
	}
	
	def showReject(Long id) {
		def horseGiftApplyInstance = HorseGiftApply.get(id)
		[horseGiftApplyInstance:horseGiftApplyInstance]
	}
	
	def showRejectPart(Long id) {
		def horseGiftApplyInstance = HorseGiftApply.get(id)
		[horseGiftApplyInstance:horseGiftApplyInstance]
	}

	def showUnlucky(Long id) {
		def horseGiftApplyInstance = HorseGiftApply.get(id)
		[horseGiftApplyInstance:horseGiftApplyInstance]
	}
	/**
	 * 图无效
	 * @param id
	 * @return
	 */
	def rejected(Long id) {
		def horseGiftApplyInstance = HorseGiftApply.get(id)
		horseGiftApplyInstance.status = HorseGiftApply.ApplyStatus.REJECTED
		horseGiftApplyInstance.properties = params
		horseGiftApplyInstance.save(flush: true)
		render(view: "close")
	}
	
	def unlucky(Long id) {
		def horseGiftApplyInstance = HorseGiftApply.get(id)
		horseGiftApplyInstance.status = HorseGiftApply.ApplyStatus.UNLUCKLY
		horseGiftApplyInstance.properties = params
		horseGiftApplyInstance.save(flush: true)
		render(view: "close")
	}
	
	def search() {
		def status
		if(params.status) {
			status = HorseGiftApply.ApplyStatus.valueOf(params.status)
		}
		def result = HorseGiftApply.createCriteria().list([max:(params.max), offset:params.offset]){
			if(status) {
				eq("status",status)
			}
		}
		render(view: "list", model:[horseGiftApplyInstanceList: result, horseGiftApplyInstanceTotal: result.count])
	}
	
	def showPay() {
		def verifyCode = params.verifyCode
		def apply
		if(verifyCode) {
			apply = HorseGiftApply.findByVerifyCode(verifyCode)
		}
		if(verifyCode && !apply) {
			flash.message = "没有找到 ${verifyCode} 的兑奖码"
		}
		[apply:apply]
	}
	
	def savePay() {
		def user = springSecurityService.currentUser
		def applyId = params.id
		if(applyId) {
			HorseGiftApply apply = HorseGiftApply.get(applyId)
			if(apply.giftType == HorseGiftApply.GiftType.APPLY_CARD) {
				def gasCard = new GasCard()
				gasCard.subscriber = apply.subscriber
				gasCard.cardNo = params.cardNo
				gasCard.holderName = apply.gasCardApply.holderName
				gasCard.holderSId = apply.gasCardApply.holderSId
				gasCard.save(flush:true)
			}
			apply.status = HorseGiftApply.ApplyStatus.PAID
			apply.payer = user
			apply.save(flush:true)
			flash.message = "兑付成功"
			redirect(action:'showPay')
			return
		}
		render("系统错误，请联系管理员")
	}
}
