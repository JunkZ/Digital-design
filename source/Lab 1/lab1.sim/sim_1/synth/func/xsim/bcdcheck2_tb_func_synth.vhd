-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Thu May  9 21:32:30 2019
-- Host        : AsterixLaptop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file {C:/Users/Rickard
--               Bemm/OneDrive/Dokument/Skola/Universitet/D0011E,
--               Digitalteknik/Uppgifter/lab1/lab1.sim/sim_1/synth/func/xsim/bcdcheck2_tb_func_synth.vhd}
-- Design      : BCDcheck2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BCDcheck2 is
  port (
    x : in STD_LOGIC_VECTOR ( 3 downto 0 );
    max : out STD_LOGIC;
    min : out STD_LOGIC;
    even : out STD_LOGIC;
    lo3 : out STD_LOGIC;
    noBCD : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of BCDcheck2 : entity is true;
end BCDcheck2;

architecture STRUCTURE of BCDcheck2 is
  signal even_OBUF : STD_LOGIC;
  signal lo3_OBUF : STD_LOGIC;
  signal max_OBUF : STD_LOGIC;
  signal min_OBUF : STD_LOGIC;
  signal noBCD_OBUF : STD_LOGIC;
  signal x_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of lo3_OBUF_inst_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of max_OBUF_inst_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of min_OBUF_inst_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of noBCD_OBUF_inst_i_1 : label is "soft_lutpair1";
begin
even_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => even_OBUF,
      O => even
    );
even_OBUF_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => x_IBUF(0),
      O => even_OBUF
    );
lo3_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => lo3_OBUF,
      O => lo3
    );
lo3_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0007"
    )
        port map (
      I0 => x_IBUF(0),
      I1 => x_IBUF(1),
      I2 => x_IBUF(3),
      I3 => x_IBUF(2),
      O => lo3_OBUF
    );
max_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => max_OBUF,
      O => max
    );
max_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => x_IBUF(1),
      I1 => x_IBUF(0),
      I2 => x_IBUF(3),
      I3 => x_IBUF(2),
      O => max_OBUF
    );
min_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => min_OBUF,
      O => min
    );
min_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => x_IBUF(3),
      I1 => x_IBUF(0),
      I2 => x_IBUF(1),
      I3 => x_IBUF(2),
      O => min_OBUF
    );
noBCD_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => noBCD_OBUF,
      O => noBCD
    );
noBCD_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => x_IBUF(3),
      I1 => x_IBUF(2),
      I2 => x_IBUF(1),
      O => noBCD_OBUF
    );
\x_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => x(0),
      O => x_IBUF(0)
    );
\x_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => x(1),
      O => x_IBUF(1)
    );
\x_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => x(2),
      O => x_IBUF(2)
    );
\x_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => x(3),
      O => x_IBUF(3)
    );
end STRUCTURE;
