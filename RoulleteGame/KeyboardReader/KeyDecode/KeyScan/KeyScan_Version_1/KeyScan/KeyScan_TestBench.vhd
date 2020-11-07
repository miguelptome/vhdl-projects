--------------------------------------------------------------------------------
-- Company: isel
-- Engineer: Miguel Tome'
-- Create Date: 19:59:30 11/07/2020
-- Module Name: KeyScan_TestBench.vhd
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY KeyScan_TestBench IS
END KeyScan_TestBench;
 
ARCHITECTURE behavior OF KeyScan_TestBench IS 
 
	-- Component Declaration for the Unit Under Test (UUT)
 
   COMPONENT KeyScan
		PORT(
			CLK : IN  std_logic;
			RST : IN  std_logic;
			Kscan : IN  std_logic;
			Kpress : OUT  std_logic;
			K : OUT  std_logic_vector(3 downto 0);
			O0 : OUT  std_logic;
			O1 : OUT  std_logic;
			O2 : OUT  std_logic;
			I0 : IN  std_logic;
			I1 : IN  std_logic;
			I2 : IN  std_logic;
			I3 : IN  std_logic
		);
	END COMPONENT;
	
	--Inputs
	signal CLK : std_logic := '0';
	signal RST : std_logic := '0';
	signal Kscan : std_logic := '0';
	signal I0 : std_logic := '1';
	signal I1 : std_logic := '1';
	signal I2 : std_logic := '1';
	signal I3 : std_logic := '1';

	--Outputs
	signal Kpress : std_logic;
	signal K : std_logic_vector(3 downto 0);
	signal O0 : std_logic;
	signal O1 : std_logic;
	signal O2 : std_logic;

	-- Clock period definitions
	constant CLK_period : time := 10 ns;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: KeyScan PORT MAP (
          CLK => CLK,
          RST => RST,
          Kscan => Kscan,
          Kpress => Kpress,
          K => K,
          O0 => O0,
          O1 => O1,
          O2 => O2,
          I0 => I0,
          I1 => I1,
          I2 => I2,
          I3 => I3
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

	-- stimulus 1 row at each time
   stim_proc: process
   begin		
	
		-- hold reset state for 100 ns.
		RST <= '1';
		wait for 100 ns;	
		RST <= '0';
		wait for CLK_period*10;

		-- insert stimulus here 
		
		--Stimulus process to the 1st row
		--keys 1, 2 and 3
		Kscan <= '1';
		I0 <= '0';
		I1 <= '1';
		I2 <= '1';
		I3 <= '1';
		wait for CLK_period*20;
		
		--Stimulus process to the 2nd row
		--keys 4, 5 and 6
		Kscan <= '1';
		I0 <= '1';
		I1 <= '0';
		I2 <= '1';
		I3 <= '1';
		wait for CLK_period*20;
		
		--Stimulus process to the 3rd row
		--keys 7, 8 and 9
		Kscan <= '1';
		I0 <= '1';
		I1 <= '1';
		I2 <= '0';
		I3 <= '1';
		wait for CLK_period*20;
		
		--Stimulus process to the 4th row
		--keys *, 0 and #
		Kscan <= '1';
		I0 <= '1';
		I1 <= '1';
		I2 <= '1';
		I3 <= '0';
		wait for CLK_period*20;
		
      wait;
   end process;
	
END;
