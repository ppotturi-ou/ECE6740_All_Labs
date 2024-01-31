----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2024 03:54:34 PM
-- Design Name: 
-- Module Name: tb_sqrt2 - Behavioral
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


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity tb_sqrt2 is
----  Port ( );
--end tb_sqrt2;

--architecture sim of tb_sqrt2 is
--  signal clk, clr, go: std_logic := '0';
--  signal sw: std_logic_vector(7 downto 0) := (others => '0');
--  signal done: std_logic;
--  signal root: std_logic_vector(3 downto 0);
--begin
--  -- Instantiate the sqrt2 module
--  sqrt2_inst : entity work.sqrt2
--    port map(
--      clk => clk,
--      clr => clr,
--      go => go,
--      sw => sw,
--      done => done,
--      root => root
--    );

--  -- Clock process
--  process
--  begin
--    clk <= '0';
--    wait for 5 ns;
--    clk <= '1';
--    wait for 5 ns;
--  end process;

--  -- Stimulus process
--  process
--  begin
--    clr <= '1'; -- Initial reset
--    wait for 10 ns;
--    clr <= '0'; -- Release reset
--    wait for 10 ns;

--    -- Test 1: Square root of 16 (should be 4)
--    go <= '1';
--    sw <= "00010000";
--    wait until done = '1';
--    go <= '0';
--    wait for 10 ns;

--    -- Test 2: Square root of 25 (should be 5)
--    go <= '1';
--    sw <= "00011001";
--    wait until done = '1';
--    go <= '0';
--    wait for 10 ns;

--    -- Add more test cases as needed

--    wait;
--  end process;

--end sim;




entity tb_sqrt2 is
--  Port ( );
end tb_sqrt2;

architecture sim of tb_sqrt2 is
  signal clk, clr, go: std_logic := '0';
  signal sw: std_logic_vector(15 downto 0) := (others => '0');
  signal done: std_logic;
  signal root: std_logic_vector(14 downto 0);
begin
  -- Instantiate the sqrt2 module
  sqrt2_inst : entity work.sqrt2
    port map(
      clk => clk,
      clr => clr,
      go => go,
      sw => sw,
      done => done,
      root => root
    );

  -- Clock process
  process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

  -- Stimulus process
  process
  begin
    clr <= '1'; -- Initial reset
    wait for 10 ns;
    clr <= '0'; -- Release reset
    wait for 10 ns;

    -- Test 1: Square root of 16 (should be 4)
    go <= '1';
    sw <= "1111111111111111";
    wait until done = '1';
    go <= '0';
    wait for 10 ns;

    -- Test 2: Square root of 25 (should be 5)
    go <= '1';
    sw <= "0000000000011001";
    wait until done = '1';
    go <= '0';
    wait for 10 ns;

    -- Add more test cases as needed

    wait;
  end process;

end sim;
