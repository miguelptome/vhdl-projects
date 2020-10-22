----------------------------------------------------------------------------------
-- Engineer: Miguel Tome'
-- Create Date:    19:42:29 10/22/2020 
-- Module Name:    FA - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--FA stands for Full Adder
entity FA is 
	Port ( 
		A : in  std_logic;
		B : in  std_logic;
		Cin : in  std_logic;
		S : out  std_logic;
		Cout : out  std_logic );
end FA;

--
-- Behavioral beacause the entity FA defines how a full adder must behavior
-- S = A xor B xor Cin
-- Cout = A and B or Cin and (A xor B)
--
architecture Behavioral of FA is
	
	signal xor_ab : std_logic;

begin
	
	xor_ab 	<= A xor B;
	
	S 			<= xor_ab xor Cin;
	Cout 		<= ( A and B ) or ( Cin and xor_ab );
	
end Behavioral;
