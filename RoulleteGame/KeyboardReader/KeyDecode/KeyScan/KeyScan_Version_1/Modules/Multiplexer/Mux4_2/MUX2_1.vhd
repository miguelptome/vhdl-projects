----------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date:    23:16:58 10/22/2020 
-- Module Name:    MUX2_1 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_1 is
	generic (
		N : positive := 3
	);
	port ( 
		I0 : in std_logic_vector(N-1 downto 0);
		I1 : in std_logic_vector(N-1 downto 0);
		Sel : in std_logic;
		Z : out std_logic_vector(N-1 downto 0)
	);
end MUX2_1;

architecture Behavioral of MUX2_1 is
begin

	Z <= I0 when Sel='0' else I1;

end Behavioral;

