library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dut is
	generic(
		slave_id   : std_logic_vector(1 downto 0) := "01";
		iterations : integer                      := 10
	);
	port(
		clk_i : in  std_logic;
		rst_i : in  std_logic;
		adr_i : in  std_logic_vector(3 downto 0);
		dat_i : in  unsigned(7 downto 0);
		dat_o : out unsigned(7 downto 0);
		we_i  : in  std_logic;
		sel_i : in  std_logic_vector(1 downto 0);
		stb_i : in  std_logic;
		ack_o : out std_logic;
		cyc_i : in  std_logic
	);
end entity dut;

use work.constants.all;
architecture RTL of dut is
	signal count  : integer range 0 to MAX_COUNT;
	signal result : unsigned(7 downto 0);
begin
	assert iterations <= MAX_COUNT;

	COUNTER : process(clk_i, rst_i) is
		variable state : state_t;
	begin
		if rst_i = '1' then
			state  := idle;
			count  <= 0;
			ack_o  <= '0';
			result <= (others => '0');
		elsif rising_edge(clk_i) then
			-- TODO "State Machines View": right-click and select *Show in > State Machines*
			-- The States Machines View and shows the state machine in this file.
			-- You can change the position and size of the Block Diagram view if you like.
			case state is
				when idle =>
					ack_o  <= '0';
					result <= (others => '0');

				-- TODO "Type-time update":
				-- Uncomment the next line and see how State Machines view updates.

				--				     state := preparing; -- 
				when preparing =>
					if sel_i = slave_id and we_i = '1' then
						count <= 0;
						if (ack_o = '1') then
							state := running; --
						else
							state := ready; -- error
						end if;
					end if;
				when running =>
					if count = iterations then
						state  := ready;
						result <= result * dat_i;
					end if;
					count <= count + 1;
				-- TODO "Navigate from FSM to state in code": in the State Machines View, 
				-- double-click on the node "ready". The when-clause for state "ready"
				-- will be selected. That way, you can navigate to 

				when ready =>
					dat_o <= result;
					ack_o <= '1';
					-- TODO "Navigate from FSM to transition in code": in the State Machines View, 
					-- double-click on the arrow between "ready" and "idle". The assignment on the 
					-- line below will be highlighted. You can use this to navigate to state transitions.
					state := idle;      -- go to idle
			end case;
		end if;
	end process COUNTER;

end architecture RTL;
