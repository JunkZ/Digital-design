----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2019 17:35:19
-- Design Name: 
-- Module Name: ShiftLeft_26bit - Behavioral
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

entity ShiftLeft_2_26bit is
    Port ( A : in STD_LOGIC_VECTOR (25 downto 0);
           R : out STD_LOGIC_VECTOR (27 downto 0));
end ShiftLeft_2_26bit;

architecture Behavioral of ShiftLeft_2_26bit is

begin

    R <= A & "00";

end Behavioral;
