----------------------------------------------------------------------------------
-- Engineer: 
-- Create Date:    22:49:20 11/03/2020 
-- Module Name:    Dec_2_to_3 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dec_2_to_3 is
	port (
		Sel0 : in STD_LOGIC;
		Out0 : out STD_LOGIC
	);
end Dec_2_to_3;

architecture Behavioral of Dec_2_to_3 is

begin

	if (Sel0 = '1') then
		Out0 <= '0';
	end if;

end Behavioral;

