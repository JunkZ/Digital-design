----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2019 15:18:18
-- Design Name: 
-- Module Name: MUX_5bit_2to1 - Behavioral
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

entity MUX_5bit_2to1 is
    Port ( A, B : in STD_LOGIC_VECTOR (4 downto 0);
           Op : in STD_LOGIC;
           R : out STD_LOGIC_VECTOR (4 downto 0));
end MUX_5bit_2to1;

architecture Behavioral of MUX_5bit_2to1 is
begin

     R <= A when Op = '0' else B;
    
end Behavioral;