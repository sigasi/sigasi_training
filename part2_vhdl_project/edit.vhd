architecture edit of dut is
begin
	name : process(rst) is              -- TODO use quickfix
	begin
		if rst = '1' then
		elsif rising_edge(clk) then
			if (start = '1' and valid = '1') then
				data_out <= data_in;
			end if;
		end if;
	end process name;

	assert iterations > 0;

end architecture edit;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity demo is
	port(
		port_1 : in  std_logic; -- TODO edit "port_1" manually to "port_1a"
		                        --      save, and use the problems view to fix all errors
		port_a : out std_logic -- TODO Use **Refactor > Rename** to rename "port_1" to "port_1a"
	);
end entity demo;

architecture RTL of demo is
begin
	port_a <= port_1;
end architecture RTL;

--TODO right click this editor and select **Compare With > Local History...**

--TODO Extra: select this file (`edit.vhd`) and `navigate.vhd` in the project explorer
--     Next, right click and select **Compare With > Each Other** 

