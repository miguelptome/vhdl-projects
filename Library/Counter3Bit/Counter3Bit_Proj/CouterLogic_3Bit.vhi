
-- VHDL Instantiation Created from source file CouterLogic_3Bit.vhd -- 22:03:46 10/27/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT CouterLogic_3Bit
	PORT(
		operandA : IN std_logic_vector(2 downto 0);
		ndecINC : IN std_logic;
		en : IN std_logic;          
		R : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	Inst_CouterLogic_3Bit: CouterLogic_3Bit PORT MAP(
		operandA => ,
		ndecINC => ,
		en => ,
		R => 
	);


