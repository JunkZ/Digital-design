----------------------------------------------------------------------------------
-- Company:  LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 30.04.2019 13:19:58
-- Design Name: 
-- Module Name: PLDcellC_td - Stimulus
-- Project Name: Lab 2
-- Target Devices: 
-- Tool Versions: 
-- Description: Part 4
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

entity PLDcellD_tb is
end entity;

architecture Stimulus of PLDcellD_tb is
    component PLDcellD
        port  (X: in STD_LOGIC_VECTOR(3 downto 0);
               Y : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
  
    signal X_test : STD_LOGIC_VECTOR(3 downto 0);
    signal Y : STD_LOGIC_VECTOR(3 downto 0);
begin

    PLDcellD_instance: PLDcellD port map( 
        X => X_test, 
        Y => Y 
	);
  
    -- A process to apply some stimulus over time...
    process
        constant PERIOD: time := 40 ns;
    begin
        
        X_test <= "0000";
        wait for PERIOD;
        
        X_test <= "0001";
        wait for PERIOD;
        
        X_test <= "0010";
        wait for PERIOD;
        
        X_test <= "0011";
        wait for PERIOD;
        
        X_test <= "0100";
        wait for PERIOD;
        
        X_test <= "0101";
        wait for PERIOD;
        
        X_test <= "0110";
        wait for PERIOD;
        
        X_test <= "0111";
        wait for PERIOD;
        
        X_test <= "1000";
        wait for PERIOD;
        
        X_test <= "1001";
        wait for PERIOD;
    
        -- stimulus runtime: 400 ns
        wait for PERIOD;
    end process;  
end stimulus;