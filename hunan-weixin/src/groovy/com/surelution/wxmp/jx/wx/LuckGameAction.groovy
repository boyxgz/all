package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.KeyedMessage

class LuckGameAction extends JxBaseAction {

    @Override
    public boolean accept() {
        def content = getParam(Attribute.KEY_Content)
        (content && "4" == content.trim()) || isMenu("game")
    }

    @Override
    public void execute() {
        def msg = KeyedMessage.findByKey('SANYAYOU').message
        put(new Attribute(Attribute.KEY_Content, msg))
    }

}
