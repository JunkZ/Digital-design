----------------------------------------------------------------------------------
-- Company: LTU
-- Engineer: Rickard Bemm
-- 
-- Create Date: 13.05.2019 14:52:21
-- Design Name: 
-- Module Name: MIPS - Behavioral
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

entity MIPS is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC);
end MIPS;

architecture Behavioral of MIPS is
    
    component ALU_32Bit is
    port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Op : in STD_LOGIC_VECTOR (2 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0);
           Z : out STD_LOGIC);
    end component;
    
    component PCPlus4 is
    port ( Clk : in STD_LOGIC;
           RESET : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component MUX_32bit is
    port ( A, B, C, D : in STD_LOGIC_VECTOR (31 downto 0);
           Op : in STD_LOGIC_VECTOR (1 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component MUX_32bit_2to1 is
    port ( A, B : in STD_LOGIC_VECTOR (31 downto 0);
           Op : in STD_LOGIC;
           R : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component MUX_5bit_2to1 is
    port ( A, B : in STD_LOGIC_VECTOR (4 downto 0);
           Op : in STD_LOGIC;
           R : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    component InstructionMemory is
    port ( Adress: in STD_LOGIC_VECTOR(31 downto 0);
           Instruction : out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    component SignExtend is
    port ( I : in STD_LOGIC_VECTOR (15 downto 0);
           E : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component RegisterFile is
    port ( RA1, RA2, RA3 : in STD_LOGIC_VECTOR (4 downto 0);
           WD : in STD_LOGIC_VECTOR (31 downto 0);
           WE : in STD_LOGIC;
           Clk, Reset : in STD_LOGIC;
           RD1, RD2 : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component ControlUnit is 
    port ( OpCode : in STD_LOGIC_VECTOR (5 downto 0);
           Funct : in STD_LOGIC_VECTOR (5 downto 0);
           Z : in STD_LOGIC;
           WE : out STD_LOGIC;
           ALUControl : out STD_LOGIC_VECTOR (2 downto 0);
           RegDestination : out STD_LOGIC;
           ALUSource : out STD_LOGIC);
    end component;
    
    -- ALU signals
    signal ALU_A, ALU_B : STD_LOGIC_VECTOR (31 downto 0);
    signal Z : STD_LOGIC;
    
    signal sign_extend : STD_LOGIC_VECTOR (31 downto 0);
    
    -- Register File signals
    signal Register_WD, RD2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ALUControl: STD_LOGIC_VECTOR (2 downto 0);
    signal RA3 : STD_LOGIC_VECTOR (4 downto 0);
    signal Register_WE, Register_Destination, ALUSource : STD_LOGIC;
    
    -- Instruction signals
    signal InstructionMem_out, InstructionMem_in : STD_LOGIC_VECTOR (31 downto 0);
    signal IMem_25_21, IMem_20_16, IMem_15_11 : STD_LOGIC_VECTOR (4 downto 0);
    signal Imem_31_26, IMem_5_0 : STD_LOGIC_VECTOR(5 downto 0);
    signal IMem_15_0 : STD_LOGIC_VECTOR (15 downto 0);
begin
    
    IMem_31_26 <= InstructionMem_out(31 downto 26);
    IMem_25_21 <= InstructionMem_out(25 downto 21);
    IMem_20_16 <= InstructionMem_out(20 downto 16);
    IMem_15_11 <= InstructionMem_out(15 downto 11);
    IMem_15_0 <= InstructionMem_out(15 downto 0);
    IMem_5_0 <= InstructionMem_out(5 downto 0);
    
    ALU_32bit_instance: ALU_32bit port map(A => ALU_A, B => ALU_B, OP => ALUControl, R => Register_WD, Z => Z); -- Add z later
    ControlUnit_instance: ControlUnit port map (OpCode => IMem_31_26, Funct => IMem_5_0, Z => Z, WE => Register_WE,
        ALUControl => ALUControl, RegDestination => Register_Destination, ALUSource => ALUSource);
    InstructionMemory_instance: InstructionMemory port map (Adress => InstructionMem_in, Instruction => InstructionMem_out);
    MUX_32bit_instance: MUX_32bit_2to1 port map(A => RD2, B => sign_extend, Op => ALUSource, R => ALU_B);
    MUX_5bit_instance: MUX_5bit_2to1 port map (A => Imem_20_16, B => IMem_15_11, Op => Register_Destination, R => RA3);
    RegisterFile_instance: RegisterFile port map(RA1 => IMem_25_21, RA2 => IMem_20_16, RA3 => RA3, 
        WD => Register_WD, WE => Register_WE, Clk => Clk, Reset => Reset, RD1 => ALU_A, RD2 => RD2);
    PCPlus4_instance: PCPlus4 port map(Clk => Clk, Reset => Reset, Q => InstructionMem_in);
    SignExtend_instance: SignExtend port map(I => IMem_15_0, E => sign_extend);
    
end Behavioral;
