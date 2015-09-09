package com.surelution.wxmp.jx

class Spring2015InvitingTopService {
	
	private long lastUpdate
	
	private long updatePerid = 3600000 // 10 minutes
	
	private List<Integer> invitingCounts
	
	private synchronized void updateList() {
		def vCri = DealInvitation.createCriteria()
		def c = vCri.list {
			projections {
				groupProperty('host')
				count('guest', 'c')
			}
			le('dateCreated', new Date(1425571199000l))
			order('c','desc')
		}
		invitingCounts = c.collect() {
			it[1]
		}
		lastUpdate = System.currentTimeMillis()
	}
	
	def int maxCount() {
		def m
		if(invitingCounts && invitingCounts.size() > 0) {
			m = invitingCounts.get(0)
		} else {
			m = 0
		}
	}
	
	def int topAt(int value) {
		if(System.currentTimeMillis() - lastUpdate > updatePerid) {
			updateList()
		}
		int position = 1

		for(int i : invitingCounts) {
			if(i < value) {
				position
				break;
			}
			position++
		}
		return position
	}
	
	def top(int index) {
		if(index <= 0) {
			return 0
		}
		if(invitingCounts.size() >= index) {
			return invitingCounts[index - 1]
		} else {
			return 0
		}
	}
}
