package isel.lic21ng2.control;

import static java.lang.System.out;

import isel.leic.utils.Time;

public class HALTest {
	
	public static void runAll() throws Exception {
		out.printf("\nStarting tests to the HAL class\n");
		isBit_test_1();
		isBit_test_2();
		isBit_test_3();
		readBits_test_1();
		writeBits_test_1();
		writeBits_test_2();
		setBits_test_1();
		clrBits_test_1();
		out.printf("\nAll the tests to the class HAL succeed\n");
	}
		
	/** ** TEST: 
	 *  
	 *  mask=00000000, 
	 *  the function should return false
	 *  ** */
	public static void isBit_test_1() throws Exception {
		out.printf("\nTEST: method: isBit\n");
		
		HAL.init();
		
		boolean res = HAL.isBit(0);
		if (!res) {
			out.println("TEST: method: isBit --> succeed!");
		}
		else {
			throw new Exception("TEST: method: isBit --> failed!");
		}
	}
	
	/** ** TEST: 
	 *  
	 *  mask=00000010,
	 *  UsbPort.in() = 00000101
	 *  the user must click on the button '5' of the keyboard, and  
	 *  the function should return false
	 *  ** */
	public static void isBit_test_2() throws Exception {
		out.printf("\nTEST: method: isBit\n");
		
		final int mask = 2;
		HAL.init();
		processAck(); // this assure that the user can click on a key
		
		int tries = 5;
		boolean res = true;
		while (tries-- > 0 && res) {
			out.println("!!! (USER) please click on keyboard key '5'! ... TRY in " + tries);
			
			Time.sleep(1000);
			res = HAL.isBit(mask);
		}
		
		if (!res) {
			out.println("TEST: method: isBit --> succeed!");
		}
		else {
			throw new Exception("TEST: method: isBit --> failed!");
		}
	}
	
	/** ** TEST: 
	 *  
	 *  mask=00000100,
	 *  UsbPort.in() = 00000101
	 *  the user must click on the button '5' of the keyboard, and  
	 *  the function should return true
	 *  ** */
	public static void isBit_test_3() throws Exception {
		out.printf("\nTEST: method: isBit\n");
		
		HAL.init();
		processAck(); // this assure that the user can click on a key
		final int mask = 128;
		
		int tries = 5;
		boolean res = false;
		while (tries-- > 0 && !res) {
			out.println("!!! (USER) please click on keyboard key '5'! ... TRY in " + tries);
			
			Time.sleep(1000);
			res = HAL.isBit(mask);
		}
		
		if (res) {
			out.println("TEST: method: isBit --> succeed!");
		}
		else {
			throw new Exception("TEST: method: isBit --> failed!");
		}
	}
	
	/** ** TEST: 
	 *  
	 *  mask=00001111,
	 *  UsbPort.in() = 11110111
	 *  the user must click on the button '0' of the keyboard, and  
	 *  the function should return 00000111
	 *  ** */
	public static void readBits_test_1() throws Exception {
		out.printf("\nTEST: method: readBit\n");
		
		HAL.init();
		processAck(); // this assure that the user can click on a key
		final int mask = 15;
		
		int tries = 5;
		int res = 0;
		while (tries-- > 0 && res != 7) {
			out.println("!!! (USER) please click on keyboard key '0'! ... TRY in " + tries);
			
			Time.sleep(1000);
			res = HAL.readBits(mask);
		}
		
		if (res == 7) {
			out.println("TEST: method: readBit --> succeed!");
		}
		else {
			throw new Exception("TEST: method: readBit --> failed!");
		}
	}
	
	/** ** TEST: 
	 * 
	 *  UsbPort_out 	= 00000000;
	 *  mask 			= 11111111;
	 *  value 			= 01101010;
	 *   
	 *  the value at UsbPort.out should be 01101010
	 *  ** */
	public static void writeBits_test_1() throws Exception {
		out.printf("\nTEST: method: writeBits\n");
		
		HAL.init();
		final int mask = 255; // 11111111
		final int value = 106; // 01101010
		
		HAL.writeBits(mask, value);
		
		if (HAL.getUsbPort_out() == value) {
			out.println("TEST: method: writeBits --> succeed!");
		}
		else {
			throw new Exception("TEST: method: writeBits --> failed!");
		}
	}
	
	/** ** TEST: 
	 * 
	 *  UsbPort_out 	= 01101010;
	 *  mask 			= 11110000;
	 *  value 			= 10011111;
	 *   
	 *  the value at UsbPort.out should be 10011010
	 *  ** */
	public static void writeBits_test_2() throws Exception {
		out.printf("\nTEST: method: writeBits\n");
		
		HAL.init();
		
		int mask = 255; // 11111111
		int value = 106; // 01101010
		HAL.writeBits(mask, value);
		
		mask = 240; // 11110000
		value = 159; // 10011111
		HAL.writeBits(mask, value);
		
		if (HAL.getUsbPort_out() == 154) { // 10011010
			out.println("TEST: method: writeBits --> succeed!");
		}
		else {
			throw new Exception("TEST: method: writeBits --> failed!");
		}
	}
	
	/** ** TEST: 
	 * 
	 * 	UsbPort_out = 00000001
	 * 	mask = 11100000
	 *   
	 *  the value at UsbPort.out should be 11100001
	 *  ** */
	public static void setBits_test_1() throws Exception {
		out.printf("\nTEST: method: setBits\n");
		
		HAL.init();
		
		int mask = 255; // 11111111
		int value = 1; // 00000001
		HAL.writeBits(mask, value);
		
		mask = 224; // 11100000
		HAL.setBits(mask);
		
		if (HAL.getUsbPort_out() == 225) { // 11100001
			out.println("TEST: method: setBits --> succeed!");
		}
		else {
			throw new Exception("TEST: method: setBits --> failed!");
		}
	}
	
	/** ** TEST: 
	 * 
	 * 	UsbPort_out = 10100101
	 * 	mask 		= 00111100
	 *   
	 *  the value at UsbPort.out should be 10000001
	 *  ** */
	public static void clrBits_test_1() throws Exception {
		out.printf("\nTEST: method: clrBits\n");
		
		HAL.init();
		
		int mask = 255; // 11111111
		int value = 165; // 10100101
		HAL.writeBits(mask, value);
		
		mask = 60; // 00111100
		HAL.clrBits(mask);
		
		if (HAL.getUsbPort_out() == 129) { // 10000001
			out.println("TEST: method: clrBits --> succeed!");
		}
		else {
			throw new Exception("TEST: method: clrBits --> failed!");
		}
	}
	
	/**
	 * This method simulated the acknowledge process, normally used 
	 * after reading a key.
	 * 
	 * We look at the O0, at the UsbPort, that is where is mapped 
	 * the ack bit.
	 */
	private static void processAck() {
		HAL.setBits(1);
		Time.sleep(100);
		HAL.clrBits(1);
	}
}
