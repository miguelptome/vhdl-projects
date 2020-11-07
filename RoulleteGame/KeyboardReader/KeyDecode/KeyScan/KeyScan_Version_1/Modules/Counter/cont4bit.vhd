----------------------------------------------------------------------------------
-- Company: ISEL
-- Engineer: Miguel Tome'
-- Create Date: 16:48:25 11/04/2020 
-- Module Name: cont4bit - Structural
--
-- Module Description
-- This module represents a 4bit counter, that increments in one at each clk 
-- iteration.
-- The range of the counter is from 0 to 11 (decimal)
-- The counter only increase when the CE is '1'.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cont4bit is
	Port ( 
		CLK : in STD_LOGIC;
		RST : in STD_LOGIC;
		CE : in STD_LOGIC; -- the enable
		Q0 : out STD_LOGIC;
		Q1 : out STD_LOGIC;
		Q2 : out STD_LOGIC;
		Q3 : out STD_LOGIC
	);
end cont4bit;

architecture Structural of cont4bit is

	COMPONENT counter_4bit
		PORT(
			clk : IN std_logic;
			rst : IN std_logic;
			en : IN std_logic;
			ndecinc : IN std_logic;          
			q : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	signal Q : std_logic_vector(3 downto 0);
	
	signal reset : std_logic;

begin

	-- keep the count between 0 and 11
	reset <= '1' when RST = '1' or Q = "1100" else '0';

	U0: counter_4bit PORT MAP(
		clk => CLK,
		rst => reset,
		en => CE,
		ndecinc => '1',
		q => Q
	);
	
	Q0 <= Q(0);
	Q1 <= Q(1);
	Q2 <= Q(2);
	Q3 <= Q(3);
	
end Structural;

