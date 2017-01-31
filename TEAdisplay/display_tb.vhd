--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   16:06:21 01/25/2017
-- Design Name:
-- Module Name:   /home/shubham/Xilinx/Module1/test1.vhd
-- Project Name:  Module1
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: display_multiple_data_bytes
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY test1 IS
END test1;

ARCHITECTURE behavior OF test1 IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT display_multiple_data_bytes
    PORT(
         clk : IN  std_logic;
         data_in : IN  std_logic_vector(63 downto 0);
         next_data : IN  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal clk : std_logic := '0';
   signal data_in : std_logic_vector(63 downto 0) := (others => '0');
   signal next_data : std_logic := '0';

    --Outputs
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

   -- Instantiate the Unit Under Test (UUT)
   uut: display_multiple_data_bytes PORT MAP (
          clk => clk,
          data_in => data_in,
          next_data => next_data,
          data_out => data_out
        );

   -- Clock process definitions
   clk_process :process
   begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for clk_period*10;

      -- insert stimulus here
      data_in <= "0000011100000110000001010000010000000011000000100000000100000000";

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait for clk_period*5;
      next_data <= '1';
      wait for clk_period;
      next_data <= '0';

      wait;
   end process;

END;