package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.KeyedMessage

class PromotionAction extends JxBaseAction {

	@Override
	public boolean accept() {
        def content = getParam(Attribute.KEY_Content)
		(content && "1" == content.trim()) || isMenu("saving")
	}

	@Override
	public void execute() {
		NewsAttribute na = new NewsAttribute()
		na.add("便利店——月月优惠·天天特价", "点击查看小U精心为您准备的“Usmile”便利店促销商品", "http://${rootPath}/app-images/uSmile.jpg", "http://${rootPath}/promotion/uSmile")
//        na.add("油价优惠——身边优惠·就是实惠", "趁系统管理员去“白相”，小U偷偷将以下加油站挂牌价下调了，小伙伴们不要惊呆啦！", "http://${rootPath}/app-images/jiayouji.jpg", "http://${rootPath}/promotion/gas")
        na.add("加油卡——持卡加油·省钱有招", "description", "http://${rootPath}/app-images/jiayouka.jpg", "http://${rootPath}/promotion/card")
        na.add("自助加油——“亲手”加油·只为省钱", "description", "http://${rootPath}/app-images/zizhujiayou.jpg", "http://${rootPath}/promotion/selfHelp")
		put(na)
	}

}
