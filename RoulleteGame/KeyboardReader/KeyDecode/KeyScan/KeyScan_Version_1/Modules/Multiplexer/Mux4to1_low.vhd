----------------------------------------------------------------------------------
-- Company: isel
-- Engineer: Miguel Tome'
-- Create Date: 19:18:42 11/07/2020 
-- Module Name: Mux4to1_low - Structural
--
-- This module acts as a normal multiplexer 4to1, but negate the exit Y 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4to1_low is
	Port ( 
		I0 : in STD_LOGIC;
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		I3 : in STD_LOGIC;
		S0 : in STD_LOGIC; --sel0
		S1 : in STD_LOGIC; --sel1
		Y : out STD_LOGIC
	);
end Mux4to1_low;

architecture Structural of Mux4to1_low is

	COMPONENT Mux4to1
		PORT(
			I0 : IN std_logic;
			I1 : IN std_logic;
			I2 : IN std_logic;
			I3 : IN std_logic;
			S0 : IN std_logic;
			S1 : IN std_logic;          
			Y : OUT std_logic
		);
	END COMPONENT;

	signal y1 : std_logic;

begin

	U0: Mux4to1 PORT MAP(
		I0 => I0,
		I1 => I1,
		I2 => I2,
		I3 => I3,
		S0 => S0,
		S1 => S1,
		Y => y1
	);
	
	Y <= not y1;

end Structural;