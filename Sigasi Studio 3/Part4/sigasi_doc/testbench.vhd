library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- TODO add entity documentation here 

entity testbench is
	generic(half_iterations : integer := 50);
end entity testbench;


-- more info about the architecture
architecture STR of testbench is
	signal data_out : unsigned(7 downto 0); -- data_out connection signal
	signal data_in  : unsigned(7 downto 0);
	signal valid    : std_logic;
	signal start    : std_logic := '0';
	signal clk      : std_logic;
	signal rst      : std_logic;

begin
	
	-- the instantiation of the dut
	--
	-- a new paragraph in the document after an empty line
	-- the next sentence continues on the same line  
	-- while 2 trailing spaces force a new line 
	dut_instance : entity work.dut(RTL)
		generic map(
			iterations => half_iterations * 2
		)
		port map(
			data_out => data_out,
			data_in  => data_in,
			valid    => valid,
			start    => start,
			clk      => clk,
			rst      => rst
		);

	-- the *stimgen* instance has the following **properties**
	-- * sends stimuli
	-- * needs connections
	--   1. clk is connected
	--   1. rst is connected
	stimgen_instance: entity work.stimgen(BEH)
	    port map(
	        clk => clk,
	        rst => rst,
	         start => start,
	        stim_data => data_in
	    );

	-- | port | timing |
	-- |------|--------|
	-- | clk  |  20 ns |
	-- | rst  | 150 ns |
	--
	-- Training available on <https://github.com/sigasi/sigasi_training>
	--
	-- For questions you can contact <support@sigasi.com>
	clk_gen_instance: entity work.clock_generator(BEH)
		generic map(PERIOD => 20 ns)
		port map(
			clk => clk,
			rst => rst
		);

	assert valid = '0' or data_out /= "00000000";
	
end architecture STR;
