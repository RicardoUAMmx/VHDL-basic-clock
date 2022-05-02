---------------------------------------------
-- Engineer: Ricardo Hernández Osorio
---------------------------------------------
-- Module Name: counter_dec
-- Project Name: control clock
-- Target Device: Nexys-4 DDR
---------------------------------------------


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;


entity counter_dec is
    port(
        clk : in std_logic;
        reset : in std_logic;
        out_flag : out std_logic;
        out_counter_dec : out std_logic_vector(3 downto 0)
    );
end counter_dec;

architecture behavioral of counter_dec is
    signal binary_count : std_logic_vector(3 downto 0) := (others => '0');
    signal carrier : std_logic := '0';
begin
process(clk)
    variable counter : natural range 0 to 10 := 0;
begin
    if(reset = '1') then
        counter := 0;
        carrier <= '0';
        binary_count <= (others => '0');
    elsif(clk'event and clk = '1') then
        counter := counter + 1;
        binary_count <= binary_count + "0001";
        carrier <= '0';
        if(counter = 10) then
            counter := 0;
            binary_count <= (others => '0');
            carrier <= '1';
        end if;
    end if;
    out_counter_dec <= binary_count;
    out_flag <= carrier;
end process;
end behavioral;

