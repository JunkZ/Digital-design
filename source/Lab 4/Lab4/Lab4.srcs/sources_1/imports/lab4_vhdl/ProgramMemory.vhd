----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2019 10:51:49 AM
-- Design Name: 
-- Module Name: PCPlus4 - Behavioral
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

entity InstructionMemory is
    Port ( Adress: in STD_LOGIC_VECTOR(31 downto 0);
           Instruction : out STD_LOGIC_VECTOR(31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is

begin

with Adress select Instruction <= "00100000001000001111111111111000" when X"00000000",  --addi r0,r1,-8
     "00100000010000010000000000000011" when X"00000004",  --addi r1,r2,3
     "00000000000000010001000000100000" when X"00000008",  --add r2,r0,r1
     "00000000001000000001100000100010" when X"0000000c",  --sub r3,r1,r0    
     "00000000010000110010000000101010" when X"00000010",  --slt r4,r2,r3    
     "00101000010001001111111111110111" when X"00000014",  --slti r4,r2,-9    
     "00000000010000110010000000101010" when X"00000018",  --slt r4,r2,r3    
     "00000000100001100010100000100101" when X"0000001c",  --or  r5,r4,r6    
     "00000000101000010011000000100100" when X"00000020",  --and r6,r5,r1
     "11111100001000000000000000000001" when others;

end Behavioral;


