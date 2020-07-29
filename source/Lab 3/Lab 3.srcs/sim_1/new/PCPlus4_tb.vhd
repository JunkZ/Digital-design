----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 07.05.2019 14:25:00
-- Design Name: 
-- Module Name: PCPlus4_tb - Stimulus
-- Project Name: Lab 3b
-- Target Devices: 
-- Tool Versions: 
-- Description: Part 2
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

entity PCPlus4_tb is
end PCPlus4_tb;

architecture Stimulus of PCPlus4_tb is
    component PCPlus4 is 
        Port ( Clk : in STD_LOGIC;
           RESET : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal Clk_test, Reset_test : STD_LOGIC;
    signal Q_out : STD_LOGIC_VECTOR (31 downto 0);
begin
    
    PLPlus4_instance: PCPlus4 port map(Clk => Clk_test, Reset => Reset_test, Q => Q_out);
    
    process
        constant PERIOD: time := 40ns;
    begin
        Reset_test <= '1';
        wait for PERIOD;
        
        Reset_test <= '0';
        Clk_test <= '0';
        wait for PERIOD;
        
        for i in 0 to 32 loop
            Clk_test <= not Clk_test;
            wait for PERIOD;
        end loop;
        
        --runtime: 1360ns
    end process;
end Stimulus;
