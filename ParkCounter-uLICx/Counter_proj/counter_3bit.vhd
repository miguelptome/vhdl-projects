----------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date: 22:00:05 10/27/2020 
-- Module Name: counter_3bit - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_3bit is
	Port ( 	
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		en : in STD_LOGIC;
		ndecinc : in STD_LOGIC;		
		q : out STD_LOGIC_VECTOR (2 downto 0)
	);
end counter_3bit;

architecture Structural of counter_3bit is

	COMPONENT CouterLogic_3Bit
		PORT(
			operandA : IN std_logic_vector(2 downto 0);
			ndecINC : IN std_logic;
			en : IN std_logic;          
			R : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	COMPONENT register_D_R
		generic (
			N : positive := 1
		);
		PORT(
			CLK : IN std_logic;
			RST : IN std_logic;
			D : IN std_logic_vector(N-1 downto 0);          
			Q : OUT std_logic_vector(N-1 downto 0)
		);
	END COMPONENT;

	signal operandA, result : std_logic_vector(2 downto 0);

begin

	U0: CouterLogic_3Bit PORT MAP(
				operandA => operandA,
				ndecINC => ndecinc,
				en => en,
				R => result
			);
	
	U1: register_D_R 
			generic map (
				N => 3
			)
			PORT MAP(
				CLK => clk,
				RST => rst,
				D => result,
				Q => operandA
			);

	q <= operandA;

end Structural;

