library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity nmd is
    Port ( x : in  integer;
           y : in  integer;
           lcm  : out integer;
           gcd  : out integer);
end nmd;

architecture Behavioral of nmd is
begin

    process(x, y)
        variable p : integer ;
        variable t : integer;
        variable tmp : integer;
        variable hold: integer;
    begin
		
		p := x;
		t := y;	
		

        while t /= 0 loop
            tmp := t;
            t := p mod t;
            p := tmp;
        end loop;

        hold := p;
        gcd <= hold;

        lcm <= (x * y) / hold;

    end process;

end Behavioral;
