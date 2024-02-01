-- Example 60: Detect sequence 1101
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity seqdeta_top is
	 port(
		 mclk : in STD_LOGIC;
		 btn : in STD_LOGIC_VECTOR(3 downto 0);
		 ld : out STD_LOGIC_VECTOR(0 downto 0)
	     );
end seqdeta_top;

architecture seqdeta_top of seqdeta_top is
component clkdiv is
  port(
	 mclk : in STD_LOGIC;
	 clr : in STD_LOGIC;
	 clk190 : out STD_LOGIC
       );
end component;
component seqdeta is
  port (clk: in STD_LOGIC;
  	  clr: in STD_LOGIC;
        din: in STD_LOGIC;
        dout: out STD_LOGIC
        );
end component;
component clock_pulse is
	 port(
		 inp : in STD_LOGIC;
		 cclk : in STD_LOGIC;
		 clr : in STD_LOGIC;
		 outp : out STD_LOGIC       
           );
end component;
signal clr, clk190, clkp, btn01: STD_LOGIC;

begin
  clr <= btn(3);  
  btn01 <= btn(0) or btn(1);

  U1: clkdiv
     port map (
  	   mclk => mclk,
  	   clr => clr,
  	   clk190 => clk190
     );

  U2: clock_pulse
     port map (
  	   inp => btn01,
  	   cclk => clk190,
  	   clr => clr,
 	    outp => clkp
     );

  U3: seqdeta
     port map (
  	   clk => clkp,
  	   clr => clr,
  	   din => btn(1),
  	   dout => ld(0)
     );

end seqdeta_top;
