package isel.lic21ng2.control;

import static java.lang.System.out;

import isel.leic.utils.Time;

public class KBDTest {
	
	public static void runAll() throws Exception {
		out.printf("\nStarting tests to the KBD class\n");
		getKey_test_1();
		getKey_test_2();
		waitKey_test_1();
		out.printf("\nAll the tests to the class KBD succeed\n");
	}
		
	/** ** TEST: 
	 *  
	 *  This test consists on reading the key '0' and assert that.
	 *  ** */
	public static void getKey_test_1() throws Exception {
		out.printf("\nTEST: method: getKey\n");
		
		KBD.init();
		
		int tries = 5;
		char res = 0;
		while (tries-- > 0 && res != '0') {
			out.println("!!! (USER) please click on keyboard key '0'! ... TRY in " + tries);
			
			Time.sleep(1000);
			res = KBD.getKey();
		}
		
		if (res == '0') {
			out.println("TEST: method: getKey --> succeed!");
		}
		else {
			throw new Exception("TEST: method: getKey --> failed!");
		}
	}
	
	/** ** TEST: 
	 *  
	 *  This test will ask the user to read 5 keys from the keyboard.
	 *  The user must confirm on the console that the key read is correct. 
	 *  ** */
	public static void getKey_test_2() throws Exception {
		out.printf("\nTEST: method: getKey\n");
		
		KBD.init();
		
		int nKeys = 5; // number of the keys required to the user
		
		for (int i = 0; i<nKeys; i++) {
			
			out.println("Reading key, number " + (i+1));
			
			int tries = 5;
			char res = 0;
			while (tries-- > 0 && res == 0) {
				out.println("!!! (USER) please click on any keyboard key! ... TRY in " + tries);
				
				Time.sleep(1000);
				res = KBD.getKey();
			}
			
			out.println("Nice!! you pressed on the key: " + res);
		}
		
		out.println("TEST: method: getKey --> finished!");
	}
	
	/** ** TEST: 
	 *  
	 *  This test will wait 5 seconds for a key, and expect a key during 
	 *  that time or fail.
	 *  ** */
	public static void waitKey_test_1() throws Exception {
		out.printf("\nTEST: method: waitKey\n");
		
		KBD.init();
		
		out.println("!!! (USER) please click on any keyboard key! you have 5 seconds");
		char res = KBD.waitKey(5000);
		
		if (res != 0) {
			out.println("TEST: method: waitKey --> succeed!");
		}
		else {
			throw new Exception("TEST: method: waitKey --> failed!");
		}
	}
}
