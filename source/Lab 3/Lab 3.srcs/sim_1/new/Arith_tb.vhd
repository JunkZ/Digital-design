----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.05.2019 13:47:00
-- Design Name: 
-- Module Name: Arith_tb - Stimulus
-- Project Name:  Lab 3a
-- Target Devices: 
-- Tool Versions: 
-- Description:  Part 1 arith
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


entity Arith_tb is
end Arith_tb;

architecture Stimulus of Arith_tb is
    component Arith is
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           SUB : in STD_LOGIC;
           R : out STD_LOGIC_VECTOR(3 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC);
    end component Arith;
    
    signal A, B, R : STD_LOGIC_VECTOR(3 downto 0); 
    signal SUB, C, V: STD_LOGIC;
begin

    Arith_instance: Arith port map ( A => A, B => B, SUB => SUB, R => R, V => V, C => C);

    process
        constant PERIOD: time := 40 ns;
        
    begin
        A <= "0100";
        B <= "0011";
        SUB <= '0';
        wait for PERIOD;
        
        A <= "0111";
        B <= "0010";
        SUB <= '0';
        wait for PERIOD;
    
        A <= "0111";
        B <= "0010";
        SUB <= '1';
        wait for PERIOD;
        
        A <= "0000";
        B <= "1000";
        SUB <= '1';
        wait for PERIOD;
        
        A <= "0100";
        B <= "0011";
        SUB <= '0';
        wait for PERIOD;
        
        A <= "0111";
        B <= "0010";
        wait for PERIOD;
    
        A <= "1000";
        B <= "1000";
        wait for PERIOD;
        
        A <= "1100";
        B <= "1100";
        wait for PERIOD;
        
        A <= "1000";
        B <= "0010";
        wait for PERIOD;        
        
        A <= "0001";
        B <= "1111";
        wait for PERIOD;
        
        A <= "0101";
        B <= "1011";
        wait for PERIOD;
        
        A <= "1111";
        B <= "1111";
        wait for PERIOD;
    end process;
end Stimulus;
