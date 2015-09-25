package com.surelution.wxmp.jx.wx

import java.text.SimpleDateFormat

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute;
import com.surelution.wxmp.jx.KeyedMessage
import com.surelution.wxmp.jx.RegisterSanyayou

class SanyayouPrizeInfoAction extends JxBaseAction {
    
    private static final long from = 1378267200000

    @Override
    public boolean accept() {
        def content = getParam(Attribute.KEY_Content)
        if(content) {
            return "中奖信息" == content.trim()
        }
        return false
    }

    @Override
    public void execute() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH点mm分")
        long now = System.currentTimeMillis()
        if(now < from) {
            def msg = KeyedMessage.findByKey("QUERY-SANYAYOU-EARY").message
            put(new Attribute(Attribute.KEY_Content, msg))
            return
        } else {
            NewsAttribute na = new NewsAttribute()
            na.add("第一期三亚游抽奖名单", 
                "第一期三亚游抽奖已经完成啦，产生了1名三亚游幸运者。另外还抽取了30位幸运关注者，这30位幸运微友将会获得0.15元/升的超高折扣优惠加油卡一张",
                "http://${rootPath}/app-images/prize_title.jpg", 
                "http://${rootPath}/prizeAwarding/prizeResult")
            put(na)
        }
    }

}
