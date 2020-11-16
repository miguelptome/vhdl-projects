----------------------------------------------------------------------------------
-- Company: ISEL
-- Create Date: 21:50:55 05/18/2020 
-- Module Name: KeyboardReaderWrapper - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity KeyboardReaderWrapper is
	Port (
		CLK 	: IN  std_logic;
		RESET : IN std_logic;
		KLINS : IN  std_logic_vector(3 downto 0);
		ACK 	: IN  std_logic;
		KCOLS : OUT  std_logic_vector(2 downto 0);
		D 		: OUT  std_logic_vector(3 downto 0);
		DVAL 	: OUT  std_logic
	);
end KeyboardReaderWrapper;

architecture Behavioral of KeyboardReaderWrapper is

	--COMPONENT key_decode
	--PORT(
	--	CLK : IN std_logic;
	--	RESET : IN std_logic;
	--	KLINS : IN std_logic_vector(3 downto 0);
	--	KACK : IN std_logic;          
	--	KCOLS : OUT std_logic_vector(2 downto 0);
	--	K : OUT std_logic_vector(3 downto 0);
	--	KVAL : OUT std_logic
	--	);
	--END COMPONENT;
	
	COMPONENT KeyDecode
		PORT(
			CLK : IN std_logic;
			RST : IN std_logic;
			KB_R : IN std_logic_vector(3 downto 0);
			Kack : IN std_logic;          
			KB_C : OUT std_logic_vector(2 downto 0);
			Kval : OUT std_logic;
			K : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
begin

	--Inst_key_decode: key_decode PORT MAP(
	--	CLK => CLK,
	--	RESET => RESET,
	--	KLINS => KLINS,
	--	KACK => ACK,
	--	KCOLS => KCOLS,
	--	K => D,
	--	KVAL => DVAL
	--);

	U_KeyDecode: KeyDecode PORT MAP (
		CLK => CLK,
		RST => RESET,
		KB_C => KCOLS,
		KB_R => KLINS,
		Kack => ACK,
		Kval => DVAL,
		K => D
	);

end Behavioral;

