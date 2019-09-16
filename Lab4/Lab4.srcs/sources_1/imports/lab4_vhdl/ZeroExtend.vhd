----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 07.05.2019 13:44:16
-- Design Name: 
-- Module Name: ZeroExtend - Behavioral
-- Project Name:  Lab 3b
-- Target Devices: 
-- Tool Versions: 
-- Description: Part 1
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

entity ZeroExtend is
    Port ( MSB : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(31 downto 0));
end ZeroExtend;

architecture Behavioral of ZeroExtend is
    
begin

    Y <= B"0000000000000000000000000000000" & MSB;

end Behavioral;
