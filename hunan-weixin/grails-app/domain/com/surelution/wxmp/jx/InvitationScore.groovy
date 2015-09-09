package com.surelution.wxmp.jx

class InvitationScore {

    static constraints = {
		subscriber unique : true
		dateCreated nullable:true
		lastUpdated nullable:true
    }

	Subscriber subscriber
	Integer balance
	Date dateCreated
	Date lastUpdated
	
	public static InvitationScore ofScore(Subscriber subscriber) {
		def score = findBySubscriber(subscriber)
		if(!score) {
			score = new InvitationScore()
			score.subscriber = subscriber
			score.balance = 0
			score.save(flush:true)
		}
		return score
	}
}
