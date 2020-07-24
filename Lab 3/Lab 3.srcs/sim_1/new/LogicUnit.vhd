----------------------------------------------------------------------------------
-- Company:  LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 03.05.2019 14:48:12
-- Design Name: 
-- Module Name: LogicUnit - Behavioral
-- Project Name:  Lab3a
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

entity LogicUnit is
    Port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
           and_out, or_out : out STD_LOGIC_VECTOR(31 downto 0));
end LogicUnit;

architecture Behavioral of LogicUnit is
begin

    and_out <= A and B;
    or_out <= A or B;

end Behavioral;
