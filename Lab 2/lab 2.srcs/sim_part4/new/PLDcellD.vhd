----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 30.04.2019 10:57:40
-- Design Name: 
-- Module Name: PLDcellC - PDcell
-- Project Name: Lab 2
-- Target Devices: 
-- Tool Versions: 
-- Description: Part 4
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

entity PLDcellD is
    Port ( X: in STD_LOGIC_VECTOR(3 downto 0);
           Y : out STD_LOGIC_VECTOR(3 downto 0));
end PLDcellD;

architecture PLDcell of PLDcellD is

    component PLDcell_part4
        port (x0, x1, x2, x3, x4, x5, inv : in STD_LOGIC;
              y : out STD_LOGIC);
    end component;
    
begin
    
    PLDcell_0: PLDcell_part4 port map (
        x0 => x(0),
        x1 => '1',
        x2 => '0',
        x3 => '0',
        x4 => '0',
        x5 => '0',
        inv => '1',
        y => y(0)
    );
    
    PLDcell_1: PLDcell_part4 port map (
        x0 => x(1),
        x1 => '1',
        x2 => '0',
        x3 => '0',
        x4 => '0',
        x5 => '0',
        inv => '0',
        y => y(1)
    );
    
    PLDcell_2: PLDcell_part4 port map (
        x0 => x(2),
        x1 => '1',
        x2 => '0',
        x3 => '0',
        x4 => '0',
        x5 => '0',
        inv => x(1),
        y => y(2)
    );
    
    PLDcell_3: PLDcell_part4 port map (
        x0 => x(3),
        x1 => '1',
        x2 => x(2),
        x3 => '1',
        x4 => x(1),
        x5 => '1',
        inv => '1',
        y => y(3)
    );
    
end PLDcell;
