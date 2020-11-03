----------------------------------------------------------------------------------
-- Engineer: 
-- Create Date:    22:39:02 11/03/2020 
-- Module Name:    Dec2to3 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dec2to3 is
	Port ( 
		S0 : in  STD_LOGIC;
		S1 : in  STD_LOGIC;
		Out0 : out  STD_LOGIC;	
		Out1 : out  STD_LOGIC;
		Out2 : out  STD_LOGIC
	);
end Dec2to3;

architecture Behavioral of Dec2to3 is

begin

	--os if's so' funcionam dentro de process

	--if ('0') then 

	--end if;
	--if (S0 = '0' and S1 = '0') then
	--	Out0 <= '0';
	--else if;
	
	if (S0 = '0' and S1 = '0') then
		Out0 <= '0';
		Out1 <= '1';
		Out2 <= '1';
	
	elsif (S0 = '1' and S1 = '0') then
	
		Out0 <= '1';
		Out1 <= '0';
		Out2 <= '1';

	elsif (S0 = '0' and S1 = '1') then
	
		Out0 <= '1';
		Out1 <= '1';
		Out2 <= '0';
	
	--elsif (S = '1' and S = '1') then
		--bad behavior
	
	else if;

end Behavioral;

