architecture STR of testbench is
	signal data_out     : unsigned(7 downto 0);
	signal data_in      : unsigned(7 downto 0);
	signal valid        : std_logic;
	signal start        : std_logic;
	signal clk          : std_logic;
	signal rst          : std_logic;    -- TODO hover std_logic
	signal a            : std_logic;
	constant iterations : integer          := MAX_COUNT - 4; -- TODO hover MAX_COUNT
	constant demo       : std_logic_vector := x"ffff"; -- TODO hover demo

begin
	dut_instance : entity work.dut(RTL)
		generic map(
			iterations => iterations    --TODO hover both left and right side, notice the difference
		)
		port map(
			data_out => data_out,       --TODO open the declaration of both sides (navigate back with Alt-left)
			data_in  => data_in,
			valid    => valid,
			start    => start,
			clk      => clk,
			rst      => rst
		);

	data_in <= (others => '1');
	start   <= '0', '1' after 10 ns;

	clk <= '0';
	rst <= demo(0);

	assert valid = '0' or data_out /= "00000000";

	demo_label : entity work.demo(rtl)
		port map(
			port_1 => a,
			port_a => a
		);

end architecture STR;

package functions is
	
	function f(a, b, c : integer) return integer; -- TODO use ctrl-hover or shift-F3 to jump to the implementation in the package body
	
	function f(a, b, c : integer) return boolean; -- TODO do the same
	
end package functions;

package body functions is
	
	function f(a, b, c : integer) return integer is
	begin
		return a+b+c;
	end function;
	
	function f(a, b, c : integer) return boolean is
	begin
		return f(a, b, c) > 0;
	end function;
	
end package body functions;
