package com.surelution.wxmp.jx

import com.surelution.id.PuzzleIdUtil

class UbeanToken extends Token {

    static constraints = {
		sn nullable:true
    }
	
	def afterInsert() {
		sn = PuzzleIdUtil.generate(id.intValue(), 6, 4)
		save()
	}
	
	Float amount
}
