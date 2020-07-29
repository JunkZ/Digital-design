----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2019 09:51:25
-- Design Name: 
-- Module Name: SOPcomponent - Beteende
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

entity SOPcomponent is
    Port ( a, b, c, d : in STD_LOGIC;
           f : out STD_LOGIC);
end SOPcomponent;

architecture Beteende of SOPcomponent is
begin

  f <= (b and not c and not d) or (not a and not d)
    or (a and not c) or (not a and c);

end Beteende;
