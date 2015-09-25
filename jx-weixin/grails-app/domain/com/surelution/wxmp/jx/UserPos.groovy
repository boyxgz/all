package com.surelution.wxmp.jx

import java.io.Serializable;

class UserPos implements Serializable {

	static mapping = {
		id composite: ['pos', 'user']
		version false
	}

	User user
	Pos pos
}
