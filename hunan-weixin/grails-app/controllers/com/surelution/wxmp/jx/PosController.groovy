package com.surelution.wxmp.jx

import grails.plugin.springsecurity.SpringSecurityUtils

import com.surelution.wxmp.jx.Voucher.VoucherStatus

class PosController {

	def springSecurityService
	def mobilePassportService
	def voucherPaymentService

	def index() {
//		if(System.currentTimeMillis()  > 1419350400000) {
//			flash.message = "已过兑奖期限，不予兑奖"
//			return
//		}
		def payCode = params.sn
		if(payCode) {
			def voucher = Voucher.findByFullSnAndEnabledAndStatusAndAvailableEndAtGreaterThanEquals(payCode, true, VoucherStatus.ACTIVED, new Date())
			if(voucher) {
				//ROLE_BRANCH
				//ROLE_STATION
				if(SpringSecurityUtils.ifAllGranted("ROLE_BRANCH")) {
					if(voucher instanceof RegisterVoucher) {
						flash.message = "分公司机关不能兑关注奖"
						return
					}
					render(view:'showBranch', model:[voucher:voucher])
					return
				} else if(SpringSecurityUtils.ifAllGranted("ROLE_STATION")) {
					if(voucher.amount >= 500) {
						flash.message = "加油站不能兑付超过500的礼品，请前往分公司兑付"
						return
					}
					render(view:'showStation', model:[voucher:voucher])
					return
					
				}
//				render(view:'show', model:[voucher:voucher])
//				return
			}
			flash.message = "没有找到这个奖券，请确认奖券的是否正确、奖券没有激活、奖券是否已兑奖、奖券是否已过期"	
		}
	}

	def saveBranchPayment() {
		boolean illegal = false
		if(!SpringSecurityUtils.ifAllGranted("ROLE_BRANCH")) {//error
			illegal = true
		}
		def fullSn = params.fullSn
		def voucher = Voucher.findByFullSnAndEnabledAndStatus(fullSn, true, VoucherStatus.ACTIVED)
		
		illegal = voucher == null

		if(illegal) {
			flash.message = "系统出错，请联系管理员"
			redirect(action:'index')
			return
		}

		def payment
		if(voucher) {
			voucher
			def customerSid = params.customerSid
			def rechargeTo = params.rechargeTo
			def rechargeAmount = params.int('rechargeAmount')
			if(!customerSid || !rechargeTo || !rechargeAmount) {
				flash.message = "请填入完整的核销信息"
				redirect(action:'index')
				return
			}
			voucher.whoPaied = springSecurityService.currentUser
			payment = new BranchVoucherPayment()
			payment.paiedBy = springSecurityService.currentUser
			payment.customerSid = customerSid
			payment.rechargeTo = rechargeTo
			payment.rechargeAmount = rechargeAmount
			voucherPaymentService.payment(voucher, payment)
		}
		flash.message = "奖券核销成功"
		[voucher:voucher, payment:payment]
	}

	def saveStationPayment() {
		boolean illegal = false
		if(!SpringSecurityUtils.ifAllGranted("ROLE_STATION")) {//error
			illegal = true
		}
		def fullSn = params.fullSn
		def voucher = Voucher.findByFullSnAndEnabledAndStatus(fullSn, true, VoucherStatus.ACTIVED)
		
		illegal = voucher == null

		if(illegal) {
			flash.message = "系统出错，请联系管理员"
			redirect(action:'index')
			return
		}

		def payment
		if(voucher) {
			def amountByVoucher = params.float('amountByVoucher')
			def totalAmount = params.float('totalAmount')
				println amountByVoucher
				println totalAmount
			if(!amountByVoucher || !totalAmount) {
				flash.message = "请填入完整的核销信息"
				redirect(action:'index')
				return
			}
			voucher.whoPaied = springSecurityService.currentUser
			payment = new GasStationVoucherPayment()
			payment.paiedBy = springSecurityService.currentUser
			
			payment.channel = VoucherPaymentChannel.get(params['channel.id'])
			payment.amountByVoucher = params.float('amountByVoucher')
			payment.totalAmount = params.float('totalAmount')
			voucherPaymentService.payment(voucher, payment)
		}
		flash.message = "奖券核销成功"
		[voucher:voucher, payment:payment]
	}

	def print(String id) {
		def user = springSecurityService.currentUser
		def voucher = Voucher.findByFullSn(id)
		if(voucher.status == VoucherStatus.ACTIVED) {
			voucher.status = VoucherStatus.PAID
			voucher.paiedAt = new Date()
			voucher.whoPaied = user
			voucher.save(flush:true)
			return [voucher:voucher]
		} else {
			flash.message = "奖券只能打印一次"
		}
		redirect(action:"index")
	}

}
