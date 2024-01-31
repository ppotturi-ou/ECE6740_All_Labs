----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/29/2024 04:58:14 PM
-- Design Name: 
-- Module Name: Seq_decoder_bits - Behavioral
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

--entity Seq_decoder_bits is
--  port (
--    clk      : in STD_LOGIC;
--    clr      : in STD_LOGIC;
--    din      : in STD_LOGIC;
--    dout     : out STD_LOGIC;
--    data_out : out STD_LOGIC_VECTOR(15 downto 0)
--  );
--end Seq_decoder_bits;

--architecture Behavioral of Seq_decoder_bits is

--  type state_type is (s0, s1, s2, s3, s4, s5);
--  signal present_state, next_state : state_type;
--  signal data_buffer : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
--  signal count : integer := 0;

--begin

--  sreg: process(clk, clr)
--  begin
--    if clr = '1' then
--      present_state <= s0;
--      count <= 0;
--      data_buffer <= (others => '0');
--    elsif rising_edge(clk) then
--      present_state <= next_state;
--    end if;
--  end process;

--  C1: process(present_state, din)
--  begin
--    case present_state is
--      when s0 =>
--        if din = '1' then
--          next_state <= s1;
--        else
--          next_state <= s0;
--        end if;
--      when s1 =>
--        if din = '0' then
--          next_state <= s2;
--        else
--          next_state <= s0;
--        end if;	  
--      when s2 =>
--        if din = '1' then
--          next_state <= s3;
--        else
--          next_state <= s2;
--        end if;
--      when s3 =>
--        if din = '1' then
--          next_state <= s4;
--        else
--          next_state <= s0;
--        end if;	  	  
--      when s4 =>
--        if din = '0' then
--          next_state <= s5;
--        else
--          next_state <= s2;
--        end if;
--      when s5 =>
--        if count > 15 then
--            next_state <= s0; -- Transition to s5 after receiving "10110"
--        else
--            next_state <= s5; -- Stay in s5 until the entire 16 bits are received
--            count <= count + 1; -- Move count to C1 process
--        end if;
--      when others =>
--        null;
--    end case;
--  end process;

--  C2: process(present_state)
--  begin
--    if present_state = s4 then
--      dout <= '1';
--    else
--      dout <= '0';
--    end if;
    
--     if present_state = s5 then
--      if count < 16 then
--        data_buffer(count) <= din;
--      end if;
--    else
--    end if;
--  end process;

--  data_out <= data_buffer;

--end Behavioral;

entity Seq_decoder_bits is
  port (
    clk      : in STD_LOGIC;
    clr      : in STD_LOGIC;
    din      : in STD_LOGIC;
    dout     : out STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR(15 downto 0)
  );
end Seq_decoder_bits;

architecture Behavioral of Seq_decoder_bits is

  type state_type is (s0, s1, s2, s3, s4, s5);
  signal present_state, next_state : state_type;
  signal data_buffer : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  signal count : integer := 0;

begin

  sreg: process(clk, clr)
  begin
    if clr = '1' then
      present_state <= s0;
     -- count <= 0;
      --data_buffer <= (others => '0');
    elsif rising_edge(clk) then
      present_state <= next_state;
    end if;
  end process;

  C1: process(present_state,din,clk)
  begin

      case present_state is
        when s0 =>
            count <=0;
            dout <= '0';
          if din = '1' then
            next_state <= s1;
          else
            next_state <= s0;
          end if;
        when s1 =>
          if din = '0' then
            next_state <= s2;
          else
            next_state <= s0;
          end if;	  
        when s2 =>
          if din = '1' then
            next_state <= s3;
          else
            next_state <= s2;
          end if;
        when s3 =>
          if din = '1' then
            next_state <= s4;
          else
            next_state <= s0;
          end if;	  	  
        when s4 =>
          if din = '0' then
            next_state <= s5;
          else
            next_state <= s2;
          end if;
        when s5 =>
        if falling_edge(clk) then
          if count > 15 then
            next_state <= s0; -- Transition to s5 after receiving "10110"
            dout <= '1';
          else
            next_state <= s5; -- Stay in s5 until the entire 16 bits are received
            count <= count + 1; -- Move count to C1 process
            --dout <= '0';
          end if;
          end if;
        when others =>
          null;
      end case;

  end process;

  C2: process(din,clk)
  begin

--      if present_state = s4 then
--        dout <= '1';
--      else
--        dout <= '0';
--      end if;
      if falling_edge(clk) then
          if present_state = s5 then
            if count < 16 then
              data_buffer(count) <= din;
            end if;
          end if;
      end if;
  end process;

  data_out <= data_buffer;

end Behavioral;

