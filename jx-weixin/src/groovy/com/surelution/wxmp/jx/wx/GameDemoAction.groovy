package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute;
import com.surelution.whistle.core.NewsAttribute;

class GameDemoAction extends JxBaseAction {

    @Override
    public boolean accept() {
        def content = getParam(Attribute.KEY_Content)
        (content && "9" == content.trim()) || isMenu("gameDemo")
    }

    @Override
    public void execute() {
        NewsAttribute na = new NewsAttribute()
        na.add("加满油玩微信，大奖三亚五日游", "大奖总是有规则的哦", "http://${rootPath}/app-images/luck-wheel-demo.jpg", "http://${rootPath}/promotion/gameDemo")
        put(na)
    }

}
