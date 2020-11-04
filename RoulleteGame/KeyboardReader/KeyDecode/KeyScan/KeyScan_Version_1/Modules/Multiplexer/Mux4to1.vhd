----------------------------------------------------------------------------------
-- Company: isel
-- Engineer: Miguel Tome'
-- Create Date: 17:35:19 11/04/2020 
-- Module Name: Mux4to1 - Behavioral 
--
-- Multiplexer, true table
-- S1 S0 I0 I1 I2 I3
-- 0  0  1  0  0  0
-- 0  1  0  1  0  0
-- 1  0  0  0  1  0
-- 1  1  0  0  0  1
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4to1 is
	Port ( 
		I0 : in STD_LOGIC;
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		S0 : in STD_LOGIC;
		S1 : in STD_LOGIC;
		Y : out STD_LOGIC
	);
end Mux4to1;

architecture Behavioral of Mux4to1 is

begin

	Y <= 	I0 when S0 = '0' and S1 = '0' else
			I1 when S0 = '0' and S1 = '1' else
			I2 when S0 = '1' and S1 = '0' else
			I3 when S0 = '1' and S1 = '1';
	
end Behavioral;

