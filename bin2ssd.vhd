---------------------------------------------
-- Engineer: Ricardo Hernández Osorio
---------------------------------------------
-- Module Name: bin2ssd
-- Project Name: control clock
-- Target Device: Nexys-4 DDR
---------------------------------------------

library ieee;
use ieee.std_logic_1164.all

entity bin2ssd is
    port(
        bin_number : in std_logic_vector(3 downto 0);
        ssd : out std_logic_vector(6 downto 0)
    );
end bin2ssd;

architecture behavioral of bin2ssd is
begin
process(bin_number)
begin
    case bin_number is
        when "0000" => ssd <= "1000000"; -- "0"
        when "0001" => ssd <= "1111001"; -- "1"
        when "0010" => ssd <= "0100100"; -- "2"
        when "0011" => ssd <= "0110000"; -- "3"
        when "0100" => ssd <= "0011001"; -- "4"
        when "0101" => ssd <= "0010010"; -- "5"
        when "0110" => ssd <= "0000010"; -- "6"
        when "0111" => ssd <= "1111000"; -- "7"
        when "1000" => ssd <= "0000000"; -- "8"
        when "1001" => ssd <= "0011000"; -- "9"
        when others => ssd <= "0000110"; -- "E"
    end case;
end process;
end behavioral;
