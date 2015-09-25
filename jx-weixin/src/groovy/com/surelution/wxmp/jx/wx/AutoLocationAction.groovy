/**
 * 
 */
package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.Attribute
import com.surelution.wxmp.jx.AutoLocation
import com.surelution.wxmp.jx.Subscriber

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class AutoLocationAction extends JxBaseAction {

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#accept()
	 */
	@Override
	public boolean accept() {
		getParam("Event") == "LOCATION" && getParam(Attribute.KEY_MsgType) == "event"
	}

	/* (non-Javadoc)
	 * @see com.surelution.whistle.core.BaseAction#execute()
	 */
	@Override
	public void execute() {
		def al = new AutoLocation()
		al.subscriber = subscriber
		al.precision = getParam("Precision")
		al.latitude = Float.parseFloat(getParam("Latitude"))
		al.longitude = Float.parseFloat(getParam("Longitude"))
		al.toUserName = getParam("ToUserName")
		def ct = getParam("CreateTime")
		al.createAt = new Date(Long.parseLong(ct) * 1000)
		al.save(flush:true)
	}

}
