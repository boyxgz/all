package com.surelution.wxmp.jx

import java.text.SimpleDateFormat

import org.springframework.dao.DataIntegrityViolationException

import com.surelution.wxmp.jx.util.ViolateProcessor;

class VehicleController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def div() {
		
	}

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
		if(vNo) {
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
			if(type) {
				vehicle.type = VehicleType.get(type)
			}
			vehicle.save(flush:true)
			redirect(action:'loadVehicle', id:subscriber.id)
		}
	}
	
	def violate(Long id) {
		def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		def allLine = new ArrayList()
		def nunProcess
		def processed = new ArrayList()
		def subscriber = Subscriber.get(id)
		if(subscriber) {
			def vehicle = Vehicle.findBySubscriber(subscriber)
			nunProcess = ViolateProcessor.find(vehicle.vNo, vehicle.engineId)
		}
		[processed:processed, nunProcess:nunProcess, subscriber:subscriber]
	}
	
	private String trimTag(String orig) {
		return orig.substring(orig.indexOf('>&nbsp;') + 7, orig.length() - 11)
	}
}