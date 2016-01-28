library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity waive is
end entity waive;

architecture test of waive is
	-- null range array constant
	constant NAU : unsigned(0 downto 1) := (others => '0');

begin
end architecture test;
