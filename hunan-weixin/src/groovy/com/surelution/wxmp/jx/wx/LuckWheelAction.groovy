package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.AwardingStatus
import com.surelution.wxmp.jx.KeyedMessage
import com.surelution.wxmp.jx.PrizeAwarding

class LuckWheelAction extends JxBaseAction {

    @Override
    public boolean accept() {
        def content = getParam(Attribute.KEY_Content)
        (content && "幸运大转盘" == content.trim()) || isMenu("myPrize")
    }

    @Override
    public void execute() {
        def pa = PrizeAwarding.findBySubscriberAndFinished(subscriber, false)
        if(!pa) {
            def msg = KeyedMessage.findByKey("INVITE-WHEEL-AWARDING").message
            put(new Attribute(Attribute.KEY_Content, msg))
            return
        }
        if(pa.status.id == AwardingStatus.findByCode(AwardingStatus.NEW).id) {
            //未抽奖，返回抽奖界面
            
            def wheelAwardingTitle = KeyedMessage.findByKey("WHEEL-AWARDING-TITLE").message
            def wheelAwardingDesc = KeyedMessage.findByKey("WHEEL-AWARDING-DESC").message
            def na = new NewsAttribute()
            na.add(wheelAwardingTitle, wheelAwardingDesc, "http://${rootPath}/app-images/luck-wheel.jpg", "http://${rootPath}/prizeAwarding/showDraw?token=${pa.token}")
            
            put(na)
        } else if(pa.status.id == AwardingStatus.findByCode(AwardingStatus.DRAWN).id) {
            //已抽奖，领奖详情
            
            def wheelAwarding = KeyedMessage.findByKey("WHEEL-AWARDING").message
            wheelAwarding += pa.verifyCode
            def na = new Attribute(Attribute.KEY_Content, wheelAwarding)
            put(na)
        } else if(pa.status.id == AwardingStatus.findByCode(AwardingStatus.AWARDED).id) {
            //已领奖，欢迎下次参与
            def msg = KeyedMessage.findByKey("WHEEL-AWARDING-AWARDED").message
            def na = new Attribute(Attribute.KEY_Content, msg)
            put(na)
        } else if(pa.status.id == AwardingStatus.findByCode(AwardingStatus.REJECTED).id) {
            //已领奖，欢迎下次参与
            def msg = KeyedMessage.findByKey("WHEEL-AWARDING-REJECTED").message
            def na = new Attribute(Attribute.KEY_Content, msg)
            put(na)
        }
    }

}
