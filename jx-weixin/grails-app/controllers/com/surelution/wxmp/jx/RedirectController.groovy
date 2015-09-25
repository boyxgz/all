package com.surelution.wxmp.jx

class RedirectController {

    def u(String id) {
		def token = Token.findBySn(id)
		render(token)
	}
}
