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
use IEEE.NUMERIC_STD.ALL; -- Use NUMERIC_STD instead of STD_LOGIC_ARITH and STD_LOGIC_UNSIGNED
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
    Port ( clk : in STD_LOGIC;
           --rst : in STD_LOGIC;
           A, B : in STD_LOGIC_VECTOR (31 downto 0);
           sum_out : out STD_LOGIC_VECTOR (31 downto 0));
end Adder;

architecture Behavioral of Adder is
    -- No extra bit for overflow since we are not using carry out
begin
    process(clk)
    begin
        if clk'event and clk = '1' then
            -- Perform addition on the rising edge of the clock
            -- Directly assign the sum to sum_out without the carry out
            sum_out <= std_logic_vector(unsigned(A) + unsigned(B));
            --sum_out <= X"00000030";
        end if;
    end process;
end Behavioral;
