library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all; 
use ieee.numeric_std.ALL;
use work.my_package.all;
 



entity q1 is
	port (
		inp : in my_arr_bit;  
		outp : out my_arr_bit
		);
end q1;	

architecture qq1 of q1 is  
begin
	
	process(inp)
	
	variable i, j : integer; 
	variable arr : my_arr_int;	
	variable temp : integer;
	
	begin		
		for i in 0 to 4 loop
             arr(i) := to_integer(unsigned(inp(i)));
		end loop;
		
		for i in 0 to 4 loop
			for j in 0 to 4 loop 
				if arr(i) > arr(j) then
                    temp := arr(i);
                    arr(i) := arr(j);
                    arr(j) := temp;
                end if;        
			end loop;	
		end loop;
		
		for i in 0 to 4 loop
             outp(i) <= std_logic_vector(to_unsigned(arr(i), 8));
		end loop;
		
	end process;

end qq1;  
		




