----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2019 13:49:54
-- Design Name: 
-- Module Name: MIPS_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

entity MIPS_tb is
end MIPS_tb;

architecture Behavioral of MIPS_tb is

    component MIPS is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC);
    end component;

    signal Clk, Reset : STD_LOGIC;

begin

    MIPS_instance: MIPS port map (Clk => Clk, Reset => Reset);
    
    
    
    process 
        constant period: time := 40ns;
    begin
        Reset <= '1';
        wait for Period;
        Reset <= '0';
        
        Clk <= '1';
        wait for PERIOD;
        Clk <= '0';
        wait for PERIOD;
        
        Clk <= '1';
        wait for PERIOD;
        Clk <= '0';
        wait for PERIOD;
        
        Clk <= '1';
        wait for PERIOD;
        Clk <= '0';
        wait for PERIOD;
        
        Clk <= '1';
        wait for PERIOD;
        Clk <= '0';
        wait for PERIOD;
        
        Clk <= '1';
        wait for PERIOD;
        Clk <= '0';
        wait for PERIOD;
        
        Clk <= '1';
        wait for PERIOD;
        Clk <= '0';
        wait for PERIOD;
        
        Clk <= '1';
        wait for PERIOD;
        Clk <= '0';
        wait for PERIOD;
        
        Clk <= '1';
        wait for PERIOD;
        Clk <= '0';
        wait for PERIOD;
        
        Clk <= '1';
        wait for PERIOD;
        Clk <= '0';
        wait for PERIOD;
        
        Clk <= '1';
        wait for PERIOD;
        Clk <= '0';
        wait for PERIOD;
        
        Clk <= '1';
        wait for PERIOD;
        Clk <= '0';
        wait for PERIOD;
        
    end process;

end Behavioral;
