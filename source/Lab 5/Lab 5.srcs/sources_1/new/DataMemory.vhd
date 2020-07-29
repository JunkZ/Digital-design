----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2019 14:53:35
-- Design Name: 
-- Module Name: DataMemory - Behavioral
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

entity DataMemory is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           MemWe : in STD_LOGIC;
           Adress : in STD_LOGIC_VECTOR (31 downto 0);
           DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is

    type ram is array (31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
    signal memory : ram;
begin

    process(Clk, Reset) begin
        if Reset = '1' then
            memory <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if MemWe = '1' then
                if conv_integer(adress) < 32 and conv_integer(adress) >= 0 then
                    memory(conv_integer(adress)) <= DataIn;
                end if;
            end if;
        end if;
    end process;
    
    DataOut <= memory(conv_integer(adress)) when (MemWe = '0' and conv_integer(adress) < 32 and conv_integer(adress) >= 0)
            else X"00000000";

end Behavioral;
