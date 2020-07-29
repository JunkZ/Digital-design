----------------------------------------------------------------------------------
-- Company:  LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 25.04.2019 10:09:02
-- Design Name: 
-- Module Name: SOPcomponent_td - Beteende
-- Project Name: Lab 2
-- Target Devices: 
-- Tool Versions: 
-- Description: Part 3
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SOPcomponent_tb is
end SOPcomponent_tb;

architecture Stimulus of SOPcomponent_tb is
    component SOPcomponent
        port  (a, b, c, d : in STD_LOGIC;
               f : out STD_LOGIC);
    end component;
  
    component PLDcellB
        port (a_in, b_in, c_in, d_in : in STD_LOGIC;
              f_out : out STD_LOGIC);
    end component;
  
    signal a_test, b_test, c_test, d_test : STD_LOGIC;
    signal f, y: STD_LOGIC;
  
begin

    SOPcomponent_instance: SOPcomponent port map( 
        a => a_test, 
        b => b_test, 
        c => c_test, 
        d => d_test, 
        f => f
	);
	
    PLDcellB_instance: PLDcellB port map(
        a_in => a_test, 
        b_in => b_test, 
        c_in => c_test, 
        d_in => d_test,
        f_out => y
    );
  
    -- Now define a process to apply some stimulus over time...
    process
        constant PERIOD: time := 40 ns;
    begin
        a_test <= '0'; b_test <= '0'; c_test <= '0'; d_test <= '0'; 
        wait for PERIOD;
        a_test <= '0'; b_test <= '0'; c_test <= '0'; d_test <= '1'; 
        wait for PERIOD;
        a_test <= '0'; b_test <= '0'; c_test <= '1'; d_test <= '0'; 
        wait for PERIOD;
        a_test <= '0'; b_test <= '0'; c_test <= '1'; d_test <= '1'; 
        wait for PERIOD;
    
        a_test <= '0'; b_test <= '1'; c_test <= '0'; d_test <= '0'; 
        wait for PERIOD;
        a_test <= '0'; b_test <= '1'; c_test <= '0'; d_test <= '1'; 
        wait for PERIOD;
        a_test <= '0'; b_test <= '1'; c_test <= '1'; d_test <= '0'; 
        wait for PERIOD;
        a_test <= '0'; b_test <= '1'; c_test <= '1'; d_test <= '1'; 
        wait for PERIOD;
    
        a_test <= '1'; b_test <= '0'; c_test <= '0'; d_test <= '0'; 
        wait for PERIOD;
        a_test <= '1'; b_test <= '0'; c_test <= '0'; d_test <= '1'; 
        wait for PERIOD;
        a_test <= '1'; b_test <= '0'; c_test <= '1'; d_test <= '0'; 
        wait for PERIOD;
        a_test <= '1'; b_test <= '0'; c_test <= '1'; d_test <= '1'; 
        wait for PERIOD;
    
        a_test <= '1'; b_test <= '1'; c_test <= '0'; d_test <= '0'; 
        wait for PERIOD;
        a_test <= '1'; b_test <= '1'; c_test <= '0'; d_test <= '1'; 
        wait for PERIOD;
        a_test <= '1'; b_test <= '1'; c_test <= '1'; d_test <= '0'; 
        wait for PERIOD;
        a_test <= '1'; b_test <= '1'; c_test <= '1'; d_test <= '1'; 
        wait for PERIOD;
    
        -- put breakpoint to line below
        wait for PERIOD;
    end process;  
end stimulus;
