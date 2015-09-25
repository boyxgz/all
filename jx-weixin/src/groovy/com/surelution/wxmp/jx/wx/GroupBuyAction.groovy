package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute;

class GroupBuyAction extends JxBaseAction {

    @Override
    public boolean accept() {
        isMenu("uGroup")
    }

    @Override
    public void execute() {
        NewsAttribute na = new NewsAttribute()
        na.add("U团购", "小U为各位小主精选用车相关团购，样样实用，样样优惠！", "http://" + getRootPath() + "/app-images/navigation_demo.jpg", "http://" + getRootPath() + "/groupBuy");
        put(na)
    }

}
