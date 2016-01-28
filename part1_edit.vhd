library ieee; use ieee.std_logic_1164.all;

entity welcome is     port(
clk:in std_logic; -- This is the main clock
rst:in std_logic;
data_in:in std_logic;
data_out:out std_logic
);end entity welcome;

architecture RTL of welcome is
type mytype is (a, b, c);
                signal state : mytype;
begin
    name : process(clk) is begin

if (rst  == '1') then -- TODO : fix syntax error
			
elsif rising_edge(clk) then
data_out := data_in; -- TODO : fix syntax error
end if;
end process name;


-- TODO : delete this line with Ctrl+D

assert true report "success"; -- TODO comment this line with Ctrl+/

-- TODO: Move this comment block up and down
--       by selecting it, and pressing Alt+UP and Alt+down



	process (
		clk,
		r -- TODO use autocomplete to extend 'r' to 'rst' 
	) is
		  -- TODO define a constant here 
	begin
-- TODO autocomple an if statement here e.g. if rst = 1
	end process;
	
-- TODO autocomple an if generate here

assert true; --TODO use Quick Access to convert to upper case (select true first)

end architecture RTL;

