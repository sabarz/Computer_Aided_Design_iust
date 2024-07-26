library ieee;
use ieee.std_logic_1164.all;    
use ieee.numeric_std.all;
use work.my_package.all;

entity q1 is
	port (
		inp : in matrix;  
		outp : out integer
		);
end q1;	

architecture qq1 of q1 is  
begin
	
	process(inp)		  
	variable tmp : integer := 0;
	begin		
		for row in 0 to 2 loop
			for col in 0 to 2 loop 
				tmp := tmp + to_integer(unsigned(inp(row , col)));
			end loop;	
		end loop;	
		outp <= tmp; 
		tmp := 0;
	end process;

end qq1;  



