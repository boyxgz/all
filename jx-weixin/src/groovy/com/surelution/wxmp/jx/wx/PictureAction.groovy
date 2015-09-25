package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.KeyedMessage
import com.surelution.wxmp.jx.Subscriber

class PictureAction extends JxBaseAction {
    
    @Override
    public boolean accept() {
        getParam(Attribute.KEY_MsgType) == "image"
    }

    @Override
    public void execute() {
//        def now = new Date()
//        PictureUploading pu = new PictureUploading()
//        pu.subscriber = subscriber
//        pu.uploadAt = now
//        pu.msgId = getParam("MsgId")
//        pu.pictureUrl = getParam("PicUrl")
//        pu.path = ""
//        pu.save(flush:true)
//        
//        def path = ConfigurationHolder.config.app.file.upload.path
//        File file = new File("${path}${pu.id}")
//        String picUrl = getParam("PicUrl")
//        URL url = new URL(picUrl)
//        file.withOutputStream {os->
//            os << url.openStream()
//        }
//		
//		def hg = HorseGiftApply.findBySubscriber(subscriber)
//		if(!hg) {
//			hg = new HorseGiftApply()
//			hg.subscriber = subscriber
//			hg.giftType = HorseGiftApply.GiftType.NOT_SET
//			hg.status = HorseGiftApply.ApplyStatus.NEW
//		} else {
//			if(hg.status == HorseGiftApply.ApplyStatus.APPROVED) {
//				String message = KeyedMessage.findByKey("HORSE-GIFT-LUCKLY-MESSAGE-2").message
//				message = message.replace("<VERIFY-CODE>", hg.verifyCode)
//				put(new Attribute(Attribute.KEY_Content, message))
//				return
//			} else if(hg.status == HorseGiftApply.ApplyStatus.UNLUCKLY) {
//				String message = KeyedMessage.findByKey("HORSE-GIFT-UNLUCKLY-MESSAGE").message
//				put(new Attribute(Attribute.KEY_Content, message))
//				return
//			} else if(hg.status == HorseGiftApply.ApplyStatus.PAID) {
//				String message = KeyedMessage.findByKey("HORSE-GIFT-PAID-MESSAGE").message
//				put(new Attribute(Attribute.KEY_Content, message))
//				return
//			} else if(hg.status == HorseGiftApply.ApplyStatus.REJECTED) {
//				if(hg.giftType == HorseGiftApply.GiftType.NOT_SET) {
//					hg.status = HorseGiftApply.ApplyStatus.NEW
//				} else {
//					hg.status = HorseGiftApply.ApplyStatus.DETAILED_INFO
//				}
//			}
//		}
//		hg.uploading = pu
//		hg.save(flush:true)
//
//		def sdf = new SimpleDateFormat("yyyy-MM-dd")
//		def expireAt = sdf.parse("2014-02-28")
//		def vc = VerifyCode.findByContentAndSource(subscriber.id.toString(), "horse-gift")
//		if(!vc) {
//			vc = VerifyCode.generate(subscriber.id.toString(), "horse-gift", expireAt)
//			vc.save(flush:true)
//		}
        
//        String verifyCode = IDUtil.getRefusedId(pu.id.intValue(), 4)
//        Random r = new Random()
//        verifyCode += (r.nextInt(900) + 100)
//        
//        
////        List<WheelPrize> wps = WheelPrize.list()
////        def index = pu.id % 10
////        def prize = wps[index.intValue()]
//        
//        //分享朋友圈，大将三亚游部分
//        def awarded = AwardingStatus.findByCode(AwardingStatus.AWARDED)
//        def yesterday
//        use(TimeCategory) {
//            yesterday = now - 1.day
//        }
//        def history = PrizeAwarding.createCriteria().list {
//            eq('subscriber', subscriber)
//            eq('status', awarded)
//            eq('finished', true)
//            ge('awardedAt',yesterday)
//        }
//        
//        if(history && history.size() > 0) {
//            def syy = new Sanyayou()
//            syy.subscriber = subscriber
//            syy.createdAt = now
//            syy.status = AwardingStatus.findByCode(AwardingStatus.NEW)
//            syy.finished = false
//            syy.picture = pu
//            syy.verifyCode = verifyCode
//            syy.save(flush:true)
//            
//            def msg = KeyedMessage.findByKey("SANYAYOU-WELCOME").message
//            put(new Attribute(Attribute.KEY_Content, msg))
//            return
//        }
//
//        PrizeAwarding pa = new PrizeAwarding()
////        pa.prize = prize.prize
//        pa.subscriber = subscriber
//        AwardingStatus status = AwardingStatus.findByCode(AwardingStatus.NEW)
//        pa.status = status
//        pa.createdAt = now
//        pa.token = UUID.randomUUID().toString()
////        pa.wheelIndex = index
//        pa.verifyCode = verifyCode
//        pa.finished = false
//        pa.picture = pu
//        pa.save(flush:true)
//        def wheelAwardingTitle = KeyedMessage.findByKey("WHEEL-AWARDING-TITLE").message
//        def wheelAwardingDesc = KeyedMessage.findByKey("WHEEL-AWARDING-DESC").message
//        def na = new NewsAttribute()
//        na.add(wheelAwardingTitle, wheelAwardingDesc, "http://${rootPath}/app-images/luck-wheel-demo.jpg", "${rootPath}/prizeAwarding/showDraw?token=${pa.token}")
        def na = new NewsAttribute()
		def title = KeyedMessage.findByKey("HORSE-GIFT-END-TITLE")?.message
		def desc = KeyedMessage.findByKey("HORSE-GIFT-END-DESC")?.message
		na.add(title, desc, "http://${rootPath}/app-images/horse-gift.jpg", "http://mp.weixin.qq.com/s?__biz=MjM5NDg2MDkzMQ==&mid=200019087&idx=1&sn=1f789c7f3395ffc43e5a9b0fc1ffe661")
        put(na)
    }

}
