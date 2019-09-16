----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2019 09:27:28
-- Design Name: 
-- Module Name: BCDcheck4 - Beteende
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description:  Part 1b)
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;

entity BCDcheck4 is
  port(x : in std_logic_vector(3 downto 0);
       max, min, even, lo3, noBCD, hieq3 : out std_logic);
end entity BCDcheck4;


architecture beteende of BCDcheck4 is
Signal lo3_sig, noBCD_sig : std_logic;
begin
  lo3_sig   <= '1' when (x >= X"0") and (x < X"3") else '0';

  max   <= '1' when x = X"9" else '0';
  min   <= '1' when x = X"0" else '0';
  even  <= not x(0);
  lo3   <= lo3_sig;
  noBCD <= noBCD_sig;
  hieq3 <= '1' when lo3_sig = '0' and noBCD_sig = '0' else '0';
  
  noBCD_sig <= '1' when (x > X"9") and (x <= X"F") else '0';
end architecture beteende;
