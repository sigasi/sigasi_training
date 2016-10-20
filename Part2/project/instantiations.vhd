library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instantiations is
end entity instantiations;

architecture testbench of instantiations is
	
	constant iterations : integer := 10;
	
	-- TODO use auto-complete to generate a component for 'dut'
	com 
	
begin
	
	-- TODO use auto-complete to generate an instantiation of the entity dut
	-- Generate the missing singals using the quick-fixes
	lbl1 : en
	
	-- TODO use auto-complete to generate an instantiation of the component dut
	lbl2 : co 
	
	-- TODO use auto-complete to generate just the port map and then generate the generic map
	lbl3 : entity work.dut
		port m 
	
	-- TODO use the quickfix to add the missing port associations
	lbl4 : entity work.dut
		port map (
			data_in => data_in
		);
		
end architecture testbench;
