--  BCDcheck2
--  Indikerar egenskaper hos siffror i BCD-kod
--  2001-07-04
--  Lars-H Hemert

library IEEE;
use IEEE.std_logic_1164.all;

entity BCDcheck2 is
  port(x : in std_logic_vector(3 downto 0);
       max, min, even, lo3, noBCD : out std_logic);
end entity BCDcheck2;


architecture beteende of BCDcheck2 is
begin
  max   <= '1' when x = X"9" else '0';
  min   <= '1' when x = X"0" else '0';
  even  <= not x(0);
  lo3   <= '1' when (x >= X"0") and (x < X"3") else '0';
  noBCD <= '1' when (x > X"9") and (x <= X"F") else '0';
end architecture beteende;


