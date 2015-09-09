/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.GasStation
import com.surelution.wxmp.jx.KeyedMessage;
import com.surelution.wxmp.jx.Prize
import com.surelution.wxmp.jx.RegisterPrize;
import com.surelution.wxmp.jx.SubscribingFrom
import com.surelution.wxmp.jx.SystemKeyedConfig

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class ScanAction extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		return getParam("Event") == "SCAN"
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		String eventKey = getParam("EventKey")
		def gasStation = GasStation.get(eventKey)
		def sf = SubscribingFrom.searchByComeFrom(eventKey)
		def msg
		if(sf) {
			msg = "您已经成功关注了我们的账号，无需再次扫描，非常感谢您的厚爱\n--${sf.name}"
		} else {
			msg = "系统错误，错误码：${eventKey}"
		}
		def branches = SystemKeyedConfig.findAllByKeyAndValue("show-register-price", "1")*.branch
		def branch = gasStation?.district?.branch
		if(branch && branches?.contains(branch)) {
			def prize = Prize.findByCode("REGISTERING")
			def rp = RegisterPrize.findByPrizeAndSubscriber(prize, subscriber)
			def scanPrize = KeyedMessage.findByKey("SCAN-PRIZE")?.message
			if(scanPrize.contains("<djm>")) {
				scanPrize = scanPrize.replace("<djm>", rp.verifyCode)
			}
			msg += "\n${scanPrize}"
		}
		put(new Attribute(Attribute.KEY_Content, msg))
	}

}
