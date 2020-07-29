-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Fri May  3 13:13:06 2019
-- Host        : AsterixLaptop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {C:/Users/Rickard
--               Bemm/OneDrive/Dokument/Skola/Universitet/D0011E Digitalteknik/Uppgifter/lab 3/Lab
--               3.sim/sim_1/synth/func/xsim/Part1_tb_func_synth.vhd}
-- Design      : Adder
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Adder is
  port (
    A : in STD_LOGIC_VECTOR ( 3 downto 0 );
    B : in STD_LOGIC_VECTOR ( 3 downto 0 );
    C_in : in STD_LOGIC;
    R : out STD_LOGIC_VECTOR ( 3 downto 0 );
    V : out STD_LOGIC;
    C_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Adder : entity is true;
end Adder;

architecture STRUCTURE of Adder is
  signal A_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal B_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal C1 : STD_LOGIC;
  signal C_in_IBUF : STD_LOGIC;
  signal C_out_OBUF : STD_LOGIC;
  signal R_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal V_OBUF : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of C_out_OBUF_inst_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \R_OBUF[1]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \R_OBUF[2]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \R_OBUF[3]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \R_OBUF[3]_inst_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of V_OBUF_inst_i_1 : label is "soft_lutpair0";
begin
\A_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(0),
      O => A_IBUF(0)
    );
\A_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(1),
      O => A_IBUF(1)
    );
\A_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(2),
      O => A_IBUF(2)
    );
\A_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(3),
      O => A_IBUF(3)
    );
\B_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(0),
      O => B_IBUF(0)
    );
\B_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(1),
      O => B_IBUF(1)
    );
\B_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(2),
      O => B_IBUF(2)
    );
\B_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(3),
      O => B_IBUF(3)
    );
C_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => C_in,
      O => C_in_IBUF
    );
C_out_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => C_out_OBUF,
      O => C_out
    );
C_out_OBUF_inst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEE8E888"
    )
        port map (
      I0 => B_IBUF(3),
      I1 => A_IBUF(3),
      I2 => B_IBUF(2),
      I3 => A_IBUF(2),
      I4 => C1,
      O => C_out_OBUF
    );
\R_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => R_OBUF(0),
      O => R(0)
    );
\R_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => C_in_IBUF,
      I1 => A_IBUF(0),
      I2 => B_IBUF(0),
      O => R_OBUF(0)
    );
\R_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => R_OBUF(1),
      O => R(1)
    );
\R_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E81717E8"
    )
        port map (
      I0 => C_in_IBUF,
      I1 => A_IBUF(0),
      I2 => B_IBUF(0),
      I3 => A_IBUF(1),
      I4 => B_IBUF(1),
      O => R_OBUF(1)
    );
\R_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => R_OBUF(2),
      O => R(2)
    );
\R_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => C1,
      I1 => A_IBUF(2),
      I2 => B_IBUF(2),
      O => R_OBUF(2)
    );
\R_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => R_OBUF(3),
      O => R(3)
    );
\R_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E81717E8"
    )
        port map (
      I0 => C1,
      I1 => A_IBUF(2),
      I2 => B_IBUF(2),
      I3 => A_IBUF(3),
      I4 => B_IBUF(3),
      O => R_OBUF(3)
    );
\R_OBUF[3]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEE8E888"
    )
        port map (
      I0 => B_IBUF(1),
      I1 => A_IBUF(1),
      I2 => B_IBUF(0),
      I3 => A_IBUF(0),
      I4 => C_in_IBUF,
      O => C1
    );
V_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => V_OBUF,
      O => V
    );
V_OBUF_inst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11181888"
    )
        port map (
      I0 => A_IBUF(3),
      I1 => B_IBUF(3),
      I2 => C1,
      I3 => A_IBUF(2),
      I4 => B_IBUF(2),
      O => V_OBUF
    );
end STRUCTURE;
