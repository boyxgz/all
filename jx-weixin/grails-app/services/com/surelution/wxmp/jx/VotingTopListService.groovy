package com.surelution.wxmp.jx

class VotingTopListService {

    private long lastUpdate
	
	private long updatePerid = 3600000 // 10 minutes
	
	private List<Integer> votingCounts
	
	private synchronized void updateList() {
		def vCri = GasGiftByVoiceVote.createCriteria()
		def c = vCri.list {
			projections {
				groupProperty('candidate')
				sum("valid", "vc")
//				countDistinct("voterOpenId", "vc")
			 }
			order("vc","desc")
		}
		votingCounts = c.collect() {
			it[1]
		}
		lastUpdate = System.currentTimeMillis()
	}
	
	def int topAt(int value) {
		if(System.currentTimeMillis() - lastUpdate > updatePerid) {
			updateList()
		}
		int position = 1

		for(int i : votingCounts) {
			if(i < value) {
				position
				break;
			}
			position++
		}
		return position
	}
}
