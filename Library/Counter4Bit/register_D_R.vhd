----------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date: 20:40:38 10/27/2020 
-- Module Name: register_D - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_D_R is
	generic (
		N : positive := 1
	);
	Port ( 
		CLK : in  STD_LOGIC;
		RST : in STD_LOGIC;
		D : in  STD_LOGIC_VECTOR(N-1 downto 0);
		Q : out  STD_LOGIC_VECTOR(N-1 downto 0)
	);
end register_D_R;

architecture Behavioral of register_D_R is

begin

	process(CLK, RST)
	begin
		if (RST = '1') then
			Q <= (others => '0');
		elsif (rising_edge(CLK)) then
			Q <= D;
		end if;
	end process;

end Behavioral;

