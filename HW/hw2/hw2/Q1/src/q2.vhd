library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all; 
use ieee.numeric_std.ALL ;

entity q2 is
	port (
		input : in std_logic_vector(9 downto 0);  
		output : out std_logic_vector(5 downto 0)
		);
end q2;		   

architecture qq2 of q2 is  
begin
	
	process(input)
	variable tmp : integer := 0;
	variable hold : integer;
	begin
		tmp := 0;
		hold := to_integer(unsigned(input));
		--tmp := 0;
		
		while hold > tmp*tmp loop	
			tmp := tmp + 1;
		end loop;
		
		output <= std_logic_vector(to_unsigned(tmp, 6));
		
	end process;

end qq2; 

