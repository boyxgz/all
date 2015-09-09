package com.surelution.wxmp.jx

class LateSpring2015DrawPrizeVoucher extends DrawPrizeVoucher {

    static constraints = {
    }

	public String getName() {
		"${batch.name}"
	}

	public String getInfo() {
		"${batch.description}"
	}
}
