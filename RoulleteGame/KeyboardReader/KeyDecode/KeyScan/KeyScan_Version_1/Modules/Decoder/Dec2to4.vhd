----------------------------------------------------------------------------------
-- Company: isel
-- Engineer: Miguel Tome'
-- Create Date: 18:29:12 11/04/2020 
-- Module Name: Dec2to4 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dec2to4 is
	Port ( 
		S0 : in  STD_LOGIC;
		S1 : in  STD_LOGIC;
		O0 : out  STD_LOGIC; -- out0
		O1 : out  STD_LOGIC; -- out1
		O2 : out  STD_LOGIC;  -- out2
		O3 : out  STD_LOGIC  -- out3
	);
end Dec2to4;

architecture Behavioral of Dec2to4 is
begin

	O0 <= '1' when S1 = '0' and S0 = '0' else '0';
	O1 <= '1' when S1 = '0' and S0 = '1' else '0';
	O2 <= '1' when S1 = '1' and S0 = '0' else '0';
	O3 <= '1' when S1 = '1' and S0 = '1' else '0';

end Behavioral;

