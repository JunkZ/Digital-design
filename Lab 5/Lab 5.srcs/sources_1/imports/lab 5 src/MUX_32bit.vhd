----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 10.05.2019 09:25:48
-- Design Name: 
-- Module Name: MUX_32bit - Behavioral
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

entity MUX_32bit is
    Port ( A, B, C, D : in STD_LOGIC_VECTOR (31 downto 0);
           Op : in STD_LOGIC_VECTOR (1 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0));
end MUX_32bit;

architecture Behavioral of MUX_32bit is
begin

     R <= A when Op = B"00" else 
         B when Op = B"01" else 
         C when Op = B"10" else
         D when Op = B"11";
    
end Behavioral;
