-- Example 67a: sqrt2
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity sqrt2 is
	 port(
		 clk : in STD_LOGIC;
		 clr : in STD_LOGIC;
		 go : in STD_LOGIC;
		 sw : in STD_LOGIC_VECTOR(7 downto 0);
		 done : out STD_LOGIC;
		 root : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end sqrt2;

architecture sqrt2 of sqrt2 is
signal a: std_logic_vector(7 downto 0);
signal square: std_logic_vector(8 downto 0);
signal delta: std_logic_vector(4 downto 0);
begin
	
SR2: process(clk, clr)
variable calc, donev: std_logic;
begin
	if clr = '1' then
		a <= (others => '0');
		square <= (others => '0');
		delta <= (others => '0');
		root <= (others => '0');
		donev := '0';
		calc := '0';
	elsif clk'event and clk = '1' then
		if go = '1' then
			a <= sw;
			square <= "000000001"; 
			delta <= "00011";
			calc := '1';
			donev := '0';
		elsif calc = '1' then
			if square > a then
				root <= delta(4 downto 1) - 1;
				donev := '1';
				calc := '0';
			else
				square <= square + delta;
				delta <= delta + 2;
			end if;
		end if;
	end if;
	done <= donev;			
end process SR2;

end sqrt2;
