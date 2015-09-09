package com.surelution.wxmp.jx

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
}
