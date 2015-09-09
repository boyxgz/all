package com.surelution.wxmp.jx

import grails.util.Holders

import com.surelution.whistle.core.Auth2Util
import com.surelution.whistle.core.Auth2Util.AuthScope
import com.surelution.wxmp.jx.Fall2015Receipt.CardType
import com.surelution.wxmp.jx.Fall2015Voucher.ReviewStatus;
import com.surelution.wxmp.jx.util.CountersException

class Fall2015Controller {

	def fall2015Service

	private Subscriber subscriber

	/**
	 * 自动登录
	 */
	def beforeInterceptor = {
		def userSn = request.getCookie('user-sn')
		subscriber = SubscriberCookie.findBySubscriberSn(userSn)?.subscriber

		if(!subscriber) {
			def requestUrl = request.forwardURI
			def baseUrl = Holders.config.app.web.path
			def url = Auth2Util.buildRedirectUrl("http://${baseUrl}/subscriberPortal/autoLogin", requestUrl, AuthScope.BASE)
			response.deleteCookie('user-sn')
			redirect(url:url)
			return false
		}
		return true
	}

	def index() {
		def ticket = Fall2015DrawPrizeTicket.findBySubscriber(subscriber)
		if(!ticket) {
			//尚未填写正确的加油卡充值信息，前往填写充值信息
			redirect(action:'showForm')
			return
		} else if(!ticket.drawAt){
			render(view:'showDraw', model:[ticket:ticket])
			return
		} else {
			Fall2015Voucher voucher = Fall2015Voucher.findByTicket(ticket)
			if(!voucher) {//未中奖
				flash.message = KeyedMessage.findByKey("fall2015-message-loss")?.message
			} else { //中奖
				if(voucher.reviewStatus == ReviewStatus.REJECTED) { //充值单信息错误，没有机会
					flash.message = KeyedMessage.findByKey("fall2015-message-rejected")?.message
				} else if(voucher.reviewStatus == ReviewStatus.WAITING_REVIEW) {//等待人工审核
					flash.message = KeyedMessage.findByKey("fall2015-message-waiting-review")?.message
					redirect(action:'editDelivery')
					return
				} else if(voucher.reviewStatus == ReviewStatus.WAITING_ADDRESS) { //等待输入地址，或地址被驳回
					redirect(action:'editDelivery')
					return
				} else if(voucher.reviewStatus == ReviewStatus.APPROVED) { //审核通过，等待发货
					flash.message = KeyedMessage.findByKey("fall2015-message-approved")?.message
				} else if(voucher.reviewStatus == ReviewStatus.DELIVERIED) {//已发货
					flash.message = KeyedMessage.findByKey("fall2015-message-deliveried")?.message
				}
			}
		}
	}

    def chose() {
		
	}
	
	def showForm() {
//		def cardType = CardType.valueOf(id)
//		[cardType:cardType]
	}
	
	def saveForm() {
//		def transNo = params.transNo
		def cardType
		def cardNo = params.cardNo
		def amount = params.float('amount')
		def reciptFile = request.getFile('reciptFile')
		boolean succeed = false
		boolean validCardNo = (cardNo ==~ '90\\d{14}$')
		if(validCardNo && amount > 0 && reciptFile && !reciptFile.empty) {
//			if(cardNo.startsWith("90")) {
//				cardType = CardType.PERSONAL
//			} else {
//				cardType = CardType.ENTERPRISE
//			}
			cardType = CardType.PERSONAL
			def rule = Fall2015PrizeRule.createCriteria().get() {
				eq('cardType', cardType)
				le('from', amount.intValue())
				gt('to', amount.intValue())
			}
			if(rule) {
				try{
					def c = Counters.getNextValue("fall2015-draw-${rule.id}")
					
					def receipt = new Fall2015Receipt()
					receipt.rule = rule
					receipt.subscriber = subscriber
//					receipt.transNo = transNo
					receipt.cardNo = cardNo
					receipt.amount = amount
					receipt.cardType = cardType
					receipt.receiptIndex = c
					receipt.save(flush:true)
					if(!receipt.hasErrors()) {
						succeed = true

						def dest = new File("${Holders.config.app.fall2015.file.upload.path}${receipt.id}")
						reciptFile.transferTo(dest)

						def ticket = new Fall2015DrawPrizeTicket()
						ticket.freceipt = receipt
						ticket.subscriber = subscriber
						ticket.save(flush:true)

						render(view:'showDraw', model: [ticket:ticket])
						return
					} else {
						flash.message = "系统忙，请稍后再试"
					}
				} catch(CountersException e) {
					flash.message = "系统忙，请稍后再试"
				}
			} else {
				flash.message = "根据活动规则，您的充值金额不能参与本次抽奖"
			}
		} else {
			if(!validCardNo) {
				flash.message = "加油卡号错误，请仔细核对小票内容，并如实填写！"
			}
			if(amount <= 0) {
				flash.message = "充值金额错误，请仔细核对小票内容，并如实填写！"
			}
			if(!reciptFile || reciptFile.empty) {
				flash.message = "请上传小票照片"
			}
		}
		redirect(action:'showForm', id:params.cardType)
	}

	def draw(Long id) {
		Fall2015DrawPrizeTicket ticket = Fall2015DrawPrizeTicket.get(id)
		Fall2015Voucher voucher
		if(ticket && !ticket.drawAt && ticket.subscriber?.id == subscriber.id) {
			voucher = fall2015Service.draw(ticket)
		}
		if(voucher) {
			render(view:'win', model:[voucher:voucher])
		} else {
			render(view:'loss')
		}
		
	}

	def editDelivery() {
		def address = SubscriberAddress.findBySubscriber(subscriber)
		[address:address]
	}
	
	def saveDelivery() {
		def branch = Branch.get(params.branch)
		def address = params.address
		def linkMan = params.linkMan
		def tel = params.tel
		
		def ticket = Fall2015DrawPrizeTicket.findBySubscriber(subscriber)
		if(ticket) {
			def voucher = Fall2015Voucher.findByTicket(ticket)
			if(voucher.reviewStatus == ReviewStatus.WAITING_ADDRESS
				|| voucher.reviewStatus == ReviewStatus.WAITING_REVIEW) {
				if(branch && address && linkMan && tel) {
					def sa = SubscriberAddress.findOrCreateBySubscriber(subscriber)
					sa.subscriber = subscriber
					sa.branch = branch
					sa.address = address
					sa.linkMan = linkMan
					sa.tel = tel
					sa.save(flush:true)

					if(voucher.reviewStatus == ReviewStatus.WAITING_ADDRESS) {
						voucher.reviewStatus = ReviewStatus.WAITING_REVIEW
						voucher.save(flush:true)
					}
				}
			}
		}
		redirect(action:'index')
	}
}
