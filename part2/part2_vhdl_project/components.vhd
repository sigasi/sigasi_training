architecture COMP of testbench is
	component dut
		generic(iterations : integer := 10);
		port(data_out : out unsigned(7 downto 0);
			 data_in  : in  unsigned(7 downto 0);
			 valid    : out std_logic;
			 start    : in  std_logic;
			 clk      : in  std_logic;
			 rst      : in  std_logic);
	end component dut;

	component demo
		port(port_1 : in  std_logic;
			 port_a : out std_logic);
	end component demo;

	signal data : unsigned(7 downto 0) := (others => '1');
	signal a    : std_logic;

begin
	dut_instance : component dut
		generic map(
			iterations => 12
		)
		port map(
			data_out => open,           -- TODO Use Ctrl+click and Open Declaration, to navigate to the component
			clk      => '0',            -- TODO Use Ctrl+click and Open Port Declaration in Matching Entity
			valid    => '1',            -- TODO Use F3 to navigate to the component port
			start    => '1',            -- TODO Use Shift+F3 to navigate to the matching entity port
			data_in  => data,
			rst      => '0'             -- TODO Find references of rst
		);

	demo_label : entity work.demo(rtl)
		port map(
			port_1 => a,
			port_a => a
		);

end architecture COMP;
