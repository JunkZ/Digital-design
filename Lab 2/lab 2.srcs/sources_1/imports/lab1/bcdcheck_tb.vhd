library ieee;              		-- Load the ieee 1164 library
use ieee.std_logic_1164.all;  	-- Make the package 'visible'


-- The top level entity of the test bench has no ports...
entity bcdcheck_tb is
end bcdcheck_tb;

architecture stimulus of bcdcheck_tb is
  -- First, declare the lower-level entity...
  component bcdcheck
    port  (x3, x2, x1, x0 : in STD_LOGIC;
           max, min, even, lo3, noBCD : out STD_LOGIC);
  end component;
  
  -- Next, declare some local signals to assign values to and observe...
  signal x3_test, x2_test, x1_test, x0_test : STD_LOGIC;
  signal max_test, min_test, even_test, lo3_test, noBCD_test : STD_LOGIC;
  
begin
  -- Create an instance of the component under test
  bcdcheck_instance: bcdcheck port map( 
	x3 => x3_test, 
	x2 => x2_test, 
	x1 => x1_test, 
	x0 => x0_test, 
	max => max_test, 
	min=>min_test, 
	even=>even_test, 
	lo3=>lo3_test, 
	noBCD => noBCD_test);
  
  -- Now define a process to apply some stimulus over time...
  process
    constant PERIOD: time := 40 ns;
  begin
    x3_test <= '0'; x2_test <= '0'; x1_test <= '0'; x0_test <= '0'; 
    wait for PERIOD;
    x3_test <= '0'; x2_test <= '0'; x1_test <= '0'; x0_test <= '1'; 
    wait for PERIOD;
    x3_test <= '0'; x2_test <= '0'; x1_test <= '1'; x0_test <= '0'; 
    wait for PERIOD;
    x3_test <= '0'; x2_test <= '0'; x1_test <= '1'; x0_test <= '1'; 
    wait for PERIOD;

    x3_test <= '0'; x2_test <= '1'; x1_test <= '0'; x0_test <= '0'; 
    wait for PERIOD;
    x3_test <= '0'; x2_test <= '1'; x1_test <= '0'; x0_test <= '1'; 
    wait for PERIOD;
    x3_test <= '0'; x2_test <= '1'; x1_test <= '1'; x0_test <= '0'; 
    wait for PERIOD;
    x3_test <= '0'; x2_test <= '1'; x1_test <= '1'; x0_test <= '1'; 
    wait for PERIOD;

    x3_test <= '1'; x2_test <= '0'; x1_test <= '0'; x0_test <= '0'; 
    wait for PERIOD;
    x3_test <= '1'; x2_test <= '0'; x1_test <= '0'; x0_test <= '1'; 
    wait for PERIOD;
    x3_test <= '1'; x2_test <= '0'; x1_test <= '1'; x0_test <= '0'; 
    wait for PERIOD;
    x3_test <= '1'; x2_test <= '0'; x1_test <= '1'; x0_test <= '1'; 
    wait for PERIOD;

    x3_test <= '1'; x2_test <= '1'; x1_test <= '0'; x0_test <= '0'; 
    wait for PERIOD;
    x3_test <= '1'; x2_test <= '1'; x1_test <= '0'; x0_test <= '1'; 
    wait for PERIOD;
    x3_test <= '1'; x2_test <= '1'; x1_test <= '1'; x0_test <= '0'; 
    wait for PERIOD;
    x3_test <= '1'; x2_test <= '1'; x1_test <= '1'; x0_test <= '1'; 
    wait for PERIOD;

    -- put breakpoint to line below
    wait for PERIOD;    
  end process;  
end stimulus;





