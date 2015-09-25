package com.surelution.wxmp.jx

import com.surelution.whistle.core.Auth2Util

class GasGiftByVoiceController {

	def votingTopListService

    def myGift(String id) {
		def subscriber = Subscriber.findByOpenId(id)
		def dest = "http://${request.serverName}${servletContext.contextPath}/trackableArticle/path/1"
		def url = Auth2Util.buildRedirectUrl(dest, subscriber.openId, Auth2Util.AuthScope.BASE)
		def readingCri = ReadingTracking.createCriteria()
		def readingCount = readingCri.get {
			eq('sharerOpenId', id)
		    projections {
		        countDistinct "readerOpenId"
		    }
		}
		
		def votingCri = GasGiftByVoiceVote.createCriteria()
		def votingCount = votingCri.get {
			eq('candidate', subscriber)
			projections {
				countDistinct "voterOpenId"
				sum("valid")
			}
		}

		def validCount = votingCount[1]?votingCount[1].intValue() : 0
		def topAt = votingTopListService.topAt(validCount)
		//def topAt = votingTopListService.topAt(votingCount[0])
		
		[url:url, readingCount:readingCount, votingCount:validCount, faultCount:votingCount[0] - validCount, topAt:topAt]
	}
	
	def vote() {
		def status = 1
		if(System.currentTimeMillis() > 1414483200000) {
			status = 2
		} else {
			def candidateOpenId = params.candidate
			def voter = params.voter
			
			def candidate = Subscriber.findByOpenId(candidateOpenId)
	
			def vote = GasGiftByVoiceVote.findByCandidateAndVoterOpenId(candidate, voter)
			if(!vote) {
				vote = new GasGiftByVoiceVote()
				vote.candidate = candidate
				vote.voterOpenId = voter
				vote.save(flush:true)
			} else {
				status = 0
			}
		}
		render(contentType: "application/json") {
			voteInfo(status:status)
		}
	}
	
	def votingTop() {
		//GasGiftByVoiceVote.createCritia()
	}
	
	def free300Notice() {
		
	}
	
	def freeHalfATon() {
		
	}
}
