package isel.lic21ng2.control;

import isel.leic.UsbPort;
import isel.leic.utils.Time;

/**
 * This class have has the main purpose to visualize 
 * the access to the system UsbPort.
 * 
 * @since 11/15/2020
 * 
 * @author Miguel Tome'
 */
public class HAL {

	/**
	 * This variable keeps the current state of UsbPort.out(), and 
	 * is integrity depends on if anyone uses the UsbPort.out() method
	 * instead of the this class, HAL. 
	 */
	private static int UsbPort_out = 0;
	
	/**
	 * This method starts the class.
	 * It will do the process of ack, to keep the keyboard ready 
	 * to accept a key press and
	 * Set the UsbPort_out to zero.
	 * 
	 * @param void
	 * @return void
	 */
	public static void init() {		
		UsbPort_out = 0;
		UsbPort.out(0);
	}
	
	/**
	 * This method return true if the '1' on mask have the value '1' on 
	 * UsbPort.in and false otherwise.
	 * 
	 * If the @param mask is equal to 0, then false is returned
	 * 
	 * Example:
	 * mask 		= 00010000
	 * usbport.in 	= 10101010
	 * 
	 * Should @return false, to this example
	 * 
	 * @param mask
	 * @return
	 */
	public static boolean isBit(int mask) {
		
		return mask != 0 && (UsbPort.in() & mask) == mask;
	}
	
	/**
	 * Return the value of the bits represented by the @param mask
	 * presents at UsbPort.
	 * 
	 * Example:
	 * mask 		= 00001111
	 * usbport.in 	= 11101010
	 * 
	 * This example should @return the the last 4 bits of usbport.in,
	 * 1010
	 * 
	 * @param mask
	 * @return the bits at UsbPort.in that are '1' at mask
	 */
	public static int readBits(int mask) {
		
		return UsbPort.in() & mask;
	}
	
	/**
	 * Write on the bits represented by the @param mask, the value
	 * of the @param value.
	 * The bits on mask that are '0', should be ignored, and the 
	 * value at UsbPort_out at those bits should preserve it's value.
	 * 
	 * Example:
	 * UsbPort_out 	= 01101010;
	 * mask 		= 00001111;
	 * value 		= 01010111;     
	 * 
	 * The result	= 01100111;
	 * 
	 * @param mask
	 * @param value
	 */
	public static void writeBits(int mask, int value) {
		
		/*
		 * (255 ^ mask)
		 * Is the complement of the mask
		 * 
		 * UsbPort_out & (255 ^ mask)
		 * Preserve the non affected by mask, bits
		 * 
		 * (value & mask)
		 * Add the part of value that comply the '1's in the mask
		 */
		UsbPort_out = (UsbPort_out & (255 ^ mask)) 
						+ (value & mask);
		
		UsbPort.out(UsbPort_out);
	}
	
	/**
	 * Set the bits represented by the @param mask, with the 
	 * value '1'.
	 * 
	 * The bit not specified on the mask, may remain unchanged.
	 * 
	 * (255 ^ mask)
	 * Is the complement of the mask
	 * 
	 * UsbPort_out & (255 ^ mask)
	 * Preserve the non affected by mask, bits
	 * 
	 * Example:
	 * UsbPort_out = 00000001
	 * mask = 11100000
	 * 
	 * the result must be 11100001 
	 * 
	 * @param mask
	 */
	public static void setBits(int mask) {
		
		UsbPort_out = (UsbPort_out & (255 ^ mask))
				+ mask;
		
		UsbPort.out(UsbPort_out);
	}
	
	/**
	 * Set the bits represented by the @param mask, with the 
	 * value '0'.
	 * 
	 * (255 ^ mask)
	 * Is the complement of the mask
	 * 
	 * UsbPort_out & (255 ^ mask)
	 * Preserve the non affected by mask, bits
	 * 
	 * Example:
	 * UsbPort_out 	= 10100101
	 * mask 		= 00111100
	 * result		= 10000001
	 * 
	 * @param mask
	 */
	public static void clrBits(int mask) {
		
		UsbPort_out = (UsbPort_out & (255 ^ mask));
		
		UsbPort.out(UsbPort_out);
	}

	public static int getUsbPort_out() {
		return UsbPort_out;
	}
}
