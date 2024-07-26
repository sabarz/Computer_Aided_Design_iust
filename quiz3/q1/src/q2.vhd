library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MedianAndMean is
    port (
        numbers : in my_arr_bit;
        median : out integer;
        mean : out integer
    );
end entity MedianAndMean;



package my_package is
	type my_arr_bit is array (0 to 7) of std_logic_vector(8 downto 0);	 
	type my_arr_int is array (0 to 4) of integer;
end my_package;	 


architecture Behavioral of MedianAndMean is

    signal sorted_numbers : my_arr_bit;
begin
    process (numbers)
        variable tmp : integer;
    begin		 
		median := 0;
		mean := 0
		
            sorted_numbers(0) <= unsigned(numbers);
         
			for i in 1 to 6 loop
                if to_integer(unsigned(numbers)) > sorted_numbers(i-1) then
                    sorted_numbers(i) <= sorted_numbers(i-1);
                    sorted_numbers(i-1) <= to_integer(unsigned(numbers));
                else
                    sorted_numbers(i) <= to_integer(unsigned(numbers));
                end if;
            end loop;


            if (sorted_numbers'length mod 2) = 0 then
                median <= std_logic_vector((sorted_numbers(sorted_numbers'length/2) + sorted_numbers(sorted_numbers'length/2 - 1)) / 2);
            else
                median <= std_logic_vector(sorted_numbers(sorted_numbers'length/2));;

            temp := 0;
