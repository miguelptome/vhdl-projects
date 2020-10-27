
-- VHDL Instantiation Created from source file adderNbit.vhd -- 19:54:13 10/27/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT adderNbit
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		Cin : IN std_logic;          
		S : OUT std_logic_vector(3 downto 0);
		Cout : OUT std_logic
		);
	END COMPONENT;

	Inst_adderNbit: adderNbit PORT MAP(
		A => ,
		B => ,
		Cin => ,
		S => ,
		Cout => 
	);


