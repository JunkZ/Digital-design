----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2019 15:25:44
-- Design Name: 
-- Module Name: DataMemory_tb - Stimulus
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

entity DataMemory_tb is
end DataMemory_tb;

architecture Stimulus of DataMemory_tb is
    component DataMemory is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           MemWe : in STD_LOGIC;
           Adress : in STD_LOGIC_VECTOR (31 downto 0);
           DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    signal Clk, Reset, MemWe : STD_LOGIC;
    signal Adress, DataIn, DataOut : STD_LOGIC_VECTOR(31 downto 0);
begin
    
    DataMemory_instance: DataMemory port map (Clk => Clk, Reset => Reset, MemWe => MemWe, Adress => Adress, DataIn => DataIn, DataOut => DataOut);
    
    process
        constant PERIOD: time := 40ns;
    begin
        -- clock HIGH after 40 ns,
        Clk <= '0';
        Reset <= '1';
        wait for PERIOD;
        Reset <= '0';
        
        Clk <= '1';
        MemWe <= '1';
        Adress <= X"00000001";
        DataIn <= X"00000010";
        wait for period;
        Clk <= '0';
        wait for period;
        
        
        Clk <= '1';
        Adress <= X"10000000";
        MemWe <= '0';
        wait for period;
        MemWe <= '1';
        wait for period;
        Adress <= X"00000001";
        MemWe <= '0';
        wait for period;
        
    end process;

end Stimulus;
