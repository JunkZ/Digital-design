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
    end component;
    
    component DataMemory is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           MemWe : in STD_LOGIC;
           Adress : in STD_LOGIC_VECTOR (31 downto 0);
           DataIn : in STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component And_unit is
        Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           R : out STD_LOGIC);
    end component;
    
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
   
   component ShiftLeft_2 is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           R : out STD_LOGIC_VECTOR (31 downto 0));
   end component;
   
   component ShiftLeft_2_26bit is
    Port ( A : in STD_LOGIC_VECTOR (25 downto 0);
           R : out STD_LOGIC_VECTOR (27 downto 0));
   end component;
    
    -- ALU signals
    signal ALU_A, ALU_B, ALU_out : STD_LOGIC_VECTOR (31 downto 0);
    signal Z : STD_LOGIC;
    
    signal sign_extend : STD_LOGIC_VECTOR (31 downto 0);
    signal shiftLeft_out : STD_LOGIC_VECTOR(31 downto 0);
    
    -- Control unit
    signal Jump, Branch, MemToReg, MemWE, ALUSource, Register_WE, Register_Destination : STD_LOGIC;
    signal ALUControl : STD_LOGIC_VECTOR(2 downto 0);
    signal PCSrc : STD_LOGIC;
    
    -- DataMemory
    signal Mem_out : STD_LOGIC_VECTOR(31 downto 0);
    
    -- Register File signals
    signal RD2, Reg_WD : STD_LOGIC_VECTOR (31 downto 0);
    signal RA3 : STD_LOGIC_VECTOR (4 downto 0);
    
    -- Instruction signals
    signal InstructionMem_out : STD_LOGIC_VECTOR (31 downto 0);
    signal IMem_25_21, IMem_20_16, IMem_15_11 : STD_LOGIC_VECTOR (4 downto 0);
    signal Imem_31_26, IMem_5_0 : STD_LOGIC_VECTOR(5 downto 0);
    signal IMem_15_0 : STD_LOGIC_VECTOR (15 downto 0);
    signal IMem_25_0 : STD_LOGIC_VECTOR (25 downto 0);
    
    -- Program Counter
    signal PC_in, PC_out, PCplus4, PCBranch, PCSrc_mux_out, PCJump : STD_LOGIC_VECTOR(31 downto 0);
    signal PCJump_27_0 : STD_LOGIC_VECTOR(27 downto 0);
begin
    
    IMem_31_26 <= InstructionMem_out(31 downto 26);
    IMem_25_21 <= InstructionMem_out(25 downto 21);
    IMem_25_0 <= InstructionMem_out(25 downto 0);
    IMem_20_16 <= InstructionMem_out(20 downto 16);
    IMem_15_11 <= InstructionMem_out(15 downto 11);
    IMem_15_0 <= InstructionMem_out(15 downto 0);
    IMem_5_0 <= InstructionMem_out(5 downto 0);
    
    PCJump <= PCplus4(31 downto 28) & PCJump_27_0;
    
    ALU_32bit_instance: ALU_32bit port map(A => ALU_A, B => ALU_B, OP => ALUControl, R => ALU_out, Z => Z);
    ControlUnit_instance: ControlUnit port map (OpCode => IMem_31_26, Funct => IMem_5_0, RegWE => Register_WE,
        ALUControl => ALUControl, RegDestination => Register_Destination, ALUSource => ALUSource, MemToReg => MemToReg,
        MemWE => MemWE, Branch => Branch, Jump => Jump);
    DataMemory_instance: DataMemory port map (Clk => Clk, Reset => Reset, MemWe => MemWE, Adress => ALU_out, DataIn => RD2, DataOut => Mem_out);
    InstructionMemory_instance: InstructionMemory port map (Adress => PC_out, Instruction => InstructionMem_out);
    MUX_32bit_ALU_instance: MUX_32bit_2to1 port map(A => RD2, B => sign_extend, Op => ALUSource, R => ALU_B);
    MUX_32bit_Mem_instance: MUX_32bit_2to1 port map(A => ALU_out, B => Mem_out, Op => MemToReg, R => Reg_WD);
    MUX_32bit_PCSrc_instance: MUX_32bit_2to1 port map(A => PCplus4, B => PCBranch, Op => PCSrc, R => PCSrc_mux_out);
    MUX_32bit_Jump_instance: MUX_32bit_2to1 port map(A => PCSrc_mux_out, B => PCJump, Op => Jump, R => PC_in);
    MUX_5bit_RegDestination_instance: MUX_5bit_2to1 port map (A => Imem_20_16, B => IMem_15_11, Op => Register_Destination, R => RA3);
    RegisterFile_instance: RegisterFile port map(RA1 => IMem_25_21, RA2 => IMem_20_16, RA3 => RA3,
        WD => Reg_WD, WE => Register_WE, Clk => Clk, Reset => Reset, RD1 => ALU_A, RD2 => RD2);
    SignExtend_instance: SignExtend port map(I => IMem_15_0, E => sign_extend);
    ShiftLeft_2_instance: ShiftLeft_2 port map (A => sign_extend, R => shiftLeft_out);
    ShiftLeft_2_26bit_instance: ShiftLeft_2_26bit port map (A => IMem_25_0, R => PCJump_27_0);
    PC_Register_32bit_instance: Register_32bit port map(Clk => Clk, Reset => Reset, D => PC_in, Q => PC_out);
    PC_Adder_32Bit_instance: Adder_32Bit port map(A => X"00000004",B => PC_out, C_in => '0', R => PCplus4);
    PCBranch_Adder_32Bit_instance: Adder_32Bit port map(A => shiftLeft_out, B => PCplus4, C_in => '0', R => PCBranch);
    PCSrc_And_unit_instanc: And_unit port map(A => Branch, B => Z, R => PCSrc);
    
end Behavioral;
