----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 06.05.2019 13:45:29
-- Design Name: 
-- Module Name: 32BitALU - Behavioral
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

entity ALU_32Bit is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Op : in STD_LOGIC_VECTOR (2 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC);
end ALU_32Bit;

architecture Behavioral of ALU_32Bit is
    
    component LogicUnit port (
        A, B : in STD_LOGIC_VECTOR(31 downto 0);
        and_out, or_out : out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component Arith_32Bit port ( 
        A, B : in STD_LOGIC_VECTOR (31 downto 0);
        SUB : in STD_LOGIC;
        C_out, V : out STD_LOGIC;
        R : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component ZeroExtend port (
        MSB : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component MUX_32bit port (
        A, B, C, D : in STD_LOGIC_VECTOR (31 downto 0);
        Op : in STD_LOGIC_VECTOR (1 downto 0);
        R : out STD_LOGIC_VECTOR (31 downto 0));
    end component;

    signal and_sig, or_sig, arith_sig, ZeroExtend_sig : STD_LOGIC_VECTOR(31 downto 0);
    signal Op_2bit : STD_LOGIC_VECTOR(1 downto 0);
    signal MSB_sig : STD_LOGIC;
    
begin
    MSB_sig <= arith_sig(31);
    Op_2bit <= Op(1) & Op(0);

    ZeroExtend_instance: ZeroExtend port map(MSB => MSB_sig, Y => ZeroExtend_sig);
    Arith_32Bit_instance: Arith_32Bit port map (A => A, B => B, SUB => Op(2), R => arith_sig);
    LogicUnit_instance: LogicUnit port map(A => A, B => B, and_out => and_sig, or_out => or_sig);
    MUX_instance: MUX_32bit port map(A => and_sig, B => or_sig, C => Arith_sig, D => ZeroExtend_sig, Op => Op_2bit, R => R);
         
    Z <= '1' when (Op = B"111" and A = B and Op(2) = '1') else '0';

end Behavioral;
