--------------------------------------------------------------------------------
-- Company: isel
-- Engineer: Miguel Tome'
-- Create Date: 17:13:58 11/04/2020
-- Module Name: count4bit_testbench.vhd
-- 
-- VHDL Test Bench Created by ISE for module: cont4bit
--
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY count4bit_testbench IS
END count4bit_testbench;
 
ARCHITECTURE behavior OF count4bit_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cont4bit
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         CE : IN  std_logic;
         Q0 : OUT  std_logic;
         Q1 : OUT  std_logic;
         Q2 : OUT  std_logic;
         Q3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal CE : std_logic := '0';

 	--Outputs
   signal Q0 : std_logic;
   signal Q1 : std_logic;
   signal Q2 : std_logic;
   signal Q3 : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cont4bit PORT MAP (
          CLK => CLK,
          RST => RST,
          CE => CE,
          Q0 => Q0,
          Q1 => Q1,
          Q2 => Q2,
          Q3 => Q3
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
		CE <= '1';
		wait for CLK_period*10;
		
		CE <= '0';
		wait for CLK_period*2;
		
		CE <= '1';
		wait for CLK_period*10;

      wait;
   end process;

END;
