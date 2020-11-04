----------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date:    21:35:11 10/22/2020 
-- Module Name:    adderNbit - Structural
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adderNbit is
	generic (
		-- default N = 3 bit
		N : POSITIVE := 4
	);
	port (
		A : in std_logic_vector(N-1 downto 0);
		B : in std_logic_vector(N-1 downto 0);
		Cin : in std_logic;
		S : out std_logic_vector(N-1 downto 0);
		Cout : out std_logic
	);
end adderNbit;

architecture Structural of adderNbit is

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
	signal c : std_logic_vector(N-1 downto 1);

begin

	-- LSB bit add
	U0:	FA port map (
				A => A(0),
				B => B(0),
				Cin => Cin,
				S => S(0),
				Cout => c(1)
			);
	
	-- 1 to N-2 bit add
	U_f: 	for i in 1 to N-2 generate
				
				U_i: 	FA port map (
							A => A(i),
							B => B(i),
							Cin => c(i),
							S => S(i),
							Cout => c(i+1)
						);
				
			end generate;
	
	-- MSB bit add
	U2: 	FA port map (
				A => A(N-1),
				B => B(N-1),
				Cin => c(N-1),
				S => S(N-1),
				Cout => Cout
			);

end Structural;

