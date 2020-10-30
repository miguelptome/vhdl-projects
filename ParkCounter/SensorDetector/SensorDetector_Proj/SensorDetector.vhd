----------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date: 15:36:06 10/30/2020 
-- Module Name: SensorDetector - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SensorDetector is
	Port ( 
		CLK : in STD_LOGIC;
		RST : in STD_LOGIC;
		S0 : in STD_LOGIC;
		S1 : in STD_LOGIC;
		noutIN : out STD_LOGIC;
		detect : out STD_LOGIC
	);
end SensorDetector;

architecture Behavioral of SensorDetector is

	type STATE_TYPE is (
		STATE_IDLE,
		STATE_IN0,
		STATE_IN1,
		STATE_IN2,
		STATE_IN3,
		STATE_OUT0,
		STATE_OUT1,
		STATE_OUT2,
		STATE_OUT3
	);

	-- CS = Current State, NS = Next State
	signal CS, NS : STATE_TYPE;

begin
	
	-- Make the transiction to the next state on a clock pulse
	State_Transitions: process(CLK, RST)
	begin 
		if (RST='1') then 
			CS <= STATE_IDLE;
		elsif (rising_edge(CLK)) then
			CS <= NS;
		end if;
	end process;
	
	-- Determine the Next State
	Next_State_Evaluation: process(CS, S0, S1)
	begin
		case (CS) is
			--
			when STATE_IDLE		=> if (S0 = '1') then NS <= STATE_IN0;
											elsif (S1 = '1') then NS <= STATE_OUT0;
											else NS <= STATE_IDLE;
											end if;
			--
			when STATE_IN0			=> if (S0 = '0') then NS <= STATE_IDLE;
											elsif (S1 = '1') then NS <= STATE_IN1;
											else NS <= STATE_IN0;
											end if;
			--
			when STATE_IN1			=> if (S0 = '1') then NS <= STATE_IN1;
											elsif (S1 = '1') then NS <= STATE_IN2;
											else NS <= STATE_IDLE;
											end if;
			--
			when STATE_IN2			=> if (S0 = '1') then NS <= STATE_IN1;
											elsif (S1 = '1') then NS <= STATE_IN2;
											else NS <= STATE_IN3;
											end if;
			--
			when STATE_IN3			=> NS <= STATE_IDLE;
			--
			when STATE_OUT0		=> if (S1 = '0') then NS <= STATE_IDLE;
											elsif (S0 = '0') then NS <= STATE_OUT0;
											else NS <= STATE_OUT1;
											end if;
			--
			when STATE_OUT1		=> if (S1 = '1') then NS <= STATE_OUT1;
											elsif (S0 = '0') then NS <= STATE_IDLE;
											else NS <= STATE_OUT1;
											end if;
			--
			when STATE_OUT2		=> if (S1 = '1') then NS <= STATE_OUT1;
											elsif (S0 = '1') then NS <= STATE_OUT2;
											else NS <= STATE_OUT3;
											end if;
			--
			when STATE_OUT3		=> NS <= STATE_IDLE;
			
		end case;
	end process;
	
	-- signal assigment statements for combinatorial outputs
	detect <= '1' when (CS = STATE_IN3 or CS = STATE_OUT3) else '0';
	
	noutIN <= '1' when (CS = STATE_IN3) else '0';
	
end Behavioral;

