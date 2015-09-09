package com.surelution.wxmp.jx.wx

import com.surelution.whistle.core.NewsAttribute
import com.surelution.wxmp.jx.Vehicle

class VehicleViolateAction extends JxBaseAction {

    @Override
    public boolean accept() {
        isMenu("vehViolate")
    }

    @Override
    public void execute() {
        def vehicle = Vehicle.findBySubscriber(subscriber)
        def na = new NewsAttribute()
        if(vehicle) {
            na.add("交通违法查询", "点击查看车辆违法情况", "http://${rootPath}/app-images/vehicleViolate.png", "http://${rootPath}/vehicle/violate/${subscriber.id}")
        } else {
            na.add("首次使用，请设置车辆信息", "第一次使用本功能，请设置车辆信息。以后无须再次输入。我们绝不会向任何第三方透露您的车辆信息", "http://${rootPath}/app-images/vehicleViolate.png", "http://${rootPath}/vehicle/loadVehicle/${subscriber.id}")
        }
        put(na)
    }

}
