package com.surelution.wxmp.jx

class MultiNewsMessageItemBranch {

    static constraints = {
		item(unique:'branch')
    }

	MultiNewsMessageItem item
	Branch branch
}
