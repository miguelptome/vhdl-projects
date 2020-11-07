----------------------------------------------------------------------------------
-- Company: isel
-- Engineer: Miguel Tome'
-- Create Date: 17:35:19 11/04/2020 
-- Module Name: Mux4to1 - Behavioral
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4to1 is
	Port ( 
		I0 : in STD_LOGIC;
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		S0 : in STD_LOGIC; --sel0
		S1 : in STD_LOGIC; --sel1
		Y : out STD_LOGIC
	);
end Mux4to1;

architecture Behavioral of Mux4to1 is
begin

	Y <= 	I0 when S1 = '0' and S0 = '0' else
			I1 when S1 = '0' and S0 = '1' else
			I2 when S1 = '1' and S0 = '0' else
			I3 when S1 = '1' and S0 = '1';
	
end Behavioral;

