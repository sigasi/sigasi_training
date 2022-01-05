architecture edit of dut is
begin
	name : process(rst) is              -- TODO use quickfix
		variable value : natural;
	begin
		if rst = '1' then
		elsif rising_edge(clk) then
			if (start = '1' and valid = '1') then
				data_out <= data_in;
				
				-- TODO auto-complete after the dot, choose to_integer
				value := data_in. 
			end if;
		end if;
	end process name;

	assert iterations > 0;

end architecture edit;

           

--TODO remove trailing whitespace (use Quick Access)                       


