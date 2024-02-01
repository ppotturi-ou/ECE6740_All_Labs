-- Example 67b: sqrt2_top
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.sqrt2_components.all;

entity sqrt2_top is
	 port(
		 mclk : in STD_LOGIC;
		 btn : in STD_LOGIC_VECTOR(3 downto 0);
		 sw : in STD_LOGIC_VECTOR(7 downto 0);
		 ld : out STD_LOGIC_VECTOR(7 downto 0);
		 a_to_g : out STD_LOGIC_VECTOR(6 downto 0);
		 an : out STD_LOGIC_VECTOR(3 downto 0);
	       dp : out STD_LOGIC
	     );
end sqrt2_top;

architecture sqrt2_top of sqrt2_top is
signal clk25, clk190, clr, go1, done: std_logic;
signal x: std_logic_vector(15 downto 0);
signal p: std_logic_vector(9 downto 0);
signal root, btnd: std_logic_vector(3 downto 0);
signal b, r: std_logic_vector(7 downto 0);
begin
	
clr <= btn(3);
r <= "0000" & root;
x <= "000000" & p;
ld <= sw;

U1 : clkdiv
	port map(mclk => mclk, clr => clr, clk25 => clk25,
		clk190 => clk190);

U2 : debounce4
	port map(cclk => clk190, clr => clr, inp => btn,
		outp => btnd);

U3 : clock_pulse
	port map(inp => btnd(0), cclk => clk25, clr => clr,
		outp => go1);
	
U4 : sqrt2
	port map(clk => clk25, clr => clr, go => go1,
		done => done, sw => sw, root => root);

U5 : mux2g generic map(N => 8)
	port map(a => sw, b => r, s => done, y => b);
	
U6 : binbcd8
	port map(b => b, p => p);
	
U7 : x7segbc
	port map(x => x, cclk => clk190, clr => clr,
		a_to_g => a_to_g, an => an, dp => dp);	
	
end sqrt2_top;
