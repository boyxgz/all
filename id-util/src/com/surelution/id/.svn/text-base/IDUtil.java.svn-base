package com.surelution.id;


public class IDUtil {
	
	private static String seeds = "WRLDGSEUHNCOIXAYQVZJKTBPFM";
	
	public static String getRefusedId(int num, int length) {
		return getRefusedId(num, length, seeds);
	}

	public static String getRefusedId(int num) {
		return getRefusedId(num, 0);
	}

	public static String getRefusedId(int num, int length, String seeds) {
		int i = num;
		StringBuilder sb = new StringBuilder();
		while(true) {
			if(i >= 26) {
				sb.insert(0, seeds.charAt(i % 26));
				i = i / 26;
			} else {
				sb.insert(0, seeds.charAt(i % 26));
				break;
			}
		}
		if(length > sb.length()) {
			for(int n = sb.length(); n < length; n++) {
				sb.insert(0, seeds.charAt(0));
			}
		}
		char c = sb.charAt(sb.length() - 1);
		int last = seeds.indexOf(String.valueOf(c));
		char append = (char)((int)'A' + last);
		sb.insert(0, append);
		return sb.toString();
	
	}
	
	public static long reverseId(String refusedId) throws IdException {
		return reverseId(refusedId, refusedId);
	}
	
	public static long reverseId(String refusedId, String seeds) throws IdException {
		long ret = 0;
		for(int i = 1; i < refusedId.length(); i++) {
			char c = refusedId.charAt(i);
			ret = ret * 26 + seeds.indexOf(String.valueOf(c));
		}
		char c = refusedId.charAt(0);
		int index = c -'A';
		char c2 = refusedId.charAt(refusedId.length() - 1);
		if(index != seeds.indexOf(c2)) {
			throw new IdException();
		}
		return ret;
	}
	
	public static void main(String[] args) throws IdException {
		System.out.println(getRefusedId(75, 3));
		System.out.println(reverseId("HLQU"));
	}

}
