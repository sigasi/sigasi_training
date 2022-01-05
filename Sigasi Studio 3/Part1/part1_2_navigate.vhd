library ieee;
use ieee.std_logic_1164.all;

entity navigate is
	port(
		clk      : in  std_logic;       -- This is the main clock
		rst      : in  std_logic;
		data_in  : in  std_logic;
		data_out : out std_logic
	);
end entity navigate;

architecture RTL of navigate is
begin
	
	name : process(clk, rst) is
	begin

		if (rst = '1') then
		elsif rising_edge(clk) then -- TODO hover over clk and from the pop-up select "Open Declaration"
			data_out <= data_in;    -- TODO right click and select "Open Declaration" on data_in
		end if;
	end process name; --TODO use F3 do navigate to the declaration of name, navigate back with Alt+left
	
	-- TODO goto line 35 with Ctlr+L
	
	
	
	
	
	
	-- TODO navigate to the next error by clicking the red rectangle in the scroll bar
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	intentional syntax error here;
	-- TODO go to the next error with Ctrl+.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

end architecture RTL;


















intentional syntax error here;
-- TODO navigate to port `clk` by clicking it in the outline view - Then come back here
-- TODO Now press Ctrl+o to open the quick outline and start typing `clk` to find the same port
