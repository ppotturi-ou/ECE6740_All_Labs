--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
--Date        : Tue Jan 30 18:15:19 2024
--Host        : DLJY44V04 running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    btn : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clr : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 0 to 0 );
    root_ans : out STD_LOGIC_VECTOR ( 14 downto 0 )
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    btn : in STD_LOGIC_VECTOR ( 1 downto 0 );
    led : out STD_LOGIC_VECTOR ( 0 to 0 );
    root_ans : out STD_LOGIC_VECTOR ( 14 downto 0 );
    clr : in STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      btn(1 downto 0) => btn(1 downto 0),
      clr => clr,
      led(0) => led(0),
      root_ans(14 downto 0) => root_ans(14 downto 0)
    );
end STRUCTURE;
