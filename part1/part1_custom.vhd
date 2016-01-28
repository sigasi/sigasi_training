library ieee;
use ieee.std_logic_1164.all;

entity welcome is
	port(
		clk      : in  std_logic;       -- This is the main clock
		rst      : in  std_logic;
		data_in  : in  std_logic;
		data_out : out std_logic
	);
end entity welcome;

architecture RTL of welcome is
	type mytype is (a, b, c);
	signal state : mytype;
	
begin
	
	process(all) is /* Valid in VHDL 2008 */ --TODO switch to VHDL 2008
	begin

		if (rst = '1') then
		elsif rising_edge(clk) then
			data_out <= data_in;
		end if;
	end process;
	
	--TODO change the tabs/spaces preferences
	--     next format and check with "Show whitespace"
	
	--TODO change the keywords casing preference
	--     next format and check that keywords are in upper case.
	
	--TODO add a keyboard shortcut for "Show whitespace"
	
end architecture;