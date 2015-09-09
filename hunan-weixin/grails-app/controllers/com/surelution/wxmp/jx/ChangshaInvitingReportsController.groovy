package com.surelution.wxmp.jx

import java.text.SimpleDateFormat


class ChangshaInvitingReportsController {

	def springSecurityService

    def index() {
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
		
		def gifts = ChangshaSubscribingGift.createCriteria().list() {
			eq('status', ChangshaSubscribingGift.GiftStatus.PAID)
			eq('paidBy', springSecurityService.currentUser)
			between('paidAt', dateFrom, dateTo)
		}
		[gifts:gifts]
	}
	
	def summary() {
		def gifts = ChangshaSubscribingGift.createCriteria().list() {
			eq('channel', ChangshaSubscribingGift.GiftChannel.SUBSCRIBING)
			projections {
				groupProperty('gasStation')
				count('id', 'total')
			}
			order('total', 'desc')
		}
		[gifts:gifts]
	}
	
	def summary2() {
		def gifts = ChangshaSubscribingGift.createCriteria().list() {
			eq('status', ChangshaSubscribingGift.GiftStatus.PAID)
			createAlias('type','t')
			projections {
				groupProperty('paidBy')
				count('id', 'total')
				sum('t.price')
			}
			order('total', 'desc')
		}
		[gifts:gifts]
	}
}
