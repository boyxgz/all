package com.surelution.wxmp.jx

import java.text.SimpleDateFormat

import org.springframework.dao.DataIntegrityViolationException

class VehicleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

//    def index() {
//        redirect(action: "list", params: params)
//    }
//
//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        [vehicleInstanceList: Vehicle.list(params), vehicleInstanceTotal: Vehicle.count()]
//    }
//
//    def create() {
//        [vehicleInstance: new Vehicle(params)]
//    }
//
//    def save() {
//        def vehicleInstance = new Vehicle(params)
//        if (!vehicleInstance.save(flush: true)) {
//            render(view: "create", model: [vehicleInstance: vehicleInstance])
//            return
//        }
//
//        flash.message = message(code: 'default.created.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), vehicleInstance.id])
//        redirect(action: "show", id: vehicleInstance.id)
//    }
//
//    def show(Long id) {
//        def vehicleInstance = Vehicle.get(id)
//        if (!vehicleInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), id])
//            redirect(action: "list")
//            return
//        }
//
//        [vehicleInstance: vehicleInstance]
//    }
//
//    def edit(Long id) {
//        def vehicleInstance = Vehicle.get(id)
//        if (!vehicleInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), id])
//            redirect(action: "list")
//            return
//        }
//
//        [vehicleInstance: vehicleInstance]
//    }
//
//    def update(Long id, Long version) {
//        def vehicleInstance = Vehicle.get(id)
//        if (!vehicleInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), id])
//            redirect(action: "list")
//            return
//        }
//
//        if (version != null) {
//            if (vehicleInstance.version > version) {
//                vehicleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
//                          [message(code: 'vehicle.label', default: 'Vehicle')] as Object[],
//                          "Another user has updated this Vehicle while you were editing")
//                render(view: "edit", model: [vehicleInstance: vehicleInstance])
//                return
//            }
//        }
//
//        vehicleInstance.properties = params
//
//        if (!vehicleInstance.save(flush: true)) {
//            render(view: "edit", model: [vehicleInstance: vehicleInstance])
//            return
//        }
//
//        flash.message = message(code: 'default.updated.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), vehicleInstance.id])
//        redirect(action: "show", id: vehicleInstance.id)
//    }
//
//    def delete(Long id) {
//        def vehicleInstance = Vehicle.get(id)
//        if (!vehicleInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), id])
//            redirect(action: "list")
//            return
//        }
//
//        try {
//            vehicleInstance.delete(flush: true)
//            flash.message = message(code: 'default.deleted.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), id])
//            redirect(action: "list")
//        }
//        catch (DataIntegrityViolationException e) {
//            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), id])
//            redirect(action: "show", id: id)
//        }
//    }
    
    def loadVehicle(Long id) {
        def subscriber = Subscriber.get(id)
        if(subscriber) {
            def vehicle = Vehicle.findBySubscriber(subscriber)
            [subscriber:subscriber, vehicle:vehicle]
        }
    }
    
    def addNew() {
        def type = params.type
        def vId = params.vId
        def engineId = params.engineId
        def vNo = params.vNo
        def sid = params.sid
        if(type && vId && engineId && vNo) {
            def subscriber = Subscriber.get(params['subscriber.id'])
            def vehicle
            if(subscriber) {
                vehicle = Vehicle.findBySubscriber(subscriber)
                if(!vehicle) {
                    vehicle = new Vehicle()
                    vehicle.subscriber = subscriber
                }
            }
            vehicle.vId = vId
            vehicle.engineId = engineId
            vehicle.vNo = vNo
            def vehicleType = VehicleType.get(type)
            vehicle.type = vehicleType
            vehicle.save(flush:true)
            redirect(action:'loadVehicle', id:subscriber.id)
        }
    }
    
    def violate(Long id) {
        def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
        def allLine = new ArrayList()
        def nunProcess = new ArrayList()
        def processed = new ArrayList()
        def subscriber = Subscriber.get(id)
        if(subscriber) {
            def vehicle = Vehicle.findBySubscriber(subscriber)
            def type = vehicle.type.value
            if(type.length() == 1) {
                type = "0${type}"
            }
            def vNo = URLEncoder.encode(vehicle.vNo, "gbk")
            def hasRecord = false
            def emptyRecord = false
            if(vehicle) {
                def sUrl = "http://60.190.151.158:8080/queryVehVio.do?hpzl=${type}&hphm=${vNo}&clsbdh=${vehicle.vId}&fdjh=${vehicle.engineId}"
                URL url = new URL(sUrl)
                def inputStream = url.openStream()
                def ir = new InputStreamReader(inputStream, "gbk")
                boolean afterForm = false
                boolean inTable = false
                ir.eachLine {
                    if(it.contains('<tr><td colspan="5" align="center">以上查询结果仅供参考。</td></tr>')) {
                        inTable = false
                        hasRecord = true
                    }
                    if(it.contains('你所查询的车辆没有非现场交通违法记录')) {
                        emptyRecord = true
                    }
                    if(afterForm && inTable) {
                        def line = it.trim()
                        if(line)
                            allLine.add(line)
                    }
                    if(it.contains("</form>")) {
                        afterForm = true
                    }
                    if(afterForm) {
                        if(it.contains('<table border="0" cellpadding="0" cellspacing="0" class="list">')) {
                            inTable = true
                        }
                    }
                }
            }
            
            if(hasRecord) {
                allLine = allLine.subList(10, allLine.size())
                
                (0 .. (int)(allLine.size() / 7) - 1).each {
                    int start = it * 7
                    String sDate = allLine.get(start + 1)
                    sDate = trimTag(sDate)
                    String address = trimTag(allLine.get(start + 2))
                    String illegalAction = trimTag(allLine.get(start + 3))
                    String status = trimTag(allLine.get(start + 4))
                    String officer = trimTag(allLine.get(start + 5))
                    IllegalRecord rec = new IllegalRecord()
                    rec.illegalAt = sdf.parse(sDate)
                    rec.address = address
                    rec.illegalAction = illegalAction
                    rec.status = status
                    rec.policeOffice = officer
                    if("已处理，已交款" == status) {
                        processed.add(rec)
                    } else {
                        nunProcess.add(rec)
                    }
                }
                
            }
        }
        [processed:processed, nunProcess:nunProcess, subscriber:subscriber]
    }
    
    def test() {
        
    }
    
    private String trimTag(String orig) {
        return orig.substring(orig.indexOf('>&nbsp;') + 7, orig.length() - 11)
    }
}
