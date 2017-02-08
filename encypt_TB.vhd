--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:02:17 02/01/2017
-- Design Name:   
-- Module Name:   /home/ud/xilinxproject/Tiny_Encription_Algo/TEA_top_module/encypt_TB.vhd
-- Project Name:  TEA_top_module
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: encrypter
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
 
ENTITY encypt_TB IS
END encypt_TB;
 
ARCHITECTURE behavior OF encypt_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT encrypter
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         plaintext : IN  std_logic_vector(63 downto 0);
         start : IN  std_logic;
         ciphertext : OUT  std_logic_vector(63 downto 0);
         done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal plaintext : std_logic_vector(63 downto 0) := (others => '0');
   signal start : std_logic := '0';

 	--Outputs
   signal ciphertext : std_logic_vector(63 downto 0);
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: encrypter PORT MAP (
          clk => clk,
          reset => reset,
          plaintext => plaintext,
          start => start,
          ciphertext => ciphertext,
          done => done
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
      -- insert stimulus here 
		plaintext <= "0110000110101100100100101001111000000010000101111111001001001010";
		reset <= '0';
		start <= '1';
      wait;
   end process;

END;
