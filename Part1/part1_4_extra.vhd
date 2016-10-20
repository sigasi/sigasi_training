library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity extra is
end entity extra;

architecture testbench of extra is
	signal clk      : std_logic;            -- @suppress
	signal rst      : std_logic;            -- @suppress
	signal data_in  : unsigned(7 downto 0); -- @suppress
	signal data_out : unsigned(7 downto 0); -- @suppress
	signal valid    : std_logic;            -- @suppress
	signal start    : std_logic;            -- @suppress

	constant iterations : integer := 10;

	component dut is
		generic(
			iterations : integer
		);
		port(
			clk      : std_logic;
			rst      : std_logic;
			data_out : unsigned(7 downto 0);
			data_in  : unsigned(7 downto 0);
			valid    : std_logic;
			start    : std_logic
		);
	end component;

begin
	dut_instance : entity dut
		generic map(
			iterations => iterations
		)
		port map(
			data_out => data_out,
			data_in  => data_in,        -- TODO try structural select (a few times) on data_in
			valid    => valid,
			start    => start,
			clk                         -- TODO try stuttering (with ".", to add a "=>" here
		);

	assert valid = '0' or data_out /= "00000000";

end architecture testbench;

--TODO press Ctrl+O to open Quick Outline and try to navigate to signal clk
--      without using your mouse 
