----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:30:16 01/31/2017 
-- Design Name: 
-- Module Name:    decrypter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decrypter is
	    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           plaintext : out  STD_LOGIC_VECTOR (63 downto 0);
           start : in  STD_LOGIC;
           ciphertext : in  STD_LOGIC_VECTOR (63 downto 0);
           done : out  STD_LOGIC);
end decrypter;

architecture Behavioral of decrypter is
constant k0: STD_LOGIC_VECTOR (31 downto 0) := "11111111000011110111010001010111";
constant k1: STD_LOGIC_VECTOR (31 downto 0) := "01000011111111011001100111110111";
constant k2: STD_LOGIC_VECTOR (31 downto 0) := "01110101111110001100010010001111";
constant k3: STD_LOGIC_VECTOR (31 downto 0) := "00101001001001111100000110001100";
constant delta : STD_LOGIC_VECTOR (31 downto 0):=x"9E3779B9";

signal sum: STD_LOGIC_VECTOR (31 downto 0):=x"C6EF3720";
signal cv0,cv1: std_logic_vector (31 downto 0);
signal counter :integer:=0;
begin
	process(clk, start)
	begin
		if (clk='1') then
				if (start='1') then
					if(counter = 0) then
						cv0 <= ciphertext(31 downto 0);
						cv1 <= ciphertext(63 downto 32);
						done <= '0';
					elsif (counter<97 and (counter mod 3 = 1)) then
						cv1 <= cv1-(((cv0(27 downto 0) & "0000")+k2)xor(cv0+sum)xor(("00000" & cv0(31 downto 5))+k3));
					elsif (counter<97 and (counter mod 3 = 2)) then
						cv0 <= cv0-(((cv1(27 downto 0) & "0000")+k0)xor(cv1+sum)xor(("00000" & cv1(31 downto 5))+k1));
					elsif (counter<97 and (counter mod 3 = 0)) then
							sum <= sum-delta;
					else
						plaintext <= cv1&cv0;
						done<='1';
					end if;
				counter <= counter+1;
				end if;
		end if;
	end process;
end Behavioral;