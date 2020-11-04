----------------------------------------------------------------------------------
-- Company: isel
-- Engineer: Miguel Tome'
-- Create Date: 18:29:12 11/04/2020 
-- Module Name: Dec2to3 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dec2to4 is
	Port ( 
		S0 : in  STD_LOGIC;
		S1 : in  STD_LOGIC;
		O0 : out  STD_LOGIC; -- out0
		O1 : out  STD_LOGIC; -- out1
		O2 : out  STD_LOGIC  -- out2
	);
end Dec2to4;

architecture Behavioral of Dec2to4 is
begin

	O0 <= S0 = '0' and S1 = '0';
	O1 <= S0 = '0' and S1 = '1';
	O2 <= S0 = '1' and S1 = '0';

end Behavioral;

