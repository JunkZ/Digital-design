----------------------------------------------------------------------------------
-- Company:  LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 03.05.2019 14:48:12
-- Design Name: 
-- Module Name: LogicUnit_tb - Stimulus
-- Project Name: Lab 3a
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

entity LogicUnit_tb is
end LogicUnit_tb;

architecture Stimulus of LogicUnit_tb is
    component LogicUnit is
        Port ( A, B : in STD_LOGIC_VECTOR(3 downto 0);
            Op : in STD_LOGIC_VECTOR(1 downto 0);
            R : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    signal A_test, B_test, R : STD_LOGIC_VECTOR(3 downto 0);
    signal Op_test : STD_LOGIC_VECTOR(1 downto 0);
begin

    LogicUnit_instance: LogicUnit Port map(A => A_test, B => B_test, Op => Op_test, R => R);

    process
        constant PERIOD: time := 40ns;
    begin
        A_test <= B"0000";
        B_test <= B"0000";
        Op_test <= B"00";
        wait for period;
        
        A_test <= B"0101";
        B_test <= B"0001";
        Op_test <= B"01";
        wait for period;
        
        A_test <= B"0001";
        B_test <= B"0111";
        Op_test <= B"11";
        wait for period;
        
        A_test <= B"0101";
        B_test <= B"0011";
        Op_test <= B"10";
        wait for period;
        
        A_test <= B"0011";
        B_test <= B"1001";
        Op_test <= B"01";
        wait for period;
        
        A_test <= B"0111";
        B_test <= B"0001";
        Op_test <= B"00";
        wait for period;
        
    end process;
end Stimulus;
