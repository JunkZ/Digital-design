----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2019 10:56:23
-- Design Name: 
-- Module Name: PLDcell - Behavioral
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

entity PLDcell is
Port ( x5, x4, x3, x2, x1, x0, inv : in STD_LOGIC;
       y : out STD_LOGIC);
end PLDcell;

architecture Beteende of PLDcell is
begin
  
  y <= ((x5 and x4 and x3) or (x2 and x1 and x0)) xor inv;

end Beteende;
