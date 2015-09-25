package com.surelution.wxmp.jx

import java.util.Date;

class GasGiftByVoiceVote implements Serializable {

    static constraints = {
    }
	
	static mapping = {
		id composite: ['candidate', 'voterOpenId']
	}

	Subscriber candidate
	String voterOpenId
	int valid
	Date dateCreated
}
