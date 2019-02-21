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
	signal clk      : std_logic;
	signal rst      : std_logic;
	signal adr      : std_logic_vector(3 downto 0);
	signal dat_m2s  : unsigned(7 downto 0);
	signal dat_s2m  : unsigned(7 downto 0);
	signal we       : std_logic;
	signal sel      : std_logic_vector(1 downto 0);
	signal stb      : std_logic;
	signal ack      : std_logic;
	signal cyc      : std_logic;

begin
	dut_instance : entity work.dut(RTL)
		generic map(
			iterations => half_iterations * 2
		)
		port map(
			clk_i => clk,
			rst_i => rst,
			adr_i => adr,
			dat_i => dat_m2s,
			dat_o => dat_s2m,
			we_i  => we,
			sel_i => sel,
			stb_i => stb,
			ack_o => ack,
			cyc_i => cyc
		);

	stimgen_instance : entity work.stimgen(BEH)
		port map(
			clk_i => clk,
			rst_i => rst,
			adr_o => adr,
			dat_i => dat_s2m,
			dat_o => dat_m2s,
			-- TODO B2 "Live update": uncomment the line below. Notice that the block diagram view updates when you save
			--			we_o  => we,
			sel_o => sel,
			stb_o => stb,
			ack_i => ack,
			cyc_o => cyc
		);

	clk_gen_instance : entity work.clock_generator(BEH)
		generic map(PERIOD => 20 ns)
		port map(
			clk => clk,
			rst => rst
		);

	assert ack = '0' or dat_s2m /= "00000000";

end architecture STR;
