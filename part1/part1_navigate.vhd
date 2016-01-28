library ieee;
use ieee.std_logic_1164.all;

entity welcome is
	port(
		clk      : in  std_logic;       -- This is the main clock
		rst      : in  std_logic;
		data_in  : in  std_logic;
		data_out : out std_logic
	);
end entity welcome;

architecture RTL of welcome is
	type mytype is (a, b, c);
	signal state : mytype;
	
begin
	
	name : process(clk) is
	begin

		if (rst = '1') then
		elsif rising_edge(clk) then
			data_out <= data_in; -- TODO right click and select "Open declaration" on data_in
		end if;
	end process name; --TODO use F3 do navigate to the declaration of name, navigate back with Alt+left
	
	-- TODO goto line 35 with Ctlr+L
	
	
	
	
	
	
	-- TODO navigate to the next error by clicking the red rectangle in the scroll bar
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	intentional syntax error here;
	-- TODO go to the next error with Ctrl+.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

end architecture RTL;


















intentional syntax error here;
--TODO navigate to port `clk` by clicking it in the outline view.


