----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 07.05.2019 14:25:00
-- Design Name: 
-- Module Name: PCPlus4 - Behavioral
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

entity PCPlus4 is
    Port ( Clk : in STD_LOGIC;
           RESET : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (31 downto 0));
end PCPlus4;

architecture Behavioral of PCPlus4 is
    
    component Register_32bit is
        Port(Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (31 downto 0);
           Q : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component Adder_32Bit is
        Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C_in : in STD_LOGIC;
           R : out STD_LOGIC_VECTOR (31 downto 0);
           V : out STD_LOGIC;
           C_out : out STD_LOGIC);
   end component;
   
   signal Q_input, Q_output : STD_LOGIC_VECTOR(31 downto 0);
   
begin
    Register_32bit_instance: Register_32bit port map(
        Clk => Clk,
        Reset => Reset,
        D => Q_input,
        Q => Q_output);
    
    Adder_32Bit_instance: Adder_32Bit port map(
        A => X"00000004",
        B => Q_output,
        C_in => '0',
        R => Q_input);

    Q <= Q_output;

end Behavioral;
