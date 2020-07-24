----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 29.04.2019 13:35:44
-- Design Name: 
-- Module Name: Part1_tb - Behavioral
-- Project Name: Lab 3a
-- Target Devices: 
-- Tool Versions: 
-- Description:  part 1
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Revision 0.02 - Renamed in- and outputs
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           C_in : in STD_LOGIC;
           R : out STD_LOGIC_VECTOR(3 downto 0);
           V : out STD_LOGIC;
           C_out : out STD_LOGIC);
end Adder;

architecture Behavioral of Adder is
    
    component FullAdder port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        C_in : in STD_LOGIC;
        R :  out STD_LOGIC;
        C_out :  out STD_LOGIC
    );
    end component;
    
    --signal s : STD_LOGIC_VECTOR(3 downto 0);
    signal C0, C1, c2, c3 : STD_LOGIC;
begin
    
    FullAdder_instance0: Fulladder port map (
        A => A(0),
        B => B(0),
        C_in => C_in, 
        R => R(0),
        C_out => C0
    );
    
    FullAdder_instance1: Fulladder port map (
        A => A(1),
        B => B(1),
        C_in => C0, 
        R => R(1),
        C_out => C1
    );
    
    FullAdder_instance2: Fulladder port map (
        A => A(2),
        B => B(2),
        C_in => C1, 
        R => R(2),
        C_out => C2
    );
    
    FullAdder_instance3: Fulladder port map (
        A => A(3),
        B => B(3),
        C_in => C2, 
        R => R(3),
        C_out => C3
    );
    
    V <= c2 xor c3;
    C_out <= c3;

end Behavioral;
