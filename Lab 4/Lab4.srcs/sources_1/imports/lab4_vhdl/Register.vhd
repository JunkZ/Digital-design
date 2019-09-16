----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 07.05.2019 22:06:48
-- Design Name: 
-- Module Name: Register - Behavioral
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

entity Register_32bit is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (31 downto 0);
           Q : out STD_LOGIC_VECTOR (31 downto 0));
end Register_32bit;

architecture Behavioral of Register_32bit is

begin

    process(Clk, Reset)
    begin
        if Reset = '1' then
            Q <= X"00000000";
        elsif rising_edge(Clk) then
            Q <= D;
        end if;
    
    end process;

end Behavioral;
