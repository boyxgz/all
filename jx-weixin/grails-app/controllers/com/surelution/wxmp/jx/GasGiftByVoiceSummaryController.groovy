package com.surelution.wxmp.jx

class GasGiftByVoiceSummaryController {

    def index() {
		params.max = Math.min(params.max as int ?: 10, 100)
		params.offset = params.offset as int ? params.offset as int : 0
		def votingCri = GasGiftByVoiceVote.createCriteria()
		def votingCount = votingCri.list {
			projections {
				count("voterOpenId")
				groupProperty("candidate")
				sum("valid", 'v')
			}
			order('v', 'desc')
			maxResults(params.max)
			firstResult(params.offset)
		}
		def votingCri2 = GasGiftByVoiceVote.createCriteria()
		def total = votingCri2.get {
			projections {
				countDistinct("candidate")
			}
		}
		[votingCount: votingCount, total: total]
	}

    def index2() {
		params.max = Math.min(params.max as int ?: 10, 100)
		params.offset = params.offset as int ? params.offset as int : 0
		def votingCri = GasGiftByVoiceVote.createCriteria()
		def votingCount = votingCri.list {
			projections {
				count("voterOpenId", 'v')
				groupProperty("candidate")
				sum("valid")
			}
			order('v', 'desc')
			maxResults(params.max)
			firstResult(params.offset)
		}
		def votingCri2 = GasGiftByVoiceVote.createCriteria()
		def total = votingCri2.get {
			projections {
				countDistinct("candidate")
			}
		}
		render(view:'index', model:[votingCount: votingCount, total: total])
	}
}
