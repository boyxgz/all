package com.surelution.wxmp.jx

class DashboardController {

    def index() {
		def batch = VoucherBatch.findByCode("voice-gas")
		def voucherCri = Voucher.createCriteria()
		def voiceCount = voucherCri.get {
			eq('batch', batch)
			projections {
				count "id"
			}
		}
		
		def readingCri = ReadingTracking.createCriteria()
		def readingCount = readingCri.get {
			projections {
				count "id"
			}
		}
		
		def readerCri = ReadingTracking.createCriteria()
		def readerCount = readerCri.get {
			projections {
				countDistinct "readerOpenId"
			}
		}
		
		def voteCri = GasGiftByVoiceVote.createCriteria()
		def voteCount = voteCri.get {
			projections {
				countDistinct "id"
			}
		}
		
		[voiceCount:voiceCount, readingCount:readingCount, readerCount:readerCount, voteCount:voteCount]
	}
}
