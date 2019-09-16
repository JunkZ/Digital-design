----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2019 17:19:49
-- Design Name: 
-- Module Name: ShiftLeft_2 - Behavioral
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

entity ShiftLeft_2 is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0));
end ShiftLeft_2;

architecture Behavioral of ShiftLeft_2 is

begin

    R <= A(29 downto 0) & "00";

end Behavioral;
