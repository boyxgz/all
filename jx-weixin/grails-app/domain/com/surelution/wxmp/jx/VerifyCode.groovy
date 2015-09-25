package com.surelution.wxmp.jx

import groovy.time.TimeCategory;

class VerifyCode {

    static constraints = {
		expireAt nullable:true
    }
	
	/**
	 * uuid code
	 */
	String code
	
	/**
	 * the content which the code standing for
	 */
	String content
	
	/**
	 * come from, the action ...
	 */
	String source
	
	/**
	 * before expireAt, you can set it to be false
	 */
	boolean enabled
	
	Date createAt
	Date expireAt
	
	/**
	 * 
	 * @param content
	 * @param source
	 * @param the duration in minutes the code will be validate 
	 * @return
	 */
	public static VerifyCode generate(String content, String source, int duration) {
		def vc = new VerifyCode()
		vc.code = UUID.randomUUID().toString()
		vc.content = content
		vc.source = source
		vc.enabled = true
		def now = new Date()
		vc.createAt = now
		def expireAt = null;
		use(TimeCategory) {
			expireAt = now + duration.minutes
		}
		vc.expireAt = expireAt
		vc.save(flush:true)
		return vc
	}
	
	/**
	 * 
	 * @param content
	 * @param source
	 * @param the duration in minutes the code will be validate 
	 * @return
	 */
	public static VerifyCode generate(String content, String source, Date expireAt) {
		def vc = new VerifyCode()
		vc.code = UUID.randomUUID().toString()
		vc.content = content
		vc.source = source
		vc.enabled = true
		def now = new Date()
		vc.createAt = now
		vc.expireAt = expireAt
		vc.save(flush:true)
		return vc
	}
}
