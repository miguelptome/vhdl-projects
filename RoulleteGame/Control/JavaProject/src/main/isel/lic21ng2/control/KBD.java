package isel.lic21ng2.control;

import isel.leic.utils.Time;

/**
 * This class have the purpose of allowing read keys from 
 * the keyboard. 
 * Read the keys {['0'..'9'], '*', '#'} or none.
 * 
 * @since 11/15/2020
 * 
 * @author Miguel Tome'
 */
public class KBD {

	public static final char NONE = 0;
	
	// positions of ack, val and key at UsbPort
	private static final int ACK_MASK = 1; // 00000001
	private static final int KEY_MASK = 15; // 00001111
	private static final int VAL_MASK = 128; // 10000000
	
	/**
	 * This method starts the class.
	 * 
	 * @param void
	 * @return void
	 */
	public static void init() {
		
		HAL.init();
		processAck(); // assure that the user can click on a key
	}
	
	/**
	 * This method should return the key pressed or NONE, if there is´
	 * any key pressed.
	 * 
	 * @return
	 */
	public static char getKey() {
		
		if (!keyPressed()) {
			return NONE;
		}
		
		int keyCode = HAL.readBits(KEY_MASK);
		processAck();
		return getKey(keyCode); 
	}
	
	/**
	 * This method returns the key when the key is pressed or NONE, after 
	 * 'timeout' milliseconds occurs.
	 * 
	 * @param timeout
	 * @return
	 */
	public static char waitKey(long timeout) {
		
		final int TIMEOUT_STEP = 50; // ms
		char key = getKey();
		
		while (timeout > 0 && key == NONE) {
			timeout -= TIMEOUT_STEP;
			Time.sleep(TIMEOUT_STEP);
			key = getKey();
		}
		return key;
	}
	
	/**
	 * This method checks, using HAL, if there is any key pressed 
	 * at this precise moment.
	 * 
	 * We look at the I7 bit of UsbPort, that is mapped with val.
	 * 
	 * @return
	 */
	private static boolean keyPressed() {
		
		return HAL.isBit(VAL_MASK);
	}
	
	/**
	 * This method simulated the acknowledge process, normally used 
	 * after reading a key.
	 * 
	 * We look at the O0, at the UsbPort, that is where is mapped 
	 * the ack bit.
	 */
	private static void processAck() {
		HAL.setBits(ACK_MASK);
		Time.sleep(100);
		HAL.clrBits(ACK_MASK);
	}
	
	/**
	 * This method converts a keyCode to char representing the key.
	 * 
	 * @param keyCode
	 * @return
	 */
	private static char getKey(int keyCode) {
		
		switch(keyCode) {
			case 0: return '1';
			case 1: return '4';
			case 2: return '7';
			case 3: return '*';
			case 4: return '2';
			case 5: return '5';
			case 6: return '8';
			case 7: return '0';
			case 8: return '3';
			case 9: return '6';
			case 10: return '9';
			case 11: return '#';
			default: return NONE;
		}
	}
}
