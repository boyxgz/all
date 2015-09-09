package com.surelution.wxmp.jx

import java.text.SimpleDateFormat

import com.surelution.wxmp.jx.Voucher.VoucherStatus
import com.surelution.wxmp.jx.vo.ComplexDate
import com.surelution.wxmp.jx.vo.Spring2015ReportVo

class SpringFestival2015ReportsController {

    def dashboard() {
		def from = new SimpleDateFormat("yyyy-MM-dd").parse("2015-02-10")
		def ts = ComplexDate.generate(from, new Date())
		def vos = []
		ts.each {t->
			Spring2015ReportVo vo = new Spring2015ReportVo()
			vos.add([t,vo])
			def s = Subscribing.createCriteria().get() {
				projections {
					count('id')
				}
//				between('subscribingAt', t.label, t.firstSightNextDay)
				ge('subscribingAt', t.label)
				lt('subscribingAt', t.firstSightNextDay)
			}
			vo.scanSubscribing = s
			vo.invitSubscribing = DealInvitation.countByDateCreatedBetween(t.label, t.firstSightNextDay)
			def payments = VoucherPayment.findAllByDateCreatedBetween(t.label, t.firstSightNextDay)
			payments.each {p->
//				if(!(p instanceof SelfhelpVoucherPayment)) {
					if(p.voucher.amount == 2) {
						if(!(p instanceof SelfhelpVoucherPayment)) {
							vo.payment2 = vo.payment2 + 2
						}
					} else if(p.voucher.batch.id == 4){
						vo.payment6 = vo.payment6 + 6
					} else if(p.voucher.batch.id == 3){
						vo.payment66 = vo.payment66 + 66
					} else if(p.voucher.batch.id == 2){
						vo.payment168 = vo.payment168 + 168
					} else if(p.voucher.batch.id == 1){
						vo.payment1688 = vo.payment1688 + 1688
					} else if(p.voucher.batch.id == 5){
						vo.paymento1999 = vo.paymento1999 + 1999
					} else if(p.voucher.batch.id == 6){
						vo.paymento888 = vo.paymento888 + 888
					} else if(p.voucher.batch.id == 7){
						vo.paymento666 = vo.paymento666 + 666
					} else if(p.voucher.batch.id == 8){
						vo.paymento66 = vo.paymento66 + 66
					} else if(p.voucher.batch.id == 9){
						vo.paymento6 = vo.paymento6 + 6
					}
					
					
					else if(p.voucher.batch.id == 10){
						vo.paymentTop1999 = vo.paymentTop1999 + 1999
					} else if(p.voucher.batch.id == 11){
						vo.paymentTop666 = vo.paymentTop666 + 666
					} else if(p.voucher.batch.id == 12){
						vo.paymentTop200 = vo.paymentTop200 + 200
					} else if(p.voucher.batch.id == 13){
						vo.paymentTop66 = vo.paymentTop66 + 66
					}
//				}
			}
			
//			 DrawPrizeTicket.findAllByDateCreatedBetween(t.label, t.firstSightNextDay).each {ticket->
//				if(ticket instanceof SubscriberCardDrawPrizeTicket) {
//					vo.drawWithCard += 1
//				} else if(ticket instanceof SubscriberInvoiceDrawPrizeTicket) {
//					vo.drawWithInvioce += 1
//				} else if(ticket instanceof SubscriberReceiptDrawPrizeTicket) {
//					vo.drawWithReceipt += 1
//				} else if(ticket instanceof SubscriberInvitationDrawPrizeTicket) {
//					vo.drawWithInviting += 1
//				} else if(ticket instanceof SubscriberRegisterVoucherDrawPrizeTicket) {
//					vo.drawWithVoucher += 1
//				}
//				
//			}
			
			 SubscriberCardDrawPrizeTicket.findAllByDateCreatedBetween(t.label, t.firstSightNextDay).each {ticket->
				vo.drawWithCard += 1
			}
			
			 SubscriberInvoiceDrawPrizeTicket.findAllByDateCreatedBetween(t.label, t.firstSightNextDay).each {ticket->
				vo.drawWithInvioce += 1
			}
			 
			  SubscriberReceiptDrawPrizeTicket.findAllByDateCreatedBetween(t.label, t.firstSightNextDay).each {ticket->
				 vo.drawWithReceipt += 1
			 }
			  
			  SubscriberInvitationDrawPrizeTicket.findAllByDateCreatedBetween(t.label, t.firstSightNextDay).each {ticket->
				 vo.drawWithInviting += 1
			 }
			
			 SubscriberRegisterVoucherDrawPrizeTicket.findAllByDateCreatedBetween(t.label, t.firstSightNextDay).each {ticket->
				vo.drawWithVoucher += 1
			}
		}
		[vos:vos]
	}
	
	def dashboardByBranch() {
		def vos = []
		def branchScan = [:]
		def branchPayment = [:]
		def branchPayment2 = [:]
		
		def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
		def from, to
		if(params.dateFrom) {
			from = sdf.parse(params.dateFrom)
		}
		if(!from) {
			from = sdf.parse("2015-02-10 00:00")
		}
		if(params.dateTo) {
			to = sdf.parse(params.dateTo)
		}
		if(!to) {
			to = new Date()
		}
		
		//cache the data
		def us = User.list()
		def gs = GasStation.list()
		def ds = District.list()
		def branches = Branch.list()
		
		Subscribing.createCriteria().list() {
			projections {
				count()
			}
			groupProperty('comeFrom')
			between('subscribingAt', from, to)
		}.each {
			def comeFrom = it[1] as Long
			println comeFrom
			def station = GasStation.get(comeFrom)
			def branch = station?.district?.branch
			if(branch) {
				def c = branchScan.get(branch.id)
				if(!c) {
					c = 0
				}
				c += it[0]
				branchScan.put(branch.id, c)
			}
		}
		
		def vs = Voucher.list()
//		Subscribing.findAllBySubscribingAtBetween(from, to).each{s->
//			def comeFrom = s.comeFrom as Long
//			println comeFrom
//			def station = GasStation.get(comeFrom)
//			def branch = station?.district?.branch
//			if(branch) {
//				def c = branchScan.get(branch.id)
//				if(!c) {
//					c = 0
//				}
//				c += 1
//				branchScan.put(branch.id, c)
//			}
//		}

		GasStationVoucherPayment.findAllByDateCreatedBetween(from, to).each {v->
			def user = v.paiedBy
			def branch = user?.gasStation?.district?.branch
			if(branch && branch.id) {
				def payments = branchPayment.get(branch.id)
				if(!payments) {
					payments = []
					branchPayment.put(branch.id, payments)
				}
				payments.add(v)
			}
		}
		
		BranchVoucherPayment.findAllByDateCreatedBetween(from, to).each {v->
			def user = v.paiedBy
			def branch = user?.branch
			if(branch && branch.id) {
				def payments = branchPayment2.get(branch.id)
				if(!payments) {
					payments = []
					branchPayment2.put(branch.id, payments)
				}
				payments.add(v)
			}
		}
		
		branches.each {b->
			Spring2015ReportVo vo = new Spring2015ReportVo()
			vos.add([b,vo])
			
			vo.scanSubscribing = branchScan.get(b.id)
			def payments = branchPayment.get(b.id)
			payments.each {p->
//				if(!(p instanceof SelfhelpVoucherPayment)) {
//					if(p.voucher.amount == 2) {
//						vo.payment2 = vo.payment2 + 2
//					} else if(p.voucher.amount == 6){
//						vo.payment6 = vo.payment6 + 6
//					} else if(p.voucher.amount == 66){
//						vo.payment66 = vo.payment66 + 66
//					} else if(p.voucher.amount == 168){
//						vo.payment168 = vo.payment168 + 168
//					} else if(p.voucher.amount == 1688){
//						vo.payment1688 = vo.payment1688 + 1688
//					}
					
					
					
					if(p.voucher.amount == 2) {
						if(!(p instanceof SelfhelpVoucherPayment)) {
							vo.payment2 = vo.payment2 + 2
						}
					} else if(p.voucher.batch.id == 4){
						vo.payment6 = vo.payment6 + 6
					} else if(p.voucher.batch.id == 3){
						vo.payment66 = vo.payment66 + 66
					} else if(p.voucher.batch.id == 2){
						vo.payment168 = vo.payment168 + 168
					} else if(p.voucher.batch.id == 1){
						vo.payment1688 = vo.payment1688 + 1688
					} else if(p.voucher.batch.id == 5){
						vo.paymento1999 = vo.paymento1999 + 1999
					} else if(p.voucher.batch.id == 6){
						vo.paymento888 = vo.paymento888 + 888
					} else if(p.voucher.batch.id == 7){
						vo.paymento666 = vo.paymento666 + 666
					} else if(p.voucher.batch.id == 8){
						vo.paymento66 = vo.paymento66 + 66
					} else if(p.voucher.batch.id == 9){
						vo.paymento6 = vo.paymento6 + 6
					} else if(p.voucher.batch.id == 10){
						vo.paymentTop1999 = vo.paymentTop1999 + 1999
					} else if(p.voucher.batch.id == 11){
						vo.paymentTop666 = vo.paymentTop666 + 666
					} else if(p.voucher.batch.id == 12){
						vo.paymentTop200 = vo.paymentTop200 + 200
					} else if(p.voucher.batch.id == 13){
						vo.paymentTop66 = vo.paymentTop66 + 66
					}
//				}
			}
			def payments2 = branchPayment2.get(b.id)
			payments2.each {p->
//				if(!(p instanceof SelfhelpVoucherPayment)) {
//					if(p.voucher.amount == 2) {
//						vo.payment2 = vo.payment2 + 2
//					} else if(p.voucher.amount == 6){
//						vo.payment6 = vo.payment6 + 6
//					} else if(p.voucher.amount == 66){
//						vo.payment66 = vo.payment66 + 66
//					} else if(p.voucher.amount == 168){
//						vo.payment168 = vo.payment168 + 168
//					} else if(p.voucher.amount == 1688){
//						vo.payment1688 = vo.payment1688 + 1688
//					}
					
					
					if(p.voucher.amount == 2) {
						if(!(p instanceof SelfhelpVoucherPayment)) {
							vo.payment2 = vo.payment2 + 2
						}
					} else if(p.voucher.batch.id == 4){
						vo.payment6 = vo.payment6 + 6
					} else if(p.voucher.batch.id == 3){
						vo.payment66 = vo.payment66 + 66
					} else if(p.voucher.batch.id == 2){
						vo.payment168 = vo.payment168 + 168
					} else if(p.voucher.batch.id == 1){
						vo.payment1688 = vo.payment1688 + 1688
					} else if(p.voucher.batch.id == 5){
						vo.paymento1999 = vo.paymento1999 + 1999
					} else if(p.voucher.batch.id == 6){
						vo.paymento888 = vo.paymento888 + 888
					} else if(p.voucher.batch.id == 7){
						vo.paymento666 = vo.paymento666 + 666
					} else if(p.voucher.batch.id == 8){
						vo.paymento66 = vo.paymento66 + 66
					} else if(p.voucher.batch.id == 9){
						vo.paymento6 = vo.paymento6 + 6
					} else if(p.voucher.batch.id == 10){
						vo.paymentTop1999 = vo.paymentTop1999 + 1999
					} else if(p.voucher.batch.id == 11){
						vo.paymentTop666 = vo.paymentTop666 + 666
					} else if(p.voucher.batch.id == 12){
						vo.paymentTop200 = vo.paymentTop200 + 200
					} else if(p.voucher.batch.id == 13){
						vo.paymentTop66 = vo.paymentTop66 + 66
					}
//				}
			}
			
		}
		[vos:vos]
	}
	
	def dashboardByStation() {
		def vos = []
		def stationScan = [:]
		def stationPayment = [:]
		def branchId = params.long('branchId')
		
		if(params.branchId) {
			//cache data
			def us = User.list()
			def ds = District.list()
			def bs = Branch.list()
			def gs = GasStation.list()
			def vs = Voucher.list()
			
			def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
			def from, to
			if(params.dateFrom) {
				from = sdf.parse(params.dateFrom)
			}
			if(!from) {
				from = sdf.parse("2015-02-10 00:00")
			}
			if(params.dateTo) {
				to = sdf.parse(params.dateTo)
			}
			if(!to) {
				to = new Date()
			}
			Subscribing.createCriteria().list() {
				projections {
					count()
				}
				groupProperty('comeFrom')
				between('subscribingAt', from, to)
			}.each{s->
				def comeFrom = s[1] as Long
				def station = GasStation.get(comeFrom)
				def branch = station?.district?.branch
				if(branch && branch.id == branchId) {
					def c = stationScan.get(comeFrom)
					if(!c) {
						c = 0
					}
					c += s[0]
					stationScan.put(comeFrom, c)
				}
			}
			
//			Subscribing.createCriteria().list() {
//				projections {
//					count()
//				}
//				groupProperty('comeFrom')
//				between('subscribingAt', from, to)
//			}.each {
//				def comeFrom = it[1] as Long
//				println comeFrom
//				def station = GasStation.get(comeFrom)
//				def branch = station?.district?.branch
//				if(branch) {
//					def c = branchScan.get(branch.id)
//					if(!c) {
//						c = 0
//					}
//					c += it[0]
//					branchScan.put(branch.id, c)
//				}
//			}
	
			GasStationVoucherPayment.findAllByDateCreatedBetween(from, to).each {v->
				def user = v.paiedBy
				def branch = user?.gasStation?.district?.branch
				if(branch && branch.id == branchId) {
					def payments = stationPayment.get(user.gasStation.id)
					if(!payments) {
						payments = []
						stationPayment.put(user.gasStation.id, payments)
					}
					payments.add(v)
				}
			}
			
			GasStation.createCriteria().list() {
				createAlias('district', 'd')
				eq('d.branch.id', branchId)
			}.each {g->
				Spring2015ReportVo vo = new Spring2015ReportVo()
				vos.add([g,vo])
				
				vo.scanSubscribing = stationScan.get(g.id)
				def payments = stationPayment.get(g.id)
				payments.each {p->
//					if(!(p instanceof SelfhelpVoucherPayment)) {
//						if(p.voucher.amount == 2) {
//							vo.payment2 = vo.payment2 + 2
//						} else if(p.voucher.amount == 6){
//							vo.payment6 = vo.payment6 + 6
//						} else if(p.voucher.amount == 66){
//							vo.payment66 = vo.payment66 + 66
//						} else if(p.voucher.amount == 168){
//							vo.payment168 = vo.payment168 + 168
//						} else if(p.voucher.amount == 1688){
//							vo.payment1688 = vo.payment1688 + 1688
//						}
						
						
						
						if(p.voucher.amount == 2) {
							if(!(p instanceof SelfhelpVoucherPayment)) {
								vo.payment2 = vo.payment2 + 2
							}
						} else if(p.voucher.batch.id == 4){
							vo.payment6 = vo.payment6 + 6
						} else if(p.voucher.batch.id == 3){
							vo.payment66 = vo.payment66 + 66
						} else if(p.voucher.batch.id == 2){
							vo.payment168 = vo.payment168 + 168
						} else if(p.voucher.batch.id == 1){
							vo.payment1688 = vo.payment1688 + 1688
						} else if(p.voucher.batch.id == 5){
							vo.paymento1999 = vo.paymento1999 + 1999
						} else if(p.voucher.batch.id == 6){
							vo.paymento888 = vo.paymento888 + 888
						} else if(p.voucher.batch.id == 7){
							vo.paymento666 = vo.paymento666 + 666
						} else if(p.voucher.batch.id == 8){
							vo.paymento66 = vo.paymento66 + 66
						} else if(p.voucher.batch.id == 9){
							vo.paymento6 = vo.paymento6 + 6
						} else if(p.voucher.batch.id == 10){
							vo.paymentTop1999 = vo.paymentTop1999 + 1999
						} else if(p.voucher.batch.id == 11){
							vo.paymentTop666 = vo.paymentTop666 + 666
						} else if(p.voucher.batch.id == 12){
							vo.paymentTop200 = vo.paymentTop200 + 200
						} else if(p.voucher.batch.id == 13){
							vo.paymentTop66 = vo.paymentTop66 + 66
						}
						
//					}
				}
				
			}
		}
		[vos:vos]
	}
	
	def invitingTop() {
		def to
		if(params.dateTo) {
			def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
			try{
				to = sdf.parse(params.dateTo)
			} catch(Exception e){}
		}
		def vCri = DealInvitation.createCriteria()
		def topList = vCri.list {
			projections {
				groupProperty('host')
				count('guest', 'c')
			}
			if(to) {
				le('dateCreated', to)
			}
			order('c','desc')
			order('host.id')
			maxResults(150)
		}
		[topList:topList]
	}
	
	def showSendPrize() {
		
	}
	
	def sendPrize() {
		def ids = params.ids
		def vbId = params.voucherBatch
		def vb
		if(vbId) {
			vb = VoucherBatch.get(vbId)
		}
		def endedAt = params.dateTo
		def availableEndAt
		if(endedAt) {
			def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
			availableEndAt = sdf.parse(endedAt)
		}
		if(ids && availableEndAt && vb) {
			def pvs = []
			ids.eachLine {
				if(it) {
					def sub = Subscriber.get(it)
					def pv = new PresentVoucher()
					pv.batch = vb
					pv.owner = sub
					pv.status = VoucherStatus.ACTIVED
					pv.availableBeginAt = new Date()
					pv.availableEndAt = availableEndAt
					pv.amount = vb.amount
					pv.enabled = true
					pv.save(flush:true)
					pvs.add(pv)
				}
			}
			return [pvs:pvs]
		}
		redirect(action:'showSendPrize')
	}
}
