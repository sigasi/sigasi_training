library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;                           -- TODO fix
library std;                            -- TODO fix

entity linting is
	generic(
		width : positive := 7
	);
	port(
		clk  : in std_logic;
		rst  : in std_logic;
		data : in std_logic_vector(7 downto 0) --TODO fix
	);
end entity linting;

architecture test of linting is
	signal tmp : std_logic_vector(0 downto 7); --TODO fix
	signal tmp : std_logic_vector(7 downto 0);
	
	constant BAR : integer := FOO - 42; -- TODO fix: swap this line with next line
	constant FOO : integer := 42;
	
	type state_type is (s0, s1, s2);
	
	signal unread : std_logic;
	
	signal vec : std_logic_vector(width-1 downto 0);
	
	
begin
	
	unread <= '0';
	
	vec <= "0000_0000"; -- TODO fix
	
	process is                          -- TODO fix
		variable state : state_type := s0;
		
	begin
		if rst = '1' then
		elsif rising_edge(clk) then
			case state is 
				when s0 =>
					state := s1;
				when s1 =>
					state := s1;
				when s2 =>
					state := s0;
				when others =>
					state := s0;
			end case;
			
		end if;
		
		report integer'image(foo); -- TODO fix
		
	end process;
	
	--TODO set severity of positional associations to error in Preferences
	inst : entity work.duplicate(RTL)
		port map( clk,rst); 

end architecture test;
