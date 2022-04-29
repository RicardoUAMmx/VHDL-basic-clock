---------------------------------------------
-- Engineer: Ricardo Hernández Osorio
---------------------------------------------
-- Module Name: multiplex_ssd_bin
-- Project Name: control clock
-- Target Device: Nexys-4 DDR
---------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity multiplex_ssd_bin is
    port( 
        in_u : in std_logic_vector(3 downto 0);
        in_d : in std_logic_vector(3 downto 0);
        selector : in std_logic;
        out_bin : out std_logic_vector(3 downto 0)
    );
end multiplex_ssd_bin;

architecture behavioral of multiplex_ssd_bin is
begin
    out_bin <= in_d when (selector = '1') else in_u;
end behavioral;
