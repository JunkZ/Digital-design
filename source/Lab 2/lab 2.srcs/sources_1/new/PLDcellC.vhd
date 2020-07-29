----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 26.04.2019 10:57:40
-- Design Name: 
-- Module Name: PLDcellC - PDcell
-- Project Name: Lab 2
-- Target Devices: 
-- Tool Versions: 
-- Description: Part 3 c)
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

entity PLDcellC is
    Port ( a_in : in STD_LOGIC;
           b_in : in STD_LOGIC;
           c_in : in STD_LOGIC;
           d_in : in STD_LOGIC;
           e_in : in STD_LOGIC;
           g_out : out STD_LOGIC);
end PLDcellC;

architecture PDcell of PLDcellC is

    component PLDcellA
        port (x0, x1, x2, x3, x4, x5, inv : in STD_LOGIC;
              y : out STD_LOGIC);
    end component;
    
    signal not_a, not_b, not_c : STD_LOGIC;
    signal ABC_and : STD_LOGIC;
begin
    
    PLDcell_left: PLDcellA port map (
        x0 => a_in,
        x1 => b_in,
        x2 => c_in,
        x3 => '0',
        x4 => '0',
        x5 => '0',
        inv => '0',
        y => ABC_and
    );
    
    PLDcell_right: PLDcellA port map (
        x0 => not_a,
        x1 => not_b,
        x2 => not_c,
        x3 => d_in,
        x4 => e_in,
        x5 => ABC_and,
        inv => '0',
        y => g_out
    );
    
    not_a <= not a_in;
    not_b <= not b_in;
    not_c <= not c_in;

end PDcell;
