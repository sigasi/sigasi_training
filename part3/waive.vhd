library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package waive is
	-- null range array constant
	constant NAU : unsigned(0 downto 1) := (others => '0'); --TODO remove this todo marker and add @suppress "error marker message prefix" marker instead
end package waive;
