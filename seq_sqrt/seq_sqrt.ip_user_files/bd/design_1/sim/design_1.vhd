--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
--Date        : Wed Jan 31 17:30:19 2024
--Host        : DLJY44V04 running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    btn : in STD_LOGIC_VECTOR ( 1 downto 0 );
    clk : in STD_LOGIC;
    clr : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 0 to 0 );
    root_ans : out STD_LOGIC_VECTOR ( 14 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=2,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_Seq_decoder_bits_0_0 is
  port (
    clk : in STD_LOGIC;
    clr : in STD_LOGIC;
    din : in STD_LOGIC;
    dout : out STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component design_1_Seq_decoder_bits_0_0;
  component design_1_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xlslice_0_0;
  component design_1_xlslice_1_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_xlslice_1_0;
  component design_1_sqrt2_0_0 is
  port (
    clk : in STD_LOGIC;
    clr : in STD_LOGIC;
    go : in STD_LOGIC;
    sw : in STD_LOGIC_VECTOR ( 15 downto 0 );
    done : out STD_LOGIC;
    root : out STD_LOGIC_VECTOR ( 14 downto 0 )
  );
  end component design_1_sqrt2_0_0;
  signal Seq_decoder_bits_0_data_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal Seq_decoder_bits_0_dout : STD_LOGIC;
  signal btn_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal clk_1 : STD_LOGIC;
  signal clr_1 : STD_LOGIC;
  signal sqrt2_0_done : STD_LOGIC;
  signal sqrt2_0_root : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal xlslice_0_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_1_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  btn_1(1 downto 0) <= btn(1 downto 0);
  clk_1 <= clk;
  clr_1 <= clr;
  led(0) <= sqrt2_0_done;
  root_ans(14 downto 0) <= sqrt2_0_root(14 downto 0);
Seq_decoder_bits_0: component design_1_Seq_decoder_bits_0_0
     port map (
      clk => xlslice_1_Dout(0),
      clr => clr_1,
      data_out(15 downto 0) => Seq_decoder_bits_0_data_out(15 downto 0),
      din => xlslice_0_Dout(0),
      dout => Seq_decoder_bits_0_dout
    );
sqrt2_0: component design_1_sqrt2_0_0
     port map (
      clk => clk_1,
      clr => clr_1,
      done => sqrt2_0_done,
      go => Seq_decoder_bits_0_dout,
      root(14 downto 0) => sqrt2_0_root(14 downto 0),
      sw(15 downto 0) => Seq_decoder_bits_0_data_out(15 downto 0)
    );
xlslice_0: component design_1_xlslice_0_0
     port map (
      Din(1 downto 0) => btn_1(1 downto 0),
      Dout(0) => xlslice_0_Dout(0)
    );
xlslice_1: component design_1_xlslice_1_0
     port map (
      Din(1 downto 0) => btn_1(1 downto 0),
      Dout(0) => xlslice_1_Dout(0)
    );
end STRUCTURE;
