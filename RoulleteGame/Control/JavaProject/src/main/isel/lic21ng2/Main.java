package isel.lic21ng2;

import isel.lic21ng2.control.HALTest;
import isel.lic21ng2.control.KBDTest;

public class Main {
	
	public static void main(String[] args) throws Exception {
		
		// write something (1B) to the simulator
		// the value write here, when in NO simulation, will
		//	be write on the OUT of the board
		// receives a value between [0..255], that is one byte (8-bit)
		// UsbPort.out(31);
		
		// read whatever is (1B) on the output of simulator
		// Integer x = UsbPort.in();
		// System.out.println("The value on x is " + x);
		
		
		/* ** RUN TESTS ** */
		HALTest.runAll();
		KBDTest.runAll();
	}
}
