package com.surelution.wxmp.jx

/**
 * 所有引起账户金额发生变化的操作的共同父类，进账为正值，支出为负值
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class TransLog {

	static mapping = {
		tablePerHierarchy false
	}

	Subscriber subscriber
	Date dateCreated
	Integer amount
}
