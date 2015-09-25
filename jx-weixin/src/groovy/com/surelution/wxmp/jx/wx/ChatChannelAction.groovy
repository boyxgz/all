package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute;
import com.surelution.wxmp.jx.KeyedMessage;

class ChatChannelAction extends JxBaseAction {

    @Override
    public boolean accept() {
        def content = getParam(Attribute.KEY_Content)
        (content && content.trim() == "3") || isMenu("contactU")
    }

    @Override
    public void execute() {
        //小U忙着出去给各位小主发奖品去啦，回头给小主回复。谢谢小主对小U的支持！
        def msg = KeyedMessage.findByKey("WAITER-OFF-LINE").message
        put(new Attribute(Attribute.KEY_Content,msg))
    }

}
