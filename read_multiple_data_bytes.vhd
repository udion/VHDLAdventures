----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:17:13 01/25/2017 
-- Design Name: 
-- Module Name:    read_multiple_data_bytes - Behavioral 
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

entity read_multiple_data_bytes is
    Port ( clk : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  reset : IN  std_logic;
           next_data : in  STD_LOGIC;
           data_read : out  STD_LOGIC_VECTOR (63 downto 0));
end read_multiple_data_bytes;

architecture Behavioral of read_multiple_data_bytes is

	begin
	process(next_data, clk)
		variable counter :integer := 0;
	begin
		if (clk'event and clk='1' and next_data = '1' and (counter < 63)) then
			data_read((7+counter) downto counter) <= data_in;
			counter := counter + 8;
		end if;
	end process;
end Behavioral;