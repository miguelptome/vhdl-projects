----------------------------------------------------------------------------------
-- Company: isel
-- Engineer: Miguel Tome'
-- Create Date: 19:19:31 11/04/2020 
-- Module Name: KeyScan - Structural 
-- 
-- This is a representation of the module Key Scan, that will use the
-- submodules Counter, Decoder and Multiplexer
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity KeyScan is
	Port ( 
		CLK : IN STD_LOGIC;
		RST: IN STD_LOGIC;
		Kscan : IN STD_LOGIC;
		Kpress : out STD_LOGIC;
		K : out STD_LOGIC_VECTOR (3 downto 0);
		
		-- plugin this ports to the keyboard
		-- decoder 
		O0 : OUT std_logic;
		O1 : OUT std_logic;
		O2 : OUT std_logic;
		-- multiplexer
		I0 : IN std_logic;
		I1 : IN std_logic;
		I2 : IN std_logic;
		I3 : IN std_logic
	);
end KeyScan;

architecture Structural of KeyScan is
	
	COMPONENT cont4bit
		PORT(
			CLK : IN std_logic;
			RST : IN std_logic;
			CE : IN std_logic;          
			Q0 : OUT std_logic;
			Q1 : OUT std_logic;
			Q2 : OUT std_logic;
			Q3 : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Dec2to3_low
		PORT(
			S0 : IN std_logic;
			S1 : IN std_logic;          
			O0 : OUT std_logic;
			O1 : OUT std_logic;
			O2 : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Mux4to1_low
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
	
	signal Q : std_logic_vector(3 downto 0);

begin
	
	U_cout: cont4bit PORT MAP(
		CLK => CLK,
		RST => RST,
		CE => Kscan,
		Q0 => Q(0),
		Q1 => Q(1),
		Q2 => Q(2),
		Q3 => Q(3)
	);
	
	U_dec: Dec2to3_low PORT MAP(
		S0 => Q(2),
		S1 => Q(3),
		O0 => O0,
		O1 => O1,
		O2 => O2
	);
	
	U_mux: Mux4to1_low PORT MAP(
		I0 => I0,
		I1 => I1,
		I2 => I2,
		I3 => I3,
		S0 => Q(0),
		S1 => Q(1),
		Y => Kpress
	);
	
	K <= Q;
	
end Structural;

