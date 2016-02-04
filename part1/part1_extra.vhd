entity testbench is
end entity testbench;

architecture STR of testbench is
	signal data_out : unsigned(7 downto 0);         
	signal data_in  : unsigned(7 downto 0);
	signal valid    : std_logic;
	signal start    : std_logic;         
	signal clk      : std_logic;
	signal rst      : std_logic;

	constant iterations : integer := MAX_COUNT - 4;
 
begin
	dut_instance : entity work.dut(RTL)
		generic map(
			iterations => iterations             
		)
		port map(
			data_out => data_out,
			data_in  => data_in, --TODO try structural select (a few times) on data_in
			valid    => valid,            
			start    => start,           
			clk -- TODO try stuttering (with ".", to add a "=>" here
		);

	assert valid = '0' or data_out /= "00000000";           

end architecture STR;

--TODO press Ctrl+O to open Quick Outline and try to navigate to signal clk
--      without using your mouse 
