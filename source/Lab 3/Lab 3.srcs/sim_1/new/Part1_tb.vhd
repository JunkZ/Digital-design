----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 29.04.2019 13:35:44
-- Design Name: 
-- Module Name: Part1_tb - Behavioral
-- Project Name: Lab 3a
-- Target Devices: 
-- Tool Versions: 
-- Description:  part 1
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


entity Adder_tb is
end Adder_tb;

architecture Behavioral of Adder_tb is
    component Adder is
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           C_in : in STD_LOGIC;
           R : out STD_LOGIC_VECTOR(3 downto 0);
           V : out STD_LOGIC;
           C_out : out STD_LOGIC);
    end component Adder;
    
    signal A, B, R : STD_LOGIC_VECTOR(3 downto 0); 
    signal C_in, V, C_out : STD_LOGIC;
begin

    Adder_instance: Adder port map ( A => A, B => B, C_in => C_in, R => R, V => V, C_out => C_out);
    
    process
        constant PERIOD: time := 40 ns;
        
    begin
        C_in <= '0';
    
        A <= "0100";
        B <= "0011";
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
        
        -- Stimulus time: 320ns
    end process;
end Behavioral;
