package com.surelution.wxmp.jx

import com.surelution.id.PuzzleIdUtil

class Token {

    static constraints = {
    }
	
	def afterInsert() {
		sn = PuzzleIdUtil.generate(id.intValue(), 6, 4)
		save()
	}

	String sn
	Date dateCreated
	
}
