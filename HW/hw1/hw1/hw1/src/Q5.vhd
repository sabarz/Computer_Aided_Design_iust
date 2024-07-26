library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_complex.all;

entity q5 is
	port (
	a : in complex;
	b : in complex;
	s : std_logic_vector(1 downto 0);
	o : out complex
		);
end q5;	

architecture qq5 of q5 is
begin
	process(a,b,s)
    begin
        case s is         
            when "00" =>
				o.x <= a.x + b.x;
				o.y	<= a.y + b.y;
            when "01" =>
				o.x <= a.x - b.x;
				o.y	<= a.y - b.y;
            when "10" =>
				o.x <= (a.x * b.x) - (a.y * b.y);
				o.y <= (a.x * b.y) + (a.y * b.x);
            when others =>
                o <= a;
        end case;
    end process;
	
end architecture qq5;

