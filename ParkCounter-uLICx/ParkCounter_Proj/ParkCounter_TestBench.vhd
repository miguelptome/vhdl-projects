--------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date: 17:02:35 10/30/2020
-- Module Name: ParkCounter_TestBench.vhd
-- 
-- VHDL Test Bench Created by ISE for module: ParkCounter
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY ParkCounter_TestBench IS
END ParkCounter_TestBench;
 
ARCHITECTURE behavior OF ParkCounter_TestBench IS 
 
	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT ParkCounter
		PORT(
			CLK : IN  std_logic;
			RST : IN  std_logic;
			S0 : IN  std_logic;
			S1 : IN  std_logic;
			Q : OUT  std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	--Inputs
	signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ParkCounter PORT MAP (
          CLK => CLK,
          RST => RST,
          S0 => S0,
          S1 => S1,
          Q => Q
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
		-- vheicle to inside direction
		S0 <= '1';
		S1 <= '0';
		wait for CLK_period*2;
		S0 <= '1';
		S1 <= '1';
		wait for CLK_period*2;
		S0 <= '0';
		S1 <= '1';
		wait for CLK_period*2;
		S0 <= '0';
		S1 <= '0';
		wait for CLK_period*2;
		
		-- 2nd vheicle to inside direction
		S0 <= '1';
		S1 <= '0';
		wait for CLK_period*2;
		S0 <= '1';
		S1 <= '1';
		wait for CLK_period*2;
		S0 <= '0';
		S1 <= '1';
		wait for CLK_period*2;
		S0 <= '0';
		S1 <= '0';
		wait for CLK_period*2;
		
		-- vheicle to ouside direction
		S0 <= '0';
		S1 <= '1';
		wait for CLK_period*2;
		S0 <= '1';
		S1 <= '1';
		wait for CLK_period*2;
		S0 <= '1';
		S1 <= '0';
		wait for CLK_period*2;
		S0 <= '0';
		S1 <= '0';
		wait for CLK_period*2;

      wait;
   end process;

END;
