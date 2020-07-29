----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2019 14:00:26
-- Design Name: 
-- Module Name: PLDcell_part4 - PLDcell
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

entity PLDcell_part4 is
    Port ( x0 : in STD_LOGIC;
           x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           x3 : in STD_LOGIC;
           x4 : in STD_LOGIC;
           x5 : in STD_LOGIC;
           inv : in STD_LOGIC;
           y : out STD_LOGIC);
end PLDcell_part4;

architecture PLDcell of PLDcell_part4 is
    
begin

    y <= ((x0 and x1) or (x2 and x3) or (x4 and x5)) xor inv;

end PLDcell;
