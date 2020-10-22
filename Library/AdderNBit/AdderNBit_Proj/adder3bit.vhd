----------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date:    21:02:02 10/22/2020 
-- Module Name:    adder3bit - Structural 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder3bit is
	Port ( 
		A : in std_logic_vector(2 downto 0);
		B : in std_logic_vector(2 downto 0);
		Cin : in std_logic;
		S : out std_logic_vector(2 downto 0);
		Cout : out std_logic
	);
end adder3bit;

architecture Structural of adder3bit is

	component FA is 
		Port ( 
			A : in  std_logic;
			B : in  std_logic;
			Cin : in  std_logic;
			S : out  std_logic;
			Cout : out  std_logic 
		);
	end component;

	-- carry
	signal c : std_logic_vector(2 downto 1);
	
begin

	-- LSB adder
	U0:	FA port map (
				A => A(0),
				B => B(0),
				Cin => Cin,
				S => S(0),
				Cout => c(1)
			);
	
	-- 2nd, right to left adder
	U1: 	FA port map (
				A => A(1),
				B => B(1),
				Cin => c(1),
				S => S(1),
				Cout => c(2)
			);
	
	-- MSB adder
	U2: 	FA port map (
				A => A(2),
				B => B(2),
				Cin => c(2),
				S => S(2),
				Cout => Cout
			);

end Structural;

