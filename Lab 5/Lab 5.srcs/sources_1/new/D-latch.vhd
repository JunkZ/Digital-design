----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2019 08:49:18
-- Design Name: 
-- Module Name: D-latch - Behavioral
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

entity D_latch is
    Port ( Clk : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (0 downto 0);
           Q : out STD_LOGIC_VECTOR (31 downto 0));
end D_latch;

architecture Behavioral of D_latch is

begin

    process (Clk)
    begin
        
    end process;

end Behavioral;
