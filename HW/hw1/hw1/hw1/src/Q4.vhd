library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_arr.all;


entity q4 is
    port (
        a : in arr;
        b : in arr;
        o : out integer
    );
end q4;

architecture qq4 of q4 is
begin
    process(a, b)
        variable temp : integer := 0;
    begin
        for i in 0 to 7 loop
           	temp := temp + a(i) * b(i);
        end loop; 
		
        o <= temp;
		temp := 0;
		
    end process;
end architecture qq4;

