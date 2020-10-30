----------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date: 16:54:32 10/30/2020 
-- Module Name: ParkCounter - Structural
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ParkCounter is
	Port ( 
		CLK : in STD_LOGIC;
		RST : in STD_LOGIC;
		S0 : in STD_LOGIC;
		S1 : in STD_LOGIC;
		Q : out STD_LOGIC_VECTOR (2 downto 0)
	);
end ParkCounter;

architecture Structural of ParkCounter is
	
	COMPONENT SensorDetector
		PORT(
			CLK : IN std_logic;
			RST : IN std_logic;
			S0 : IN std_logic;
			S1 : IN std_logic;          
			noutIN : OUT std_logic;
			detect : OUT std_logic
		);
	END COMPONENT;

	COMPONENT counter_3bit
		PORT(
			clk : IN std_logic;
			rst : IN std_logic;
			en : IN std_logic;
			ndecinc : IN std_logic;          
			q : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	signal noutIN : std_logic;
	signal detect : std_logic;

begin

	U0: SensorDetector PORT MAP(
		CLK => CLK,
		RST => RST,
		S0 => S0,
		S1 => S1,
		noutIN => noutIN,
		detect => detect
	);

	Inst_counter_3bit: counter_3bit PORT MAP(
		clk => CLK,
		rst => RST,
		en => detect,
		ndecinc => noutIN,
		q => Q
	);

end Structural;

