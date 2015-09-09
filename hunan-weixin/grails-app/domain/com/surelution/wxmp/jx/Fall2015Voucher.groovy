package com.surelution.wxmp.jx

class Fall2015Voucher extends DrawPrizeVoucher {

    static constraints = {
		deliveriedAt nullable:true
    }
	
	ReviewStatus reviewStatus = ReviewStatus.WAITING_ADDRESS
	
	Date deliveriedAt

	public String getName() {
		"${batch.name}"
	}
	
	public String getInfo() {
		"${batch.description}"
	}

	enum ReviewStatus {
		WAITING_ADDRESS, //等待输入地址
		WAITING_REVIEW, //等待审核
		APPROVED, //审核通过
		DELIVERIED, //已提交配送
		REJECTED //审核拒绝
	
		public String toString() {
			KeyedMessage.findByKey("ReviewStatus-${name()}")?.message
		}
	}
}
