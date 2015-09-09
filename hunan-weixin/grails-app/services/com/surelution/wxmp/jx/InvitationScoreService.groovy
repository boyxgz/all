package com.surelution.wxmp.jx

class InvitationScoreService {

	def saveInvation(InvitationScoreLog iLog) {
		iLog.save(flush:true)
		
		def score = InvitationScore.ofScore(iLog.subscriber)
		score.balance += iLog.amount
		score.save(flush:true)
	}
}
