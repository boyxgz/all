package com.surelution.wxmp.jx

import com.surelution.wxmp.jx.Fall2015Voucher.ReviewStatus;

class Fall2015ReportsController {

    def dashboard() {
		def receipts = Fall2015Receipt.executeQuery("""
			  select cast(u.dateCreated as date), u.cardType, u.rule, count(u)
			  from Fall2015Receipt as u 
			  group by cast(u.dateCreated as date), u.cardType, u.rule order by cast(u.dateCreated as date)
			""")
		
		def vouchers = Fall2015Voucher.executeQuery("""
			  select cast(u.dateCreated as date), u.reviewStatus, u.batch, count(u)
			  from Fall2015Voucher as u 
			  group by cast(u.dateCreated as date), u.reviewStatus, u.batch order by cast(u.dateCreated as date)
			""")
		
		[receipts:receipts, vouchers:vouchers]
	}
	
	def cashReport(){
		def dateTo = params.date('dateTo', 'yyyy-MM-dd HH:mm')
		def dateFrom = params.date('dateFrom', 'yyyy-MM-dd HH:mm')
		
		def allReceipt
		if(dateTo && dateFrom){
		   allReceipt = Fall2015Receipt.executeQuery("select count(distinct f.subscriber),sum(f.amount) from Fall2015Receipt f where f.dateCreated between :dateFrom and :dateTo",
			   [dateFrom:dateFrom, dateTo:dateTo])
		 
		def app = Fall2015Voucher.findAllByReviewStatusAndDeliveriedAtBetween(ReviewStatus.APPROVED,dateFrom, dateTo)
		
		def del = Fall2015Voucher.findAllByReviewStatusAndDeliveriedAtBetween(ReviewStatus.DELIVERIED,dateFrom, dateTo)
		 
		def luckyPerson = app.size()+del.size()
		
		def allMount = 0
		
		for(Fall2015Voucher vo:app){
			def mount = Fall2015Receipt.executeQuery("select f.amount from Fall2015Receipt f where f.subscriber = :sub",[sub:vo.owner])
			if(mount) 
				allMount +=mount[0]
		}
		
		for(Fall2015Voucher vo:del){
			def mount = Fall2015Receipt.executeQuery("select f.amount from Fall2015Receipt f where f.subscriber = :sub",[sub:vo.owner])
			if(mount)
			     allMount +=mount[0]
		}
		
		def f1 =  allReceipt[0][1]
		BigDecimal b = new BigDecimal(f1);
		double amount = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
	
		[count:allReceipt[0][0], amount:amount,luckyPerson:luckyPerson,allMount:allMount]
		}
	}
}
