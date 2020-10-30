--------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date: 21:54:52 10/22/2020
-- Module Name: adderNbit_TestBench.vhd
-- Project Name: AdderNBit_Proj
-- 
-- VHDL Test Bench Created by ISE for module: adderNbit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY adderNbit_TestBench IS
END adderNbit_TestBench;
 
ARCHITECTURE behavior OF adderNbit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
	COMPONENT adderNbit
		generic (
			N : positive := 6
		);
		PORT(
			A : IN  std_logic_vector(N-1 downto 0);
			B : IN  std_logic_vector(N-1 downto 0);
			Cin : IN  std_logic;
			S : OUT  std_logic_vector(N-1 downto 0);
			Cout : OUT  std_logic
		);
	END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(5 downto 0) := (others => '0');
   signal B : std_logic_vector(5 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(5 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adderNbit PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;
		
		-- insert stimulus here
		A <= "001000";
		B <= "001010";
		Cin <= '0';
		wait for CLK_period*2;
		
		A <= "011111";
		B <= "000000";
		Cin <= '0';
		wait for CLK_period*2;
		
		A <= "011111";
		B <= "000000";
		Cin <= '1';
		wait for CLK_period*2;
		
   end process;

END;
