----------------------------------------------------------------------------------
-- Company: isel
-- Engineer: Miguel Tome'
-- Create Date: 18:29:12 11/04/2020 
-- Module Name: Dec2to3 - Structural 
--
-- This is a custom decoder, that have 2 selectors and only 3 outputs (O0-O2).
-- All the outputs, have their exists at low.
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dec2to3_low is
	Port ( 
		S0 : in  STD_LOGIC;
		S1 : in  STD_LOGIC;
		O0 : out  STD_LOGIC; -- out0
		O1 : out  STD_LOGIC; -- out1
		O2 : out  STD_LOGIC  -- out2		
	);
end Dec2to3_low;

architecture Structural of Dec2to3_low is

	COMPONENT Dec2to4
		PORT(
			S0 : IN std_logic;
			S1 : IN std_logic;          
			O0 : OUT std_logic;
			O1 : OUT std_logic;
			O2 : OUT std_logic;
			O3 : OUT std_logic
		);
	END COMPONENT;

	signal out0, out1, out2 : std_logic;

begin

	U0: Dec2to4 PORT MAP(
		S0 => S0,
		S1 => S1,
		O0 => out0,
		O1 => out1,
		O2 => out2,
		O3 => open
	);
	
	O0 <= not out0;
	O1 <= not out1;
	O2 <= not out2;

end Structural;

