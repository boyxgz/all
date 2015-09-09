package com.surelution.wxmp.jx

import java.text.SimpleDateFormat

import com.surelution.wxmp.jx.Voucher.VoucherStatus
import com.surelution.wxmp.jx.vo.LateSpring2015ReportVo
import com.surelution.wxmp.jx.vo.Spring2015ReportVo

class LateSpring2015ReportController {

    def dashboard() {
		def map = [:]
		def from = new SimpleDateFormat("yyyy-MM-dd").parse("2015-04-1")
		
		def subscribings = Subscribing.executeQuery("""
			  select cast(u.subscribingAt as date), count(u) 
			  from Subscribing as u 
			  where u.subscribingAt > ?
			  group by cast(u.subscribingAt as date)
			""",[from])
		subscribings.each {
			def vo = map[it[0]]
			if(!vo) {
				vo = new LateSpring2015ReportVo()
				map.put(it[0], vo)
			}
			vo.scanSubscribing = it[1]
		}
		
		def payments = VoucherPayment.executeQuery("""
			  select cast(u.dateCreated as date), count(u), u.voucher.batch
			  from VoucherPayment as u 
			  where u.dateCreated > ?
			  group by cast(u.dateCreated as date),u.voucher.batch
			""", [from])
		payments.each {
			def vo = map[it[0]]
			if(!vo) {
				vo = new LateSpring2015ReportVo()
				map.put(it[0], vo)
			}
			vo.addPayment(it[2], it[1] as int)
		}
		
		def vouchers = LateSpring2015DrawPrizeVoucher.executeQuery("""
			  select cast(u.dateCreated as date), count(u), u.batch
			  from LateSpring2015DrawPrizeVoucher as u 
			  where u.dateCreated > ?
			  group by cast(u.dateCreated as date),u.batch
			""", [from])
		vouchers.each {
			def vo = map[it[0]]
			if(!vo) {
				vo = new LateSpring2015ReportVo()
				map.put(it[0], vo)
			}
			vo.addVoucher(it[2], it[1] as int)
		}

		def receipts = LateSpring2015Receipt.executeQuery("""
			  select cast(u.dateCreated as date), count(u)
			  from LateSpring2015Receipt as u 
			  where u.dateCreated > ?
			  group by cast(u.dateCreated as date)
			""", [from])
		receipts.each {
			def vo = map[it[0]]
			if(!vo) {
				vo = new LateSpring2015ReportVo()
				map.put(it[0], vo)
			}
			vo.receiptCount = it[1] as int
		}
		
		def tickets = LateSpring2015DrawPrizeTicket.executeQuery("""
			  select cast(u.dateCreated as date), count(u),count(u.drawAt)
			  from LateSpring2015DrawPrizeTicket as u 
			  where u.dateCreated > ?
			  group by cast(u.dateCreated as date)
			""", [from])
		tickets.each {
			def vo = map[it[0]]
			if(!vo) {
				vo = new LateSpring2015ReportVo()
				map.put(it[0], vo)
			}
			vo.ticketCount = it[1] as int
			vo.drawCount = it[2] as int
		}
		
		def entries = map.entrySet().sort(false) {
			it.key
		}
		[entries:entries]
	}

	def dashboardByBranch() {
		def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
		def from, to
		if(params.dateFrom) {
			from = sdf.parse(params.dateFrom)
		}
		if(!from) {
			from = sdf.parse("2015-04-01 00:00")
		}
		if(params.dateTo) {
			to = sdf.parse(params.dateTo)
		}
		if(!to) {
			to = new Date()
		}
		
		
		def map = [:]

		def subscribings = Subscribing.executeQuery("""
			  select gs.district.branch, count(u) 
			  from Subscribing as u, GasStation gs
			  where u.comeFrom=gs.id and u.subscribingAt between ? and ?
			  group by gs.district.branch
			""",[from, to])
		subscribings.each {
			def vo = map[it[0]]
			if(!vo) {
				vo = new LateSpring2015ReportVo()
				map.put(it[0], vo)
			}
			vo.scanSubscribing = it[1]
		}

		def payments1 = BranchVoucherPayment.executeQuery("""
			  select ub.branch, count(u), u.voucher.batch
			  from BranchVoucherPayment as u, UserBranch ub 
			  where u.paiedBy = ub.user and u.dateCreated between ? and ?
			  group by ub.branch, u.voucher.batch
			""", [from, to])
		payments1.each {
			def vo = map[it[0]]
			if(!vo) {
				vo = new LateSpring2015ReportVo()
				map.put(it[0], vo)
			}
			vo.addPayment(it[2], it[1] as int)
		}

		def payments = GasStationVoucherPayment.executeQuery("""
			  select ug.gasStation.district.branch, count(u), u.voucher.batch
			  from GasStationVoucherPayment as u, UserGasStation ug where u.paiedBy = ug.user
			  and u.dateCreated between ? and ?
			  group by ug.gasStation.district.branch, u.voucher.batch
			""", [from, to])
		payments.each {
			def vo = map[it[0]]
			if(!vo) {
				vo = new LateSpring2015ReportVo()
				map.put(it[0], vo)
			}
			vo.addPayment(it[2], it[1] as int)
		}
		
		def entries = map.entrySet().sort(false) {
			it.key
		}
		[entries:entries]
	}
	
	def dashboardByStation() {
		def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
		def from, to, branch, entries
		if(params.dateFrom) {
			from = sdf.parse(params.dateFrom)
		}
		if(!from) {
			from = sdf.parse("2015-04-01 00:00")
		}
		if(params.dateTo) {
			to = sdf.parse(params.dateTo)
		}
		if(!to) {
			to = new Date()
		}
		if(params.branchId) {
			branch = Branch.get(params.branchId)
		}
		
		def map = [:]

		if(branch) {
			def subscribings = Subscribing.executeQuery("""
			  select gs, count(u) 
			  from Subscribing as u, GasStation gs
			  where u.comeFrom=gs.id and u.subscribingAt between ? and ? and gs.district.branch=?
			  group by gs
			""",[from, to, branch])
			subscribings.each {
				def vo = map[it[0]]
				if(!vo) {
					vo = new LateSpring2015ReportVo()
					map.put(it[0], vo)
				}
				vo.scanSubscribing = it[1]
			}

//			def payments1 = BranchVoucherPayment.executeQuery("""
//			  select ub.branch, count(u), u.voucher.batch
//			  from BranchVoucherPayment as u, UserBranch ub 
//			  where u.paiedBy = ub.user and u.dateCreated between ? and ?
//			  group by ub.branch, u.voucher.batch
//			""", [from, to])
//			payments1.each {
//				def vo = map[it[0]]
//				if(!vo) {
//					vo = new LateSpring2015ReportVo()
//					map.put(it[0], vo)
//				}
//				vo.addPayment(it[2], it[1] as int)
//			}
	
			def payments = GasStationVoucherPayment.executeQuery("""
			  select ug.gasStation, count(u), u.voucher.batch
			  from GasStationVoucherPayment as u, UserGasStation ug where u.paiedBy = ug.user
			  and u.dateCreated between ? and ? and ug.gasStation.district.branch=?
			  group by ug.gasStation, u.voucher.batch
			""", [from, to, branch])
			payments.each {
				def vo = map[it[0]]
				if(!vo) {
					vo = new LateSpring2015ReportVo()
					map.put(it[0], vo)
				}
				vo.addPayment(it[2], it[1] as int)
			}
			
			entries = map.entrySet().sort(false) {
				it.key
			}
		}
		[entries:entries]
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
