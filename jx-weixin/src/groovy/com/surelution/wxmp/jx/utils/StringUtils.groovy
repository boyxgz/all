/**
 * 
 */
package com.surelution.wxmp.jx.utils

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
class StringUtils {
	
	public static String formatInt(int value, int length) {
		StringBuffer sb = new StringBuffer()
		String sSubSn = value.toString()
		(length - sSubSn.length()).times {
			sb.append("0")
		}
		sb.append(sSubSn)
		sb.toString()
	}
}
