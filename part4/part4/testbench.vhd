library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
entity testbench is
	generic(half_iterations : integer := 50);
end entity testbench;


-- TODO B1 "Block Diagram View": Right-click and select *Show In > Block Diagram*
-- The Block Diagram View appears and shows a block diagram of the current file.
-- You can change the position and size of the Block Diagram view if you like.
architecture STR of testbench is
	signal data_out : unsigned(7 downto 0);
	signal data_in  : unsigned(7 downto 0);
	signal valid    : std_logic;
	signal start    : std_logic;
	signal clk      : std_logic;
	signal rst      : std_logic;

begin
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

	stimgen_instance: entity work.stimgen(BEH)
	    port map(
	        clk => clk,
	        rst => rst,
	        -- TODO B2 "Live update": uncomment the line below. Notice that the block diagram view updates when you save
--	         start => start,
	        stim_data => data_in
	    );

    clk_gen_instance: entity work.clock_generator(BEH)
        generic map(PERIOD => 20 ns)
        port map(
            clk => clk,
            rst => rst
        );
        
	assert valid = '0' or data_out /= "00000000";
	
end architecture STR;
