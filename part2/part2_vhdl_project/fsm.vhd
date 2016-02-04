library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dut is
	generic(
		iterations : integer := 10
	);
	port(
		data_out : out unsigned(7 downto 0);
		data_in  : in  unsigned(7 downto 0);
		valid    : out std_logic;
		start    : in  std_logic;
		clk      : in  std_logic;
		rst      : in  std_logic
	);
end entity dut; -- entity dut

use work.constants.all;
architecture RTL of dut is
	signal count  : integer range 0 to MAX_COUNT;
	signal result : unsigned(7 downto 0);
	
begin
	assert iterations <= MAX_COUNT;

	COUNTER : process(clk, rst) is
		type  ;--TODO delcare enum type `state_type` here with states `(init,running,read)`
		var --TODO declare variable `state` of type `state_type` 
	begin
		if rst = '1' then
			count  <= 0;
			valid  <= '0';
			result <= (others => '0');
		elsif rising_edge(clk) then
			
			case --TODO use autocomplete to get a case statement over state
			
			--TODO replace the `null` statements with real transitions (e.g. `state := running;`)
			
			--TODO add a new when clause `when idle` and use the quickfix to add `idle` as enum literal
			
			--TODO remove case choice `when idle` and use the quick fix on `state` to add it again
			
			--TODO Ctrl+Hover over the enum literal in the state assignments. Notice and use the extra link.
			
	end process COUNTER;

end architecture RTL;
