----------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date: 21:05:45 11/03/2020 
-- Module Name: counter_Nbit - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_Nbit is	
	generic (
		N : positive := 3
	);
	Port ( 	
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		en : in STD_LOGIC;
		ndecinc : in STD_LOGIC;		
		q : out STD_LOGIC_VECTOR (N-1 downto 0)
	);
end counter_Nbit;

architecture Structural of counter_Nbit is

begin


end Structural;

