package com.surelution.wxmp.jx

import java.text.SimpleDateFormat

import com.surelution.wxmp.jx.vo.BranchSummarySubscribingDailyVo
import com.surelution.wxmp.jx.vo.GasStationSubscribingDailyVo
import com.surelution.wxmp.jx.vo.GasStationSummarySubscribingDailyVo
import com.surelution.wxmp.jx.vo.SubscribingsReport

class ReportsController {

	def springSecurityService
	
	def reportSubscribing(Integer max) {
		//params.max = Math.min(max ?: 10, 100)
		//if(!params.offset) params.offset = 0

		def branchId = params["branchId"]
		def groupType = params["groupType"]
		groupType = groupType ? groupType:"GAS_STATION"

		def searchClosure =  {
			projections {
				count("id")
				groupProperty("comeFrom")
			}
		}

		def c = Subscribing.createCriteria()
		def result = c.list (searchClosure)

        
		def reports = new  HashSet<SubscribingsReport>();
		result.each {
			def report = new SubscribingsReport()
			def station = GasStation.get(it[1])
			report.station = station
			report.district = station?.district
			report.branch = station?.district?.branch
			report.yestodayCount = report.getYestodayStationCount()
			report.count = it[0]
			
			if(branchId) {
				if(branchId as Long ==report.branch?.id){
					reports << report
				}
			}else {
				reports << report
			}
		}

		reports.sort(true) {a,b->
			b.station?.district?.name <=>a.station?.district?.name
		}

		//按加油站分组统计统计的
		def gasStationReports = reports
		//分区统计
		def districtReports = getDistrictReports(gasStationReports);

		//分公司统计
		def branchReports = getBranchReports(districtReports)


		if(groupType == "GAS_STATION") {
			render(view:"gasStationReport",model:[reportsResult:gasStationReports])
		} else if(groupType =="DISTRICT") {
			render(view:"districtReport",model:[reportsResult:districtReports])
		} else  {
			render(view:"branchReport",model:[reportsResult:branchReports])
		}
	}

	private def getDistrictReports(list) {
		def resultMap = new  HashMap<String,SubscribingsReport>()

		list?.each {report->
			def key = report?.district?.id

			if(key) {
				if(resultMap.containsKey(key)) {
					def sub  = resultMap.get(key)
					sub.count += report.count
					sub.yestodayCount += report.yestodayCount
				} else {
					def sub  = new SubscribingsReport()
					sub.branch = report.branch
					sub.district = report.district
					sub.count = report.count
					sub.yestodayCount= report.yestodayCount
					resultMap.put(key, sub)
					//resultMap[key] = sub
				}
			}
		}

		return resultMap.values()
	}


	private def getBranchReports( list) {
		def resultMap = new  HashMap<String,SubscribingsReport>()

		list?.each {report->
			def key = report?.branch?.id
			if(key) {
				if(resultMap.containsKey(key)) {
					def sub  = resultMap.get(key)
					sub.count += report.count
					sub.yestodayCount += report.yestodayCount
				} else {
					def sub  = new SubscribingsReport()
					sub.branch = report.branch
					sub.count = report.count
					sub.yestodayCount= report.yestodayCount
					resultMap.put(key, sub)
					//resultMap[key] = sub
				}
			}
		}

		return resultMap.values()
	}
	
	def subscriberStationDaily() {
		def map = [:]
		int total = 0
		def result
		def user = springSecurityService.currentUser
		def userGasStation = UserGasStation.findByUser(user)
		if(userGasStation) {
			def station = userGasStation.gasStation
			if(station) {
				def subscribings = Subscribing.findAllByComeFrom("${station.id}")
				result = GasStationSubscribingDailyVo.populate(subscribings)
				total = subscribings.size()
			}
		}
		[result:result, total:total]
	}
	
	def subscriberBranchDaily() {
		def map = [:]
		int total = 0
		def result
		def branches
		def branch
		def user = springSecurityService.currentUser
		if(user.restrictedByBranch) {
			branches = [user.branch]
		} else {
			branches = Branch.findAllByParentIsNotNull()
		}
		def branchId = params['branch.id']
		if(branchId) {
			branch = Branch.get(branchId)
		}
		if(branch) {
			def stationIds = GasStation.createCriteria().list() {
				createAlias('district', 'd')
				eq('d.branch', branch)
			}.collect() {
				it.id.toString()
			}
			def subscribings = Subscribing.createCriteria().list() {
				'in'('comeFrom', stationIds)
			}
			result = GasStationSummarySubscribingDailyVo.populate(subscribings)
		}
		[branches:branches, result:result]
	}

	def subscriberHeadquarterDaily(String id) {
		def dateFrom
		if(id) {
			def sdf = new SimpleDateFormat("yyyyMMdd")
			dateFrom = sdf.parse(id)
		}
		def map = [:]
		def subscribings = Subscribing.createCriteria().list() {
			if(dateFrom) {
				ge('subscribingAt', dateFrom)
			}
		}
		def result = BranchSummarySubscribingDailyVo.populate(subscribings)
		[result:result]
	}
	
	def stationDetailList() {
		def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
		def dateFrom
		def dateTo
		
		try{
			if(params.dateFrom) {
				dateFrom = sdf.parse(params.dateFrom)
			}
			if(params.dateTo) {
				dateTo = sdf.parse(params.dateTo)
			}
		}catch(Exception e) {
			e.printStackTrace()
		}
		
		def payments = GasStationVoucherPayment.createCriteria().list() {
			eq('paiedBy', springSecurityService.currentUser)
			if(dateFrom) {
				ge('dateCreated', dateFrom)
			}
			if(dateTo) {
				le('dateCreated', dateTo)
			}
		}
		[payments:payments]
	}
	
	def branchDetailList() {
		def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
		def dateFrom
		def dateTo
		
		try{
			if(params.dateFrom) {
				dateFrom = sdf.parse(params.dateFrom)
			}
			if(params.dateTo) {
				dateTo = sdf.parse(params.dateTo)
			}
		}catch(Exception e) {
			e.printStackTrace()
		}
		
		def payments = BranchVoucherPayment.createCriteria().list() {
			eq('paiedBy', springSecurityService.currentUser)
			if(dateFrom) {
				ge('dateCreated', dateFrom)
			}
			if(dateTo) {
				le('dateCreated', dateTo)
			}
		}
		[payments:payments]
	}
	
	def spring2015Dashboard() {
		def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm")
		def dateFrom
		def dateTo
		
		try{
			if(params.dateFrom) {
				dateFrom = sdf.parse(params.dateFrom)
			}
			if(params.dateTo) {
				dateTo = sdf.parse(params.dateTo)
			}
		}catch(Exception e) {
			e.printStackTrace()
		}
		
		def drawPrizeCount = DrawPrizeTicket.createCriteria().get() {
			projections {
				count('id')
			}
			if(dateFrom) {
				ge('dateCreated', dateFrom)
			}
			if(dateTo) {
				le('dateCreated', dateTo)
			}
		}
		def prizeInfo = DrawPrizeVoucher.createCriteria().list() {
			projections {
				count('id')
				count('paiedAt')
				groupProperty("batch")
			}
			if(dateFrom) {
				ge('dateCreated', dateFrom)
			}
			if(dateTo) {
				le('dateCreated', dateTo)
			}
		}
		
		def prizeInfo2 = PresentVoucher.createCriteria().list() {
			projections {
				count('id')
				count('paiedAt')
				groupProperty("batch")
			}
			if(dateFrom) {
				ge('dateCreated', dateFrom)
			}
			if(dateTo) {
				le('dateCreated', dateTo)
			}
		}
		
		prizeInfo.addAll(prizeInfo2)
		
		def inviting = DealInvitation.createCriteria().get() {
			projections {
				count('id')
			}
			if(dateFrom) {
				ge('dateCreated', dateFrom)
			}
			if(dateTo) {
				le('dateCreated', dateTo)
			}
		}
		[inviting:inviting, prizeInfo:prizeInfo,drawPrizeCount:drawPrizeCount]
	}
	
}
