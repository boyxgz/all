package com.surelution.wxmp.jx

class LateSpring2015ReceiptFuelCharging extends LateSpring2015Receipt {

    static constraints = {
    }

	static mapping = {
		type column:'_type'
	}

	String stationName
	String transNo
	Float amount
	FuelType type

	enum FuelType {
		GAS, DIESEL
		
		public String toString() {
			this == GAS ? "汽油":"柴油"
		}
	}
}
