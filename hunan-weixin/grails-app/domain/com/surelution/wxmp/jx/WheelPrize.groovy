package com.surelution.wxmp.jx

class WheelPrize {

    static constraints = {
        seq unique:true
        prize nullable:true
    }
    int seq
    Prize prize
}
