----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: RIckard Bemm
-- 
-- Create Date: 07.05.2019 14:36:59
-- Design Name: 
-- Module Name: Dlatch - Behavioral
-- Project Name: Lab 3b
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

entity Dlatch is
    Port ( Clk : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
end Dlatch;

architecture Behavioral of Dlatch is
    signal Q_bar, Q_bar_prev, Q_prev : STD_LOGIC;
    signal R, S : STD_LOGIC;
begin

    process (Clk)
    begin
        R <= Clk and not D;
        S <= Clk and D;
        Q_prev <= R nor Q_bar;
        Q_bar_prev <= S nor Q_prev;
    end process;
    
    Q <= Q_prev;
    Q_bar <= Q_bar_prev;

end Behavioral;
