import isel.leic.UsbPort;

public class UsbPortTest {
	
	public static void main(String[] args) {
		
		// write something (1b) to the simulator
		// the value write here, when in NO simulation, will
		//	be write on the OUT of the board
		// receives a value between [0..255], that is one byte (8-bit)
		UsbPort.out(31);
		
		// read whatever is (1b) on the output of simulator
		Integer x = UsbPort.in();
		System.out.println("The value on x is " + x);
	}
}
