library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- A counter based on the 74161 component
entity counter is
    port(
        clk   : in  std_logic;
        clrb  : in  std_logic;
        loadb : in  std_logic;
        ent   : in  std_logic;
        enp   : in  std_logic;
        abcd  : in  std_logic_vector(3 downto 0);
        rco   : out std_logic;
        qabcd : out std_logic_vector(3 downto 0)
    );
end entity counter;

architecture RTL of counter is
    signal count : unsigned(3 downto 0);
begin
    p_counter : process(clk, clrb) is
    begin
        if clrb = '0' then
            count <= (others => '0');
        elsif rising_edge(clk) then
            if loadb = '0' then
                count <= unsigned(abcd);
            elsif ent = '1' and enp = '1' then
                count <= count + 1;
            end if;
        end if;
    end process p_counter;
    qabcd <= std_logic_vector(count);
    rco   <= '1' when ent = '1' and count = "1111" else '0';
end architecture RTL;
