----------------------------------------------------------------------------------
-- Company:  LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 26.04.2019 09:23:17
-- Design Name: 
-- Module Name: PLDcellA - PLDcell
-- Project Name: Lab 2
-- Target Devices: 
-- Tool Versions: 
-- Description: Part 3 a) 
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

entity PLDcellA is
    Port ( x0 : in STD_LOGIC;
           x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           x3 : in STD_LOGIC;
           x4 : in STD_LOGIC;
           x5 : in STD_LOGIC;
           inv : in STD_LOGIC;
           y : out STD_LOGIC);
end PLDcellA;

architecture PLDcell of PLDcellA is

    signal and0, and1, or0 : STD_LOGIC;
    
begin

    and0 <= x0 and x1 and x2;
    and1 <= x3 and x4 and x5;
    or0 <= and0 or and1;
    y <= or0 xor inv;

end PLDcell;
