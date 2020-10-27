----------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date: 20:40:38 10/27/2020 
-- Module Name: register_D - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_D is
	Port ( 
		CLK : in  STD_LOGIC;
		D : in  STD_LOGIC;
		Q : out  STD_LOGIC
	);
end register_D;

architecture Behavioral of register_D is

begin

	process(CLK)
	begin
		if (rising_edge(CLK)) THEN
			Q <= D;
		end if;
	end process;

end Behavioral;

