library vunit_lib;
context vunit_lib.vunit_context;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library osvvm;
use osvvm.RandomPkg.RandomPType;

-- A testbench for the 74161 counter
entity tb_counter is
    generic(runner_cfg : string);
end entity tb_counter;

architecture tb of tb_counter is
    signal clk_raw        : std_logic;
    signal clk            : std_logic;
    signal clrb           : std_logic;
    signal loadb          : std_logic;
    signal ent            : std_logic;
    signal enp            : std_logic;
    signal abcd           : std_logic_vector(3 downto 0);
    signal rco            : std_logic;
    signal qabcd          : std_logic_vector(3 downto 0);
    signal clk_inhibit    : std_logic;
    constant clock_period : time := 10 ns;
begin
    main : process
        variable rnd           : RandomPType;
        variable expected_abcd : std_logic_vector(3 downto 0);

        -- set inactive inputs for loadb, ent and enp
        procedure set_inactive_control_inputs is
        begin
            loadb <= '1';
            enp   <= '0';
            ent   <= '0';
        end procedure set_inactive_control_inputs;

        -- set random inputs for loadb, ent and enp
        procedure set_random_control_inputs is
            variable controlbits : std_logic_vector(2 downto 0);
        begin
            controlbits := std_logic_vector(to_unsigned(rnd.RandInt(0, 7), 3));
            loadb       <= controlbits(0);
            enp         <= controlbits(1);
            ent         <= controlbits(2);
        end procedure set_random_control_inputs;

        -- set random inputs for abcd
        procedure set_random_load_input is
        begin
            abcd <= std_logic_vector(to_unsigned(rnd.RandInt(0, 15), 4));
        end procedure set_random_load_input;

        -- wait until a little (1/10th of a clock period) after the next rising clock edge
        procedure wait_until_after_next_rising_clock_edge(signal clock: in std_logic; period: in time) is
        begin
            wait until rising_edge(clock);
            wait for period / 10;  
        end procedure wait_until_after_next_rising_clock_edge;

    begin
        test_runner_setup(runner, runner_cfg);
        rnd.InitSeed(rnd'instance_name);
        while test_suite loop
            if run("test_initial_clear") then
                -- clear input controlled from p_init below
                set_random_control_inputs;
                for test_count in 1 to 3 loop   -- test a few times while clrb is active
                    wait for clock_period / 2;
                    check_equal(to_integer(unsigned(qabcd)), 0, "reset failed");
                    check_equal(rco, '0', "Carry incorrect after reset");
                end loop;

            elsif run("test_load_random") then
                set_inactive_control_inputs;
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                for test_count in 1 to 5 loop
                    set_random_load_input;
                    set_random_control_inputs; -- loadb=0 takes priority
                    loadb <= '0';
                    wait_until_after_next_rising_clock_edge(clk, clock_period);
                    check_equal(qabcd, abcd, "Load value failed");
                end loop;

            elsif run("test_keep_value") then
                set_inactive_control_inputs;
                set_random_load_input;
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                loadb         <= '0';
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                check_equal(qabcd, abcd, "Test initialization problem");
                expected_abcd := abcd;
                loadb         <= '1';
                abcd          <= abcd xor "1011"; -- make sure that abcd gets a different value
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                check_equal(qabcd, expected_abcd, "Unexpected output change on controls inactive");
                enp           <= '1';
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                check_equal(qabcd, expected_abcd, "Unexpected output change on enp only");
                enp           <= '0';
                ent           <= '1';
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                check_equal(qabcd, expected_abcd, "Unexpected output change on ent only");
                -- check that output actually changes when loadb is activated again
                loadb         <= '0';
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                check_equal(qabcd, abcd, "Test problem");

            elsif run("test_increment") then
                set_inactive_control_inputs;
                set_random_load_input;
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                loadb         <= '0';
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                check_equal(qabcd, abcd, "Test initialization problem");
                expected_abcd := abcd;
                for test_count in 1 to 70 loop -- statistically, this should ensure that all counter values were seen
                    set_random_control_inputs;
                    loadb <= '1';
                    wait_until_after_next_rising_clock_edge(clk, clock_period);
                    if enp = '1' and ent = '1' then
                        expected_abcd := std_logic_vector(unsigned(expected_abcd) + 1);
                    end if;
                    check_equal(qabcd, expected_abcd, "Incorrect increment");
                end loop;

            elsif run("test_carry") then
                set_inactive_control_inputs;
                abcd          <= "1110";
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                loadb         <= '0';
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                check_equal(qabcd, abcd, "Test initialization problem");
                check_equal('0', rco, "Carry incorrect");
                loadb         <= '1';
                enp           <= '1';
                ent           <= '1';
                wait for clock_period / 10; -- check combinational behavior
                check_equal('0', rco, "Carry incorrect");
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                check_equal('1', rco, "Carry incorrect");
                ent           <= '0';
                wait for clock_period / 10; -- check combinational behavior
                check_equal('0', rco, "Carry incorrect");
                ent           <= '1';
                wait for clock_period / 10; -- check combinational behavior
                check_equal('1', rco, "Carry incorrect");
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                check_equal('0', rco, "Carry incorrect");
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                check_equal('0', rco, "Carry incorrect");
                wait_until_after_next_rising_clock_edge(clk, clock_period);
                check_equal('0', rco, "Carry incorrect");
                expected_abcd := "0010";
                check_equal(qabcd, expected_abcd, "Incorrect increment");

            elsif run("test_intentional_fail") then
                check(false, "This test is meant to fail");

            end if;
        end loop;
        test_runner_cleanup(runner);
    end process;

    counter_inst : entity work.counter
        port map(
            clk   => clk,
            clrb  => clrb,
            loadb => loadb,
            ent   => ent,
            enp   => enp,
            abcd  => abcd,
            rco   => rco,
            qabcd => qabcd
        );

    p_clk_gen : process is
    begin
        if clk_raw = '0' then
            clk_raw <= '1';
        else
            clk_raw <= '0';
        end if;
        wait for clock_period / 2;
    end process p_clk_gen;

    clk <= clk_raw and not clk_inhibit;

    p_init : process is
    begin
        clrb        <= '0';
        clk_inhibit <= '1';
        wait for clock_period * 1.7;
        clrb        <= '1';
        wait for clock_period * 2;
        clk_inhibit <= '0';
        wait;
    end process p_init;

end architecture tb;
