----------------------------------------------------------------------------------
-- Engineer: 
-- Create Date:    22:01:29 11/03/2020 
-- Module Name:    Mux4_2 - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4_2 is
	port ( 
		I0 : in std_logic;
		I1 : in std_logic;
		I2 : in std_logic;
		I3 : in std_logic;
		Sel0 : in std_logic;
		Sel1 : in std_logic;
		Y : out std_logic
	);
end Mux4_2;

architecture Behavioral of Mux4_2 is
begin

	Y <= I0 or I1 or I2 or I3;

	--if (Sel0='0' and Sel1 = '0') then
	--	Y <= I0;
	--elsif (Sel0='0' and Sel1 = '1') then
	--	Y <= I1;
	--elsif (Sel0='1' and Sel1 = '0') then
	--	Y <= I2;
	--elsif (Sel0='1' and Sel1 = '1') then
	--	Y <= I3
	--end if;
	
end Behavioral;

