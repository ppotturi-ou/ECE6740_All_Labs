-- A package containing component declarations
-- for sqrt2 Example 67
library IEEE;
use IEEE.std_logic_1164.all;

package sqrt2_components is
	
	component clkdiv
	port(
		mclk : in std_logic;
		clr : in std_logic;
		clk25 : out std_logic;
		clk190 : out std_logic);
	end component;

	component debounce4
	port(
		cclk : in std_logic;
		clr : in std_logic;
		inp : in std_logic_vector(3 downto 0);
		outp : out std_logic_vector(3 downto 0));
	end component;

	component clock_pulse
	port(
		inp : in std_logic;
		cclk : in std_logic;
		clr : in std_logic;
		outp : out std_logic);
	end component;

	component sqrt2
	port(
		clk : in std_logic;
		clr : in std_logic;
		go : in std_logic;
		sw : in std_logic_vector(7 downto 0);
		done : out std_logic;
		root : out std_logic_vector(3 downto 0));
	end component;

	component mux2g
	generic(
		N : INTEGER);
	port(
		a : in std_logic_vector(N-1 downto 0);
		b : in std_logic_vector(N-1 downto 0);
		s : in std_logic;
		y : out std_logic_vector(N-1 downto 0));
	end component;

	component binbcd8
	port(
		b : in std_logic_vector(7 downto 0);
		p : out std_logic_vector(9 downto 0));
	end component;
	
	component x7segbc
	port(
		x : in std_logic_vector(15 downto 0);
		cclk : in std_logic;
		clr : in std_logic;
		a_to_g : out std_logic_vector(6 downto 0);
		an : out std_logic_vector(3 downto 0);
		dp : out std_logic );
	end component;
	
end sqrt2_components; 
  
  
