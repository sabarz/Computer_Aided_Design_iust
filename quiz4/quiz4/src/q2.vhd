library ieee;
use ieee.std_logic_1164.all;
use work.Calculator_pkg.all;
use ieee.math_real.all; 
use ieee.numeric_std.ALL;

entity q2 is
    port (
        a, b : in std_logic_vector(7 downto 0);
        op : in std_logic;
        result : out std_logic_vector(7 downto 0)
    );
end entity q2 ;

architecture Behavioral of q2 is
    signal temp : std_logic_vector(7 downto 0);
begin
    process(a, b, op)
    begin
        if op = '1' then
            temp <= addition(a, b);
        else
            temp <= subtraction(a, b);
        end if;
    end process;

    result <= temp;
end architecture Behavioral;
