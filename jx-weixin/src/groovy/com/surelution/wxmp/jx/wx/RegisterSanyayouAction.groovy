package com.surelution.wxmp.jx.wx

import java.text.SimpleDateFormat;

import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.KeyedMessage;
import com.surelution.wxmp.jx.RegisterSanyayou

class RegisterSanyayouAction extends JxBaseAction {

    private static final long from = 1381291200000
    private static final long to =   1381377600000
    
    @Override
    public boolean accept() {
        def content = getParam(Attribute.KEY_Content)
        if(content) {
            return "我要去三亚" == content.trim()
        }
        return false
    }

    @Override
    public void execute() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH点mm分")
        def msg
        long now = System.currentTimeMillis()
        RegisterSanyayou rs = new RegisterSanyayou()
        rs.registerAt = new Date(now)
        rs.subscriber = subscriber
        rs.accepted = false
        if(now > from && now < to) {
            rs.accepted = true
            msg = KeyedMessage.findByKey("REGISTER-ACCEPTED").message
        } else if(now < from) {
            msg = KeyedMessage.findByKey("REGISTER-NOT-ACCEPTED-EARLY").message + sdf.format(rs.registerAt)
        } else {
            msg = KeyedMessage.findByKey("REGISTER-NOT-ACCEPTED-LATE").message + sdf.format(rs.registerAt)
        }
        rs.save(flush:true)
        put(new Attribute(Attribute.KEY_Content, msg))
    }

}
