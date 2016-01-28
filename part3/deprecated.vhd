library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; -- TODO fix
--use ieee.numeric_std.all;

entity deprecated is
	port (
		data_in : in unsigned(3 downto 0)
	);
end entity deprecated;


architecture RTL of deprecated is
	
begin
	assert data_in > CONV_UNSIGNED(0,4); -- to_unsigned(0,4) 
end architecture RTL;


