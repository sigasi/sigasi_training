library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity stimgen is
	port(
		clk_i : in  std_logic;
		rst_i : in  std_logic;
		adr_o : out std_logic_vector(3 downto 0);
		dat_i : in  unsigned(7 downto 0);
		-- TODO N1 "Find Net": On the line below, select the port "dat_o", right-click
		-- and select "Find Net". The "Net Search" view opens and shows: 
		-- * all signals in the net
		-- * all drivers in the net
		-- * all loads in the net  
		dat_o : out unsigned(7 downto 0);
		we_o  : out std_logic;
		sel_o : out std_logic_vector(1 downto 0);
		stb_o : out std_logic;
		ack_i : in  std_logic;
		cyc_o : out std_logic
	);
end entity stimgen;

architecture BEH of stimgen is
begin
	name : process(clk_i) is
	begin
		if rising_edge(clk_i) then
			if rst_i = '1' then
				dat_o <= (others => '0');
			else
				dat_o <= not dat_o;
			end if;
		end if;
	end process name;

	start_p : process is
	begin
		for i in 0 to 10 loop
			wait until rising_edge(clk_i);
		end loop;

		sel_o <= "01";
		adr_o <= (others => '0');
		stb_o <= '0';
		cyc_o <= '0';
		we_o  <= '1';
		wait;                           -- forever
	end process start_p;

	log_data : process is
		variable received : unsigned(7 downto 0);
	begin
		wait until ack_i = '1';
		received := dat_i;
		wait;
	end process log_data;

end architecture BEH;
