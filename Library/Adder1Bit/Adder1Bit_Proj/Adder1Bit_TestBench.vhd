--------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date:   20:07:50 10/22/2020
-- Module Name:   Adder1Bit_TestBench.vhd
-- Project Name:  Adder1Bit_Proj

-- VHDL Test Bench Created by ISE for module: FA
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Adder1Bit_TestBench IS
END Adder1Bit_TestBench;
 
ARCHITECTURE behavior OF Adder1Bit_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FA
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         S : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal Cout : std_logic;
 
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FA PORT MAP (
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
		-- true table 2^3 bit combination to A, B and Cin
		A <= '0';
		B <= '0';
		Cin <= '0';
      wait for CLK_period*2;
		
		A <= '0';
		B <= '0';
		Cin <= '1';
      wait for CLK_period*2;
		
		A <= '0';
		B <= '1';
		Cin <= '0';
      wait for CLK_period*2;
		
		A <= '0';
		B <= '1';
		Cin <= '1';
      wait for CLK_period*2;
		
		A <= '1';
		B <= '0';
		Cin <= '0';
      wait for CLK_period*2;
		
		A <= '1';
		B <= '0';
		Cin <= '1';
      wait for CLK_period*2;
		
		A <= '1';
		B <= '1';
		Cin <= '0';
      wait for CLK_period*2;
		
		A <= '1';
		B <= '1';
		Cin <= '1';
      wait for CLK_period*2;
   end process;

END;
