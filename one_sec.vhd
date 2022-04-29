---------------------------------------------
-- Engineer: Ricardo Hernández Osorio
---------------------------------------------
-- Module Name: one_sec
-- Project Name: control clock
-- Target Device: Nexys-4 DDR
---------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity one_sec is
    port( 
        clk_100MHz : in std_logic;
        clk_1Hz : out std_logic
    );
end one_sec;

architecture behavioral of one_sec is
begin
process(clk_100MHz)
variable counter : natural range 0 to 100000000 := 0;
begin
    if(rising_edge(clk_100MHz)) then
        counter := counter + 1;
        if(counter = 100000000) then
            counter := 0;
            clk_1Hz <= '1';
        else
            clk_1Hz <= '0';
        end if;
    end if;
end process;
end behavioral;
