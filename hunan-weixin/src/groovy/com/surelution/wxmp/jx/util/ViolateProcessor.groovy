/**
 * 
 */

package com.surelution.wxmp.jx.util
import static groovyx.net.http.ContentType.*
import static groovyx.net.http.Method.*
import groovyx.net.http.EncoderRegistry
import groovyx.net.http.HTTPBuilder

import java.text.SimpleDateFormat

import com.surelution.wxmp.jx.IllegalRecord

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class ViolateProcessor {

	public static List<IllegalRecord> find(String vNo, String engineId) throws ViolateProcessingException {
		def sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		def jobId
		
		def http = new HTTPBuilder('http://chaxun.weiche.me')
		http.encoderRegistry = new EncoderRegistry( charset: 'utf-8' )
		
		def tVid, tVno
		if(engineId.length() >= 5) {
			tVid = engineId.substring(engineId.length() - 5)
		} else {
			tVid = ""
			(5-engineId.length()).times {
				tVid += "0"
			}
			tVid += engineId
		}
		
		if(vNo.length() > 1) {
			tVno = vNo.substring(1)
		} else {
			tVno = ""
		}
		def b = [
				province : '江苏' ,
				city_pinyin : 'su1zhou',
				car_province :'苏',
				license_plate_num:tVno,
				body_num:tVid,
				engine_num:'选填',
				save:'1',
				captcha:'验证码'
			]
		
		http.post(  path: '/', body: b, requestContentType: URLENC ) {resp,json ->
				jobId = json.job_id
				println jobId
		}
		def content = pump(jobId, http)
		def records = new XmlParser().parseText(content)
		
		records.tbody.tr.collect {tr->
			def tds = tr.td
			
			def sn = tds[0].text()
			def time = sdf.parse(tds[1].text())
			def address = tds[2].text()
			def desc = tds[3].text()
			def score = tds[4].text()
			def punish = tds[5].text()
			def status = tds[6].text()
			IllegalRecord ir = new IllegalRecord()
			
			ir.illegalAt = time
			ir.address = address
			ir.illegalAction = desc
			ir.status = status
			ir.punish = punish
			ir.score = score
			ir
		}
	}
	
	private static String pump(String uuid, HTTPBuilder http) {
		Thread.sleep(1000)
		def postBody = [job_id :uuid]
		def content
		def status
		http.post(  path: '/', body: postBody) {r,json ->
			   status = json.job_status
			   content = json.data
		}
		println status
		if(2 == status) {
			println "try..."
			return pump(uuid, http)
		}
		println content
		return content
	}
}
