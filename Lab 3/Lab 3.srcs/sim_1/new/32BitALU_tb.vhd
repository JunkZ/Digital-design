----------------------------------------------------------------------------------
-- Company:  LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 06.05.2019 13:45:29
-- Design Name: 
-- Module Name: 32BitALU_tb - Behavioral
-- Project Name: Lab 3b
-- Target Devices: 
-- Tool Versions: 
-- Description: Part 1
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: Felaktigt svar för A-B<0 då A<B
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_32Bit_tb is
end ALU_32Bit_tb;

architecture Behavioral of ALU_32Bit_tb is
    
    component ALU_32Bit is
        Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
            B : in STD_LOGIC_VECTOR (31 downto 0);
            Op : in STD_LOGIC_VECTOR (2 downto 0);
            R : out STD_LOGIC_VECTOR(31 downto 0);
            Z : out STD_LOGIC);
    end component ALU_32Bit;

    signal A_test, B_test, R_test : STD_LOGIC_VECTOR(31 downto 0);
    signal Op_test : STD_LOGIC_VECTOR(2 downto 0);
    signal Z_test : STD_LOGIC;
begin
    
    ALU_32Bit_instance: ALU_32Bit port map(A => A_test, B => B_test, Op => Op_test, R => R_test, Z => Z_test);
    
    process
        constant PERIOD: time := 40ns;
    begin
        
        
        A_test <= B"00000000000000000001010101100110"; -- 5478
        B_test <= B"00000000000000000001010100111001"; --  5433
        
        Op_test <= B"000"; -- AND
        wait for PERIOD;
        
        Op_test <= B"001"; -- OR
        wait for PERIOD;
        
        Op_test <= B"010"; -- ADD
        wait for PERIOD;
        
        Op_test <= B"011"; -- SET ADD
        wait for PERIOD;
        
        Op_test <= B"110"; -- SUB
        wait for PERIOD;
        
        Op_test <= B"111"; -- SET SUB
        wait for PERIOD;
        
        A_test <= B"00000000000000000001010101100110"; -- 5478
        B_test <= B"00000000000000000001010101100110"; --  5478
        
        Op_test <= B"000"; -- AND
        wait for PERIOD;
        
        Op_test <= B"001"; -- OR
        wait for PERIOD;
        
        Op_test <= B"010"; -- ADD
        wait for PERIOD;
        
        Op_test <= B"011"; -- SET ADD
        wait for PERIOD;
        
        Op_test <= B"110"; -- SUB
        wait for PERIOD;
        
        Op_test <= B"111"; -- SET SUB
        wait for PERIOD;
        
        A_test <= B"00000000000000000001010101100110"; -- 5478
        B_test <= B"00000000000000000001010101100111"; --  5479
        
        Op_test <= B"000"; -- AND
        wait for PERIOD;
        
        Op_test <= B"001"; -- OR
        wait for PERIOD;
        
        Op_test <= B"010"; -- ADD
        wait for PERIOD;
        
        Op_test <= B"011"; -- SET ADD
        wait for PERIOD;
        
        Op_test <= B"110"; -- SUB
        wait for PERIOD;
        
        Op_test <= B"111"; -- SET SUB
        wait for PERIOD;
        
    end process;

end Behavioral;
