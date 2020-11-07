----------------------------------------------------------------------------------
-- Company: ISEL
-- Engineer: Miguel Tome'
-- Create Date: 21:44:09 11/07/2020 
-- Module Name: KeyControl - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity KeyControl is
	Port ( 
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
		Kpress : in  STD_LOGIC;
		Kack : in  STD_LOGIC;
		Kval : out  STD_LOGIC;
		Kscan : out  STD_LOGIC
	);
end KeyControl;

architecture Behavioral of KeyControl is

	type STATE_TYPE is (
		STATE_SCAN,
		STATE_VAL,
		STATE_ACK
	);
	
	signal CS, NS : STATE_TYPE;
	
begin

	-- Make the transition to the next state on a clock pulse
	State_transition: process(CLK, RST) 
	begin
		if (RST = '1') then
			CS <= STATE_SCAN;
		elsif (rising_edge(CLK)) then
			CS <= NS;
		end if;
	end process;

	-- Determine the next state
	Next_state_evaluation: process(CS, Kpress, Kack) 
	begin
		case (CS) is 
			--
			when STATE_SCAN			=> if (Kpress = '0' or Kack = '1') then NS <= STATE_SCAN;
												else NS <= STATE_VAL; -- Kpress = '1' and kack = '0'
												end if;
			--
			when STATE_VAL				=> if (Kpress = '0') then NS <= STATE_SCAN;
												elsif (Kack = '0') then NS <= STATE_VAL;
												else NS <= STATE_ACK;
												end if;
			--
			when STATE_ACK				=> if (Kpress = '1' or Kack = '1') then NS <= STATE_ACK;
												else NS <= STATE_SCAN; -- Kpress = '0' and Kack = '0'
												end if;
		end case;
	end process;
	
	Kval <= '1' when (CS = STATE_VAL) else '0';
	
	Kscan <= '1' when (CS = STATE_SCAN) else '0';

end Behavioral;

