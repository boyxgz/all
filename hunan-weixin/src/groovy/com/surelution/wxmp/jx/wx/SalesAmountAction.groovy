package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute;
import com.surelution.wxmp.jx.Employee;
import com.surelution.wxmp.jx.Subscriber;

class SalesAmountAction extends JxBaseAction {
    
    Employee e

    @Override
    public boolean accept() {
        boolean b = getParam(Attribute.KEY_Content) == "销量"
        String openId = getParam(Attribute.KEY_FromUserName)
        Subscriber s = Subscriber.findByOpenId(openId)
        if(b && !s) {
            e = Employee.findBySubscriber(s)
            b = e && e.certified
            return b
        }
        b
    }

    @Override
    public void execute() {
        put(new Attribute(Attribute.KEY_Content, "请输入销量"))
    }

}
