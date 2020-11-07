--------------------------------------------------------------------------------
-- Company: ISEL
-- Engineer: Miguel Tome'
-- Create Date: 22:21:27 11/07/2020  
-- Module Name: KeyDecode_TestBench.vhd
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY KeyDecode_TestBench IS
END KeyDecode_TestBench;
 
ARCHITECTURE behavior OF KeyDecode_TestBench IS 
 
	-- Component Declaration for the Unit Under Test (UUT)
 
	COMPONENT KeyDecode
		PORT(
			CLK : IN  std_logic;
			RST : IN  std_logic;
			KB_C0 : OUT  std_logic;
			KB_C1 : OUT  std_logic;
			KB_C2 : OUT  std_logic;
			KB_R0 : IN  std_logic;
			KB_R1 : IN  std_logic;
			KB_R2 : IN  std_logic;
			KB_R3 : IN  std_logic;
			Kack : IN  std_logic;
			Kval : OUT  std_logic;
			K : OUT  std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	--Inputs
	signal CLK : std_logic := '0';
	signal RST : std_logic := '0';
   signal KB_R0 : std_logic := '1';
   signal KB_R1 : std_logic := '1';
   signal KB_R2 : std_logic := '1';
   signal KB_R3 : std_logic := '1';
   signal Kack : std_logic := '0';

 	--Outputs
   signal KB_C0 : std_logic;
   signal KB_C1 : std_logic;
   signal KB_C2 : std_logic;
   signal Kval : std_logic;
   signal K : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: KeyDecode PORT MAP (
          CLK => CLK,
          RST => RST,
          KB_C0 => KB_C0,
          KB_C1 => KB_C1,
          KB_C2 => KB_C2,
          KB_R0 => KB_R0,
          KB_R1 => KB_R1,
          KB_R2 => KB_R2,
          KB_R3 => KB_R3,
          Kack => Kack,
          Kval => Kval,
          K => K
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
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
		Kack <= '0';
		KB_R0 <= '0';
		KB_R1 <= '1';
		KB_R2 <= '1';
		KB_R3 <= '1';
		wait for CLK_period*20;

		--Stimulus process to the 2nd row
		--keys 4, 5 and 6
		Kack <= '0';
		KB_R0 <= '1';
		KB_R1 <= '0';
		KB_R2 <= '1';
		KB_R3 <= '1';
		wait for CLK_period*20;
		
		--Stimulus process to the 3rd row
		--keys 7, 8 and 9
		Kack <= '0';
		KB_R0 <= '1';
		KB_R1 <= '1';
		KB_R2 <= '0';
		KB_R3 <= '1';
		wait for CLK_period*20;
		
		--Stimulus process to the 4th row
		--keys *, 0 and #
		Kack <= '0';
		KB_R0 <= '1';
		KB_R1 <= '1';
		KB_R2 <= '1';
		KB_R3 <= '0';
		wait for CLK_period*20;
      
		wait;
   end process;

END;
