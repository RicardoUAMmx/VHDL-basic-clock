---------------------------------------------
-- Engineer: Ricardo Hernández Osorio
---------------------------------------------
-- Module Name: main
-- Project Name: control clock
-- Target Device: Nexys-4 DDR
---------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity main is
    port( 
        clk_main : in std_logic;
        rst_main : in std_logic;
        led : out std_logic;
        anodes : out std_logic_vector(7 downto 0);
        ssd_main : out std_logic_vector(6 downto 0)
    );
end main;

architecture behavioral of main is

component one_sec is
    port(
        clk_100MHz : in std_logic;
        clk_1Hz : out std_logic
    );
end component;

component cent_sec is
    port(
        clk_100MHz : in std_logic;
        clk_100Hz : out std_logic
    );
end component;

component multiplex_ssd_bin is
    port(
        in_u : in std_logic_vector(3 downto 0);
        in_d : in std_logic_vector(3 downto 0);
        selector : in std_logic;
        out_bin : out std_logic_vector(3 downto 0)
    );
end component;

component multiplex_ssd_an is
    port(
        out_anodes : out std_logic_vector(7 downto 0);
        selector : in std_logic
    );
end component;

component bin2ssd is
    port(
        bin_number : in std_logic_vector(3 downto 0);
        ssd : out std_logic_vector(6 downto 0)
    );
end component;

component counter_dec is
    port(
        clk : in std_logic;
        reset : in std_logic;
        out_flag : out std_logic;
        out_counter_dec : out std_logic_vector(3 downto 0)
    );
end component;

signal bus4_one : std_logic_vector(3 downto 0);
signal bus4_cent : std_logic_vector(3 downto 0);
signal bus4_mul : std_logic_vector(3 downto 0);
signal bus1_one : std_logic;
signal bus1_cent : std_logic;
signal bus1_flg : std_logic;

begin

Clkdec: one_sec
port map(
    clk_100MHz => clk_main, clk_1Hz => bus1_one
);

Clkcent: cent_sec
port map(
    clk_100MHz => clk_main, clk_100Hz => bus1_cent
);

Counter1: counter_dec
port map(
    clk => bus1_one, reset => rst_main,
    out_flag => bus1_flg, out_counter_dec => bus4_one
);

Counter2: counter_dec
port map(
    clk => bus1_flg, reset => rst_main,
    out_flag => led, out_counter_dec => bus4_cent
);

MultiplexBin: multiplex_ssd_bin
port map(
    in_u => bus4_one, in_d => bus4_cent,
    selector => bus1_cent, out_bin => bus4_mul
);

MultiplexAn: multiplex_ssd_an
port map(
    out_anodes => anodes, selector => bus1_cent
);

DecoderSSD: bin2ssd
port map(
    bin_number => bus4_mul, ssd => ssd_main
);

end behavioral;

