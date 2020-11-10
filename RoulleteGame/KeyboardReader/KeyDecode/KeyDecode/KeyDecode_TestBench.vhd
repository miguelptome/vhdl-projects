--------------------------------------------------------------------------------
-- Company: ISEL
-- Engineer: Miguel Tome'
-- Create Date: 22:21:27 11/07/2020  
-- Module Name: KeyDecode_TestBench.vhd
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY KeyDecode_TestBench IS
END KeyDecode_TestBench;
 
ARCHITECTURE behavior OF KeyDecode_TestBench IS 
 
	-- Component Declaration for the Unit Under Test (UUT)
 
	COMPONENT KeyDecode
		PORT(
			CLK : IN  std_logic;
			RST : IN  std_logic;
			KB_C : out  STD_LOGIC_VECTOR(2 downto 0);
			KB_R : in  STD_LOGIC_VECTOR(3 downto 0);
			Kack : IN  std_logic;
			Kval : OUT  std_logic;
			K : OUT  std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	--Inputs
	signal CLK : std_logic := '0';
	signal RST : std_logic := '0';
   signal KB_R : std_logic_vector(3 downto 0) := "1111";
   signal Kack : std_logic := '0';

 	--Outputs
   signal KB_C : std_logic_vector(2 downto 0);
   signal Kval : std_logic;
   signal K : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: KeyDecode PORT MAP (
          CLK => CLK,
          RST => RST,
          KB_C => KB_C,
          KB_R => KB_R,
          Kack => Kack,
          Kval => Kval,
          K => K
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		-- hold reset state for 100 ns.	
		RST <= '1';
		wait for 100 ns;	
		RST <= '0';
		wait for CLK_period*10;
		
      -- insert stimulus here 
		
		--Stimulus process to the 1st row
		--keys 1, 2 and 3
		Kack <= '0';
		KB_R <= "1110";
		wait for CLK_period*5;
		
		Kack <= '1';
		wait for CLK_period*2;
		
		Kack <= '0';
		KB_R(0) <= '1'; -- key up
		wait for CLK_period*5;
		
		KB_R(0) <= '0'; -- key down
		wait for CLK_period*5;
		
		Kack <= '1';
		wait for CLK_period*2;
		
		Kack <= '0';
		KB_R(0) <= '1'; -- key up
		wait for CLK_period*5;
		
		KB_R(0) <= '0'; -- key down
		wait for CLK_period*5;

		-- hold reset state for 100 ns.	
		RST <= '1';
		wait for 100 ns;	
		RST <= '0';
		wait for CLK_period*10;

		--Stimulus process to the 2nd row
		--keys 4, 5 and 6
		Kack <= '0';
		KB_R <= "1101";
		wait for CLK_period*5;
		
		Kack <= '1';
		wait for CLK_period*2;
		
		Kack <= '0';
		KB_R(1) <= '1'; -- key up
		wait for CLK_period*5;
		
		KB_R(1) <= '0'; -- key down
		wait for CLK_period*5;
		
		Kack <= '1';
		wait for CLK_period*2;
		
		Kack <= '0';
		KB_R(1) <= '1'; -- key up
		wait for CLK_period*5;
		
		KB_R(1) <= '0'; -- key down
		wait for CLK_period*5;

		-- hold reset state for 100 ns.	
		RST <= '1';
		wait for 100 ns;	
		RST <= '0';
		wait for CLK_period*10;
		
		--Stimulus process to the 3rd row
		--keys 7, 8 and 9
		Kack <= '0';
		KB_R <= "1011";
		wait for CLK_period*5;
		
		Kack <= '1';
		wait for CLK_period*2;
		
		Kack <= '0';
		KB_R(2) <= '1'; -- key up
		wait for CLK_period*5;
		
		KB_R(2) <= '0'; -- key down
		wait for CLK_period*5;
		
		Kack <= '1';
		wait for CLK_period*2;
		
		Kack <= '0';
		KB_R(2) <= '1'; -- key up
		wait for CLK_period*5;
		
		KB_R(2) <= '0'; -- key down
		wait for CLK_period*5;

		-- hold reset state for 100 ns.	
		RST <= '1';
		wait for 100 ns;	
		RST <= '0';
		wait for CLK_period*10;
		
		--Stimulus process to the 4th row
		--keys *, 0 and #
		Kack <= '0';
		KB_R <= "0111";
		wait for CLK_period*5;
		
		Kack <= '1';
		wait for CLK_period*2;
		
		Kack <= '0';
		KB_R(3) <= '1'; -- key up
		wait for CLK_period*5;
		
		KB_R(3) <= '0'; -- key down
		wait for CLK_period*5;
		
		Kack <= '1';
		wait for CLK_period*2;
		
		Kack <= '0';
		KB_R(3) <= '1'; -- key up
		wait for CLK_period*5;
		
		KB_R(3) <= '0'; -- key down
		wait for CLK_period*5;

		wait;
   end process;

END;
