----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:44:57 01/25/2017 
-- Design Name: 
-- Module Name:    display_multiple_data_bytes - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display_multiple_data_bytes is
    Port ( clk : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (63 downto 0);
           next_data : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end display_multiple_data_bytes;

architecture Behavioral of display_multiple_data_bytes is
	
	begin
	process(next_data)
		variable counter :integer := 0;
	begin
		if (next_data = '1' and (counter < 63)) then
			data_out <= data_in((7+counter) downto counter);
			counter := counter + 8;
		end if;
	end process;
end Behavioral;