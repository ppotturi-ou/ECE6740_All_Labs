----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2024 06:02:25 PM
-- Design Name: 
-- Module Name: design1_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity design_1_tb is
end design_1_tb;

architecture TB_ARCH of design_1_tb is
  signal clk : STD_LOGIC := '0';
  signal clr : STD_LOGIC := '0';
  signal btn : STD_LOGIC_VECTOR(1 downto 0) := "00";
  signal led : STD_LOGIC_VECTOR(0 downto 0);
  signal root_ans : STD_LOGIC_VECTOR(14 downto 0);

  constant CLK_PERIOD : time := 10 ns;  -- Adjust the clock period as needed

begin
  -- Instantiate the design_1 entity
  uut : entity work.design_1
    port map (
      btn => btn,
      clr => clr,
      clk => clk,
      led => led,
      root_ans => root_ans
    );

  -- Clock process
  clk_process: process
  begin
    while now < 1000 ns loop  -- Simulate for 1000 ns, adjust as needed
      clk <= not clk;
      wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process clk_process;

  -- Reset process
  reset_process: process
  begin
    clr <= '1';  -- Initial reset
    wait for 50 ns;
    clr <= '0';  -- Release reset
    wait;
  end process reset_process;

  -- Stimulus process
  stimulus_process: process
  begin
    wait for 50 ns;  -- Wait for initial stabilization

    -- Seq '10110' test scenarios here by changing btn values
    btn <= "11";  -- Example test scenario
    wait for 10 ns;
    btn <= "01";  -- Example test scenario
    wait for 10 ns;
    
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    
    btn <= "11";  -- Example test scenario
    wait for 10 ns;
    btn <= "01";  -- Example test scenario
    wait for 10 ns;
    
    btn <= "11";  -- Example test scenario
    wait for 10 ns;
    btn <= "01";  -- Example test scenario
    wait for 10 ns;
    
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    
    wait for 20 ns;
    
    -- 0 bit data 
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 1 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 2 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 3 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 4 bit data
    btn <= "11";  -- Example test scenario
    wait for 10 ns;
    btn <= "01";  -- Example test scenario
    wait for 10 ns;
    -- 5 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 6 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 7 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 08 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 09 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 10 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 11 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 12 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 13 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 14 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    -- 15 bit data
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    
        -- dummy clocks
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    btn <= "10";  -- Example test scenario
    wait for 10 ns;
    btn <= "00";  -- Example test scenario
    wait for 10 ns;
    wait;
  end process stimulus_process;

end TB_ARCH;
