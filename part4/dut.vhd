library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dut is
	generic(
		iterations : integer := 10
	);
	port(
		data_out : out unsigned(7 downto 0);
		data_in  : in  unsigned(7 downto 0);
		valid    : out std_logic;
		start    : in  std_logic;
		clk      : in  std_logic;
		rst      : in  std_logic
	);
end entity dut;

use work.constants.all;
architecture RTL of dut is
	signal count  : integer range 0 to MAX_COUNT;
	signal result : unsigned(7 downto 0);
begin
	assert iterations <= MAX_COUNT;

	COUNTER : process(clk, rst) is
		variable state : state_t;
	begin
		if rst = '1' then
			state := idle;
			count <= 0;
			valid <= '0';
			result <= (others => '0');
		elsif rising_edge(clk) then
		    -- TODO S1 "State Machines View": right-click and select *Show in > State Machines*
		    -- The States Machines View and shows the state machine in this file.
		    -- You can change the position and size of the Block Diagram view if you like.
			case state is
				when idle =>
					valid <= '0';
					result <= (others => '0');
					
				    -- TODO S2 "Type-time update":
				    -- Uncomment the next line and see how State Machines view updates.
				    
--				     state := preparing; -- 
				when preparing =>
					if start = '1' then
						count <= 0;
						if (valid = '1') then
							state := running; --
						else
							state := ready; -- error
						end if;
					end if;
				when running =>
					if count = iterations then
						state  := ready;
						result <= result * data_in;
					end if;
					count <= count + 1;
				-- TODO S3 "Navigate from FSM to state in code": in the State Machines View, 
				-- double-click on the node "ready". The when-clause for state "ready"
				-- will be selected. That way, you can navigate to 
				
				when ready =>
					data_out <= result;
					valid <= '1';
    				-- TODO S4 "Navigate from FSM to transition in code": in the State Machines View, 
    				-- double-click on the arrow between "ready" and "idle". The assignment on the 
    				-- line below will be highlighted. You can use this to navigate to state transitions.
					state := idle; -- go to idle
			end case;
		end if;
	end process COUNTER;

end architecture RTL;
