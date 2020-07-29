----------------------------------------------------------------------------------
-- Company:  LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 26.04.2019 09:23:17
-- Design Name: 
-- Module Name: PLDcellB - PLDcell
-- Project Name:  Lab 2
-- Target Devices: 
-- Tool Versions: 
-- Description: Part 3 b)
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PLDcellB is
    Port ( a_in : in STD_LOGIC;
           b_in : in STD_LOGIC;
           c_in : in STD_LOGIC;
           d_in : in STD_LOGIC;
           f_out : out STD_LOGIC);
end PLDcellB;

architecture PLDcell of PLDcellB is
    
    -- create instance of a PLDcellA
    component PLDcellA
        port  (x0, x1, x2, x3, x4, x5, inv : in STD_LOGIC;
               y : out STD_LOGIC);
    end component;
    
    signal a, b, c, d : STD_LOGIC;
    signal not_a, not_c : STD_LOGIC; -- inverses of IN a and c
    signal f : STD_LOGIC; -- OUT signal
    
begin

    PLDcellA_instance: PLDcellA port map (
        x0 => not_a,
        x1 => not_c,
        x2 => d,
        x3 => a,
        x4 => c,
        x5 => '1',
        inv => '1',
        y => f
    );

    a <= a_in;
    b <= b_in;
    c <= c_in;
    d <= d_in;
    not_a <= not a_in;
    not_c <= not c_in;
    f_out <= f;
    
end PLDcell;
