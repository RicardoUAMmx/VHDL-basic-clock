---------------------------------------------
-- Engineer: Ricardo Hernández Osorio
---------------------------------------------
-- Module Name: multiplex_ssd_an
-- Project Name: control clock
-- Target Device: Nexys-4 DDR
---------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity multiplex_ssd_an is
    port( 
        out_anodes : out std_logic_vector(7 downto 0);
        selector : in std_logic
    );
end multiplex_ssd_an;

architecture behavioral of multiplex_ssd_an is
begin
    out_anodes <= "11111101" when (selector = '1') else "11111110";
end behavioral;
