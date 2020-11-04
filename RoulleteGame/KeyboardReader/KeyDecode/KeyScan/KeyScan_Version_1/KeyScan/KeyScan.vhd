----------------------------------------------------------------------------------
-- Company: isel
-- Engineer: Miguel Tome'
-- Create Date: 19:19:31 11/04/2020 
-- Module Name: KeyScan - Structural 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity KeyScan is
	Port ( 
		Kscan : in STD_LOGIC;
		I0 : IN std_logic;
		I1 : IN std_logic;
		I2 : IN std_logic;
		I3 : IN std_logic;
		Kpress : out STD_LOGIC;
		K : out STD_LOGIC_VECTOR (3 downto 0);
		O0 : OUT std_logic;	
		O1 : OUT std_logic;
		O2 : OUT std_logic
	);
end KeyScan;

architecture Structural of KeyScan is
	
	COMPONENT cont4bit
		PORT(
			CLK : IN std_logic;
			RST : IN std_logic;
			CE : IN std_logic;          
			Q0 : OUT std_logic;
			Q1 : OUT std_logic;
			Q2 : OUT std_logic;
			Q3 : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Mux4to1
		PORT(
			I0 : IN std_logic;
			I1 : IN std_logic;
			I2 : IN std_logic;
			I3 : IN std_logic;
			S0 : IN std_logic;
			S1 : IN std_logic;          
			Y : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Dec2to3_low
		PORT(
			S0 : IN std_logic;
			S1 : IN std_logic;          
			O0 : OUT std_logic;
			O1 : OUT std_logic;
			O2 : OUT std_logic
		);
	END COMPONENT;

	constant CLK_period : time := 10 ns;
	signal CLK : std_logic;
	signal RST : std_logic;
	
	signal Q : std_logic_vector(3 downto 0);

begin
	
	-- Clock process definitions
	CLK_process : process
   begin
		
		CLK <= '0';
		wait for CLK_period/2;
		
		CLK <= '1';
		wait for CLK_period/2;
		
   end process;
	
	-- reset on each riding from Kscan (0 -> 1)
	RST_process : process 
	begin 
	
		if (rising_edge(Kscan)) then
			RST <= '1';
		else 
			RST <= '0';
		end if;
	
	end process;
	
	U_cout: cont4bit PORT MAP(
		CLK => CLK,
		RST => RST,
		CE => Kscan,
		Q0 => Q(0),
		Q1 => Q(1),
		Q2 => Q(2),
		Q3 => Q(3)
	);
	
	U_mux: Mux4to1 PORT MAP(
		I0 => I0,
		I1 => I1,
		I2 => I2,
		I3 => I3,
		S0 => Q(0),
		S1 => Q(1),
		Y => Kpress
	);
	
	U_dec: Dec2to3_low PORT MAP(
		S0 => Q(2),
		S1 => Q(3),
		O0 => O0,
		O1 => O1,
		O2 => O2
	);
	
	K <= Q;

end Structural;

