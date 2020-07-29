--  BCDcheck
--  Indikerar egenskaper hos siffror i BCD-kod

library IEEE;
use IEEE.std_logic_1164.all;

entity BCDcheck IS
  port(x3, x2, x1, x0 : in STD_LOGIC;
       max, min, even, lo3, noBCD : out STD_LOGIC);
end entity BCDcheck;
	
architecture beteende OF BCDcheck IS
begin
  max   <= x3 and not x2 and not x1 and x0;
  min   <= not x3 and not x2 and not x1 and not x0;
  even  <= not x0;
  lo3   <= (not x3 and not x2 and not x1 and not x0) or
           (not x3 and not x2 and not x1 and x0) or
           (not x3 and not x2 and x1 and not x0);
  noBCD <= (x3 and x2) or (x3 and not x2 and x1);	
end architecture beteende;
	
	
	

