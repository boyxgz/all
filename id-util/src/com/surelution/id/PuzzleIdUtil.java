/**
 * 
 */
package com.surelution.id;

import java.util.Random;

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guangzong</a>
 *
 */
public class PuzzleIdUtil {

	private static String plaintextKey = "d8aDtG3Oieqx6ls4WULEy5gXwjnZ7MBJI1KTCNYQRfH9SVkp0uFvcAPhormz2b";
	private static String ciphertextKey = "XFRq18NMLporc0PefCUaJyOShGgmDBn7bQtiZjAv9wE34K5YkdWHlusT6I2zVx";
	private static Random random = new Random();

	public static String generate(int input, int plaintextLength, int ciphertextLength) {
		StringBuffer sb = new StringBuffer();
		sb.append(generate(input, plaintextLength, plaintextKey));
		int maxPuzzle = (int)Math.pow(62, ciphertextLength);
		int puzzle = random.nextInt(maxPuzzle);
		sb.append(generate(puzzle, 2, ciphertextKey));
		return sb.toString();
	}

	private static StringBuffer generate(int input, int length, String key) {
		StringBuffer sb = new StringBuffer();
		while(input > 0) {
			int mod = input % 62;
			input = input / 62;
			sb.insert(0, key.charAt(mod));
		}
		while(sb.length() < length) {
			sb.insert(0, key.charAt(0));
		}
		return sb;
	}
}
