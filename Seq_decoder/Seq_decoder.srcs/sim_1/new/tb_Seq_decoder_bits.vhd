----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/29/2024 05:22:42 PM
-- Design Name: 
-- Module Name: tb_Seq_decoder_bits - Behavioral
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



entity tb_Seq_decoder_bits is
end tb_Seq_decoder_bits;

architecture testbench of tb_Seq_decoder_bits is

  signal clk, clr, din, dout : STD_LOGIC := '0';
  signal data_out : STD_LOGIC_VECTOR(15 downto 0);

  constant CLK_PERIOD : time := 10 ns; -- Define the clock period

  -- Instantiate the unit under test (UUT)
  component Seq_decoder_bits
    port (
      clk      : in STD_LOGIC;
      clr      : in STD_LOGIC;
      din      : in STD_LOGIC;
      dout     : out STD_LOGIC;
      data_out : out STD_LOGIC_VECTOR(15 downto 0)
    );
  end component;

  -- Clock process
  begin
  process
  begin
    while now < 1000 ns loop
      clk <= not clk;
      wait for CLK_PERIOD / 2;
    end loop;
    wait;
  end process;

  -- Stimulus process
  process
  begin
    wait for 20 ns; -- Wait for initial stabilization

    -- Test case 1
    clr <= '1';
    din <= '0';
    wait for CLK_PERIOD * 5; -- Wait for a few clock cycles

    -- Test case 2
    clr <= '0';
    din <= '1';
    wait for CLK_PERIOD * 1; -- Wait for a few clock cycles

    -- Test case 3
    din <= '0';
    wait for CLK_PERIOD * 1; -- Wait for a few clock cycles

    -- Test case 4
    din <= '1';
    wait for CLK_PERIOD * 2; -- Wait for a few clock cycles

    -- Test case 5
    din <= '0';
    wait for CLK_PERIOD * 1; -- Wait for a few clock cycles

    -- 16-bit data
    -- 0000 0011 0000 1100 = 030C
    din <= '0';
    wait for CLK_PERIOD * 2; -- Wait for a few clock binary_read
    din <= '1';
    wait for CLK_PERIOD * 2; -- Wait for a few clock binary_read
    din <= '0';
    wait for CLK_PERIOD * 4; -- Wait for a few clock binary_read
    
    din <= '1';
    wait for CLK_PERIOD * 2; -- Wait for a few clock binary_read
    din <= '0';
    wait for CLK_PERIOD * 2; -- Wait for a few clock binary_read
    din <= '0';
    wait for CLK_PERIOD * 4; -- Wait for a few clock binary_read
    
    wait for 20 ns; -- Wait for initial binary_read
    -- Test case 2
    clr <= '0';
    din <= '1';
    wait for CLK_PERIOD * 1; -- Wait for a few clock cycles

    -- Test case 3
    din <= '0';
    wait for CLK_PERIOD * 1; -- Wait for a few clock cycles

    -- Test case 4
    din <= '1';
    wait for CLK_PERIOD * 2; -- Wait for a few clock cycles

    -- Test case 5
    din <= '0';
    wait for CLK_PERIOD * 1; -- Wait for a few clock cycles

    -- 16-bit data
    -- 0000 1100 0000 1111 = 0C0F
    din <= '1';
    wait for CLK_PERIOD * 2; -- Wait for a few clock binary_read
    din <= '1';
    wait for CLK_PERIOD * 2; -- Wait for a few clock binary_read
    din <= '0';
    wait for CLK_PERIOD * 4; -- Wait for a few clock binary_read
    
    din <= '0';
    wait for CLK_PERIOD * 2; -- Wait for a few clock binary_read
    din <= '1';
    wait for CLK_PERIOD * 2; -- Wait for a few clock binary_read
    din <= '0';
    wait for CLK_PERIOD * 4; -- Wait for a few clock binary_read
    
    
    wait; -- Wait indefinitely after all test cases
  end process;

  -- Instantiate the UUT
  uut : Seq_decoder_bits port map (clk, clr, din, dout, data_out);

  -- Monitor process
  process
  begin
    wait for 50 ns; -- Wait for some time to observe the outputs

    -- Display results
    --report "Dout = " & std_logic'image(dout);
    --report "Data_out = " & std_logic_vector'image(data_out);

    wait;
  end process;

end testbench;