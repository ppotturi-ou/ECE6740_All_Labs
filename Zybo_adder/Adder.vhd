----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/25/2024 04:17:25 AM
-- Design Name: 
-- Module Name: Adder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
      port (
        clk: in std_logic;
        a: out std_logic_VECTOR(31 downto 0);
        b: out std_logic_VECTOR(31 downto 0);
        c: out std_logic_VECTOR(31 downto 0);
        d: out std_logic_VECTOR(31 downto 0));
end Adder;

architecture Behavioral of adder is

begin
  process (clk)
  begin
    if clk'event and clk = '1' then
      a <= X"00000001";
      b <= X"00000002";
      c <= X"00000003";
      d <= X"00000004";
      
    end if;
  end process;

end Behavioral;
