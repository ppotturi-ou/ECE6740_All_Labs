----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2024 03:50:40 PM
-- Design Name: 
-- Module Name: sqrt2 - Behavioral
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
use IEEE.STD_LOGIC_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--entity sqrt2 is
--	 port(
--		 clk : in STD_LOGIC;
--		 clr : in STD_LOGIC;
--		 go : in STD_LOGIC;
--		 sw : in STD_LOGIC_VECTOR(7 downto 0);
--		 done : out STD_LOGIC;
--		 root : out STD_LOGIC_VECTOR(3 downto 0)
--	     );
--end sqrt2;

--architecture sqrt2 of sqrt2 is
--signal a: std_logic_vector(7 downto 0);
--signal square: std_logic_vector(8 downto 0);
--signal delta: std_logic_vector(4 downto 0);
--begin
	
--SR2: process(clk, clr)
--variable calc, donev: std_logic;
--begin
--	if clr = '1' then
--		a <= (others => '0');
--		square <= (others => '0');
--		delta <= (others => '0');
--		root <= (others => '0');
--		donev := '0';
--		calc := '0';
--	elsif clk'event and clk = '1' then
--		if go = '1' and calc = '0' then
--			a <= sw;
--			square <= "000000001"; 
--			delta <= "00011";
--			calc := '1';
--			donev := '0';
--		elsif calc = '1' then
--			if square > a then
--				root <= delta(4 downto 1) - 1;
--				donev := '1';
--				calc := '0';
--			else
--				square <= square + delta;
--				delta <= delta + 2;
--			end if;
--		end if;
--	end if;
--	done <= donev;			
--end process SR2;

--end sqrt2;

entity sqrt2 is
  port (
    clk : in STD_LOGIC;
    clr : in STD_LOGIC;
    go : in STD_LOGIC;
    sw : in STD_LOGIC_VECTOR(15 downto 0);
    done : out STD_LOGIC;
    root : out STD_LOGIC_VECTOR(14 downto 0)
  );
end sqrt2;

architecture sqrt2 of sqrt2 is
  signal a: std_logic_vector(15 downto 0);
  signal square: std_logic_vector(16 downto 0);
  signal delta: std_logic_vector(15 downto 0);
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
      if go = '1' and calc = '0' then
        a <= sw;
        square <= "00000000000000001";
        delta <= "0000000000000011"; -- Initial delta value as 3
        calc := '1';
        donev := '0';
      elsif calc = '1' then
        if square > a then
          root <= delta(15 downto 1) - 1;
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