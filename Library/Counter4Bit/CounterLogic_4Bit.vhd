----------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date: 19:48:59 10/27/2020 
-- Module Name:    CounterLogic_4Bit - Behavioral
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CounterLogic_4Bit is
	Port ( 
		operandA : in  STD_LOGIC_VECTOR (3 downto 0);		
		ndecINC : in  STD_LOGIC;
		en : in  STD_LOGIC;
		R : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end CounterLogic_4Bit;

architecture Structural of CounterLogic_4Bit is

	COMPONENT MUX2_1
		generic (
			N : positive := 4
		);
		PORT(	
			I0 : IN std_logic_vector(N-1 downto 0);
			I1 : IN std_logic_vector(N-1 downto 0);
			Sel : IN std_logic;          
			Z : OUT std_logic_vector(N-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT adderNbit
		generic (
			N : POSITIVE := 4
		);
		PORT(
			A : IN std_logic_vector(N-1 downto 0);
			B : IN std_logic_vector(N-1 downto 0);
			Cin : IN std_logic;          
			S : OUT std_logic_vector(N-1 downto 0);
			Cout : OUT std_logic
		);
	END COMPONENT;

	signal increment : std_logic_vector(3 downto 0);
	signal operandB : std_logic_vector(3 downto 0);

begin

	U0: MUX2_1 PORT MAP(
		I0 => "1111", -- -1 in two's complement
		I1 => "0001",
		Sel => ndecINC,
		Z => increment
	);
	
	U1: MUX2_1 PORT MAP(
		I0 => "0000",
		I1 => increment,
		Sel => en,
		Z => operandB
	);
	
	U2: adderNbit PORT MAP(
		A => operandA,
		B => operandB,
		Cin => '0',
		S => R,
		Cout => open
	);

end Structural;

