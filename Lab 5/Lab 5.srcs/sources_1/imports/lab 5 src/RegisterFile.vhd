----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 13.05.2019 15:20:06
-- Design Name: 
-- Module Name: RegisterFile - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity RegisterFile is
    Port ( RA1, RA2, RA3 : in STD_LOGIC_VECTOR (4 downto 0);
           WD : in STD_LOGIC_VECTOR (31 downto 0);
           WE : in STD_LOGIC;
           Clk, Reset : in STD_LOGIC;
           RD1, RD2 : out STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

    component Register_32bit is
    port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (31 downto 0);
           Q : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

    type ram is array (31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
    signal memory : ram;
begin

    process(Clk, Reset) begin
        if Reset = '1' then
            memory <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if WE = '1' then
                memory(conv_integer(RA3)) <= WD;
            end if;
        end if;
    end process;
    
    RD1 <= memory(conv_integer(RA1));
    RD2 <= memory(conv_integer(RA2));
end Behavioral;
