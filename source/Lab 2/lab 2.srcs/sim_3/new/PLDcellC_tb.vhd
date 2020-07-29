----------------------------------------------------------------------------------
-- Company:  LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 26.04.2019 11:19:58
-- Design Name: 
-- Module Name: PLDcellC_td - Stimulus
-- Project Name: Lab 2
-- Target Devices: 
-- Tool Versions: 
-- Description: Part 3 c)
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Revision 0.02 - Test inputs changed from static to dynamic.
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PLDcellC_tb is
end entity;

architecture Stimulus of PLDcellC_tb is
    component PLDcellC
        port  (a_in, b_in, c_in, d_in, e_in: in STD_LOGIC;
               g_out : out STD_LOGIC);
    end component;
  
    signal a_test : STD_LOGIC := '0';
    signal b_test : STD_LOGIC := '0';
    signal c_test : STD_LOGIC := '0';
    signal d_test : STD_LOGIC := '0';
    signal e_test : STD_LOGIC := '0';
    signal g_out: STD_LOGIC;
  
begin

    PLDcellC_instance: PLDcellC port map( 
        a_in => a_test, 
        b_in => b_test, 
        c_in => c_test, 
        d_in => d_test,
        e_in => e_test, 
        g_out => g_out
	);
  
    -- A process to apply some stimulus over time...
    process
        constant PERIOD: time := 40 ns;
    begin
        
        e_test <= not e_test after 1*PERIOD;
        d_test <= not d_test after 2*PERIOD;
        c_test <= not c_test after 4*PERIOD;
        b_test <= not b_test after 8*PERIOD;
        a_test <= not a_test after 16*PERIOD;
    
        -- stimulus runtime: 1280 ns
        wait for PERIOD;
    end process;  
end stimulus;