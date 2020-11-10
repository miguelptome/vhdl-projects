----------------------------------------------------------------------------------
-- Company: ISEL
-- Engineer: Miguel Tome'
-- Create Date: 22:09:22 11/07/2020 
-- Module Name: KeyDecode - Structural 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity KeyDecode is
	Port ( 
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
		
		-- TODO converter para vetor
		KB_C0 : out  STD_LOGIC;
		KB_C1 : out  STD_LOGIC;
		KB_C2 : out  STD_LOGIC;
		KB_R0 : in  STD_LOGIC;
		KB_R1 : in  STD_LOGIC;
		KB_R2 : in  STD_LOGIC;
		KB_R3 : in  STD_LOGIC;
		Kack : in  STD_LOGIC;
		Kval : out  STD_LOGIC;
		K : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end KeyDecode;

architecture Structural of KeyDecode is

	COMPONENT KeyScan
		PORT(
			CLK : IN std_logic;
			RST : IN std_logic;
			Kscan : IN std_logic;
			I0 : IN std_logic;
			I1 : IN std_logic;
			I2 : IN std_logic;
			I3 : IN std_logic;          
			Kpress : OUT std_logic;
			K : OUT std_logic_vector(3 downto 0);
			O0 : OUT std_logic;
			O1 : OUT std_logic;
			O2 : OUT std_logic
		);
	END COMPONENT;

	COMPONENT KeyControl
		PORT(
			CLK : IN std_logic;
			RST : IN std_logic;
			Kpress : IN std_logic;
			Kack : IN std_logic;          
			Kval : OUT std_logic;
			Kscan : OUT std_logic
		);
	END COMPONENT;
	
	signal K_scan, K_press : std_logic;
	
	-- this is the not CLK
	signal nCLK : std_logic;
	
begin

	U_KeyScan: KeyScan PORT MAP(
		CLK => nCLK,
		RST => RST,
		Kscan => K_scan,
		Kpress => K_press,
		K => K,
		O0 => KB_C0,
		O1 => KB_C1,
		O2 => KB_C2,
		I0 => KB_R0,
		I1 => KB_R1,
		I2 => KB_R2,
		I3 => KB_R3
	);

	U_KeyControl: KeyControl PORT MAP(
		CLK => CLK,
		RST => RST,
		Kpress => K_press,
		Kack => Kack,
		Kval => Kval,
		Kscan => K_scan
	);
	
	nCLK <= not CLK;
	
end Structural;

