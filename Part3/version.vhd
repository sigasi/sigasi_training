library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity version is
	port (
		clk : in std_logic;
		rst : in std_logic;
		output : out integer
	);
end entity version;

architecture RTL of version is
	/* a 2008 comment */
begin
	name : process (clk) is
		variable counter : integer;
	begin
		if rising_edge(clk) then
			if rst then
				counter := 0;
			else
				counter := counter + 1;
				output <= maximum(counter, 100);
			end if;
		end if;
	end process name;
	
end architecture RTL;
