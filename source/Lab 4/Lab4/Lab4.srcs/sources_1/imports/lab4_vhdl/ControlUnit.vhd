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
           Z : in STD_LOGIC;
           WE : out STD_LOGIC;
           ALUControl : out STD_LOGIC_VECTOR (2 downto 0);
           RegDestination : out STD_LOGIC;
           ALUSource : out STD_LOGIC);
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

    
    process (OpCode, Funct) begin
        WE <= '1';
        if OpCode = B"000000" and Funct = B"100100" then -- AND
            ALUControl <= B"000";
            RegDestination <= '1';
            ALUSource <= '0';
        elsif OpCode = B"000000" and Funct = B"100101" then -- OR
            ALUControl <= B"001";
            RegDestination <= '1';
            ALUSource <= '0';
        elsif OpCode = B"000000" and Funct = B"100000" then -- ADD
            ALUControl <= B"010";
            RegDestination <= '1';
            ALUSource <= '0';
        elsif OpCode = B"001000" then -- ADDI
            ALUControl <= B"010";
            RegDestination <= '0';
            ALUSource <= '1';
        elsif OpCode = B"000000" and Funct = B"100010" then -- SUB
            ALUControl <= B"110";
            RegDestination <= '1';
            ALUSource <= '0';
        elsif OpCode = B"000000" and Funct = B"101010" then -- SLT
            ALUControl <= B"111";
            RegDestination <= '1';
            ALUSource <= '0';
        elsif OpCode = B"001010" then -- SLTI
            ALUControl <= B"111";
            RegDestination <= '0';
            ALUSource <= '1';
        else
            WE <= '0';
            ALUControl <= B"111";
            RegDestination <= '0';
            ALUSource <= '1';
        end if;
    end process;

end Behavioral;
