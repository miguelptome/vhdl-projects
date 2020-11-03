--------------------------------------------------------------------------------
-- Company: 
-- Create Date:   21:44:21 11/03/2020
-- Module Name:   C:/project/GIT/vhdl-projects/ParkCounter-uLICx/Counter_proj/counter_4bit_testBench.vhd
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY counter_4bit_testBench IS
END counter_4bit_testBench;
 
ARCHITECTURE behavior OF counter_4bit_testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_4bit
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         en : IN  std_logic;
         ndecinc : IN  std_logic;
         q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal en : std_logic := '0';
   signal ndecinc : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_4bit PORT MAP (
          clk => clk,
          rst => rst,
          en => en,
          ndecinc => ndecinc,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		-- hold reset state for 100 ns.
		rst <= '1';
      wait for 100 ns;	
		rst <= '0';
      wait for clk_period*10;

      -- insert stimulus here 
	
		en <= '1';
		ndecinc <= '1';
		wait for clk_period*2;
		
		--wait for clk_period*2;
		
		--wait for clk_period*2;
	
      wait;
   end process;

END;
