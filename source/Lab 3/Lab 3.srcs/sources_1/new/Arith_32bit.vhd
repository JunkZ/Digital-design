----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 13.05.2019 13:49:58
-- Design Name: 
-- Module Name: Arith_32bit - Behavioral
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

entity Arith_32bit is
    Port ( A, B : in STD_LOGIC_VECTOR (31 downto 0);
           SUB : in STD_LOGIC;
           C_out, V : out STD_LOGIC;
           R : out STD_LOGIC_VECTOR (31 downto 0));
end Arith_32bit;

architecture Behavioral of Arith_32bit is

    component Adder_32bit port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C_in : in STD_LOGIC;
           R : out STD_LOGIC_VECTOR (31 downto 0);
           C_out, V : out STD_LOGIC);
    end component;

    signal b_sub : STD_LOGIC_VECTOR(31 downto 0);
    --signal C_out_sig : STD_LOGIC;
begin

    arith: for i in 0 to 31 generate
        B_sub(i) <= B(i) xor SUB;
    end generate;
    
    Adder_instance: Adder_32bit port map(
            A      => A,
            B      => B_sub,
            C_in   => SUB,
            R      => R,
            V      => V,
            C_out  => C_out);

    
end Behavioral;
