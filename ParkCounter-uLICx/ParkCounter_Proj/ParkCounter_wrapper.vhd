----------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- 
-- Create Date: 18:12:57 10/30/2020 
-- Module Name: ParkCounter_wrapper - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ParkCounter_wrapper is
	Port ( 
		CLK : in STD_LOGIC;
		RST : in STD_LOGIC;
		J2_17 : in STD_LOGIC;
		J2_18 : in STD_LOGIC;
		LED_D1 : out STD_LOGIC;
		LED_D2 : out STD_LOGIC;
		LED_D3 : out STD_LOGIC
	);
end ParkCounter_wrapper;

architecture Structural of ParkCounter_wrapper is

	COMPONENT ParkCounter
		PORT(
			CLK : IN std_logic;
			RST : IN std_logic;
			S0 : IN std_logic;
			S1 : IN std_logic;          
			Q : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	signal q : std_logic_vector(2 downto 0);

begin

	Inst_ParkCounter: ParkCounter PORT MAP(
		CLK => CLK,
		RST => RST,
		S0 => J2_17,
		S1 => J2_18,
		Q => q
	);

	LED_D1 <= q(0);
	LED_D2 <= q(1);
	LED_D3 <= q(2);

end Structural;

