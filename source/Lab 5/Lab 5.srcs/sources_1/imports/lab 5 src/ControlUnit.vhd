----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2019 13:23:43
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlUnit is
    Port ( OpCode : in STD_LOGIC_VECTOR (5 downto 0);
           Funct : in STD_LOGIC_VECTOR (5 downto 0);
           RegWE : out STD_LOGIC;
           ALUControl : out STD_LOGIC_VECTOR (2 downto 0);
           RegDestination : out STD_LOGIC;
           ALUSource : out STD_LOGIC;
           MemToReg : out STD_LOGIC;
           MemWE : out STD_LOGIC;
           Branch : out STD_LOGIC;
           Jump : out STD_LOGIC);
end ControlUnit;

architecture Behavioral of ControlUnit is

begin
    process (OpCode, Funct) begin
        if OpCode = B"000000" and Funct = B"100100" then -- AND
            ALUControl <= B"000";
            RegDestination <= '1';
            ALUSource <= '0';
            RegWE <= '1';
            MemToReg <= '0';
            MemWE <= '0';
            Branch <= '0';
            Jump <= '0';
        elsif OpCode = B"000000" and Funct = B"100101" then -- OR
            ALUControl <= B"001";
            RegDestination <= '1';
            ALUSource <= '0';
            RegWE <= '1';
            MemToReg <= '0';
            MemWE <= '0';
            Branch <= '0';
            Jump <= '0';
        elsif OpCode = B"000000" and Funct = B"100000" then -- ADD
            ALUControl <= B"010";
            RegDestination <= '1';
            ALUSource <= '0';
            RegWE <= '1';
            MemToReg <= '0';
            MemWE <= '0';
            Branch <= '0';
            Jump <= '0';
        elsif OpCode = B"001000" then -- ADDI
            ALUControl <= B"010";
            RegDestination <= '0';
            ALUSource <= '1';
            RegWE <= '1';
            MemToReg <= '0';
            MemWE <= '0';
            Branch <= '0';
            Jump <= '0';
        elsif OpCode = B"000000" and Funct = B"100010" then -- SUB
            ALUControl <= B"110";
            RegDestination <= '1';
            ALUSource <= '0';
            RegWE <= '1';
            MemToReg <= '0';
            MemWE <= '0';
            Branch <= '0';
            Jump <= '0';
        elsif OpCode = B"000000" and Funct = B"101010" then -- SLT
            ALUControl <= B"111";
            RegDestination <= '1';
            ALUSource <= '0';
            RegWE <= '1';
            MemToReg <= '0';
            MemWE <= '0';
            Branch <= '0';
            Jump <= '0';
        elsif OpCode = B"001010" then -- SLTI
            ALUControl <= B"111";
            RegDestination <= '0';
            ALUSource <= '1';
            RegWE <= '1';
            MemToReg <= '0';
            MemWE <= '0';
            Branch <= '0';
            Jump <= '0';
        elsif OpCode = B"100011" then -- LW
            ALUControl <= B"010";
            RegDestination <= '0';
            ALUSource <= '1';
            RegWE <= '1';
            MemToReg <= '1';
            MemWE <= '0';
            Branch <= '0';
            Jump <= '0';
        elsif OpCode = B"101011" then -- SW
            ALUControl <= B"010";
            RegDestination <= 'X';
            ALUSource <= '1';
            RegWE <= '0';
            MemToReg <= 'X';
            MemWE <= '1';
            Branch <= '0';
            Jump <= '0';
        elsif OpCode = B"000100" then -- BEQ
            ALUControl <= B"111";
            RegDestination <= 'X';
            ALUSource <= '0';
            RegWE <= '0';
            MemToReg <= 'X';
            MemWE <= '0';
            Branch <= '1';
            Jump <= '0';
        elsif OpCode = B"000010" then -- JUMP
            ALUControl <= B"000";
            RegDestination <= 'X';
            ALUSource <= 'X';
            RegWE <= '0';
            MemToReg <= 'X';
            MemWE <= '0';
            Branch <= '0';
            Jump <= '1';
        else
            ALUControl <= B"000";
            RegDestination <= '0';
            ALUSource <= '0';
            RegWE <= '0';
            MemToReg <= '0';
            MemWE <= '0';
            Branch <= '0';
            Jump <= '0';
        end if;
    end process;

end Behavioral;
