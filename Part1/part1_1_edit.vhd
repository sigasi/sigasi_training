library ieee; use ieee.std_logic_1164.all;

entity edit is     port(
clk:in std_logic; -- This is the main clock
rst:in std_logic;
data_in:in std_logic;
data_out:out std_logic; -- TODO : fix syntax error
);end entity edit;

architecture RTL of edit is
begin
    name : process(clk, rst) is
begin

if (rst  == '1') then -- TODO : fix syntax error
			
elsif rising_edge(clk) then
data_out := data_in; -- TODO : fix semantic error (use the quick fix this time)
end if;
end process name;


-- TODO : delete this line with Ctrl+D

assert true report "success"; -- TODO comment this line with Ctrl+/
                              --      uncomment by pressing Ctrl+/ again

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


-- TODO: find and Replace:
--     * press **Ctrl+F** to find all `TODO`'s
--     * Use **Ctrl+K** to find the next occurrence of the current selection
--	   * Use **Ctrl+J** (and start typing) for an inline, incremental search. 
--       _Look at the status bar to see what you have already typed_.

