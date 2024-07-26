library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all; 
use ieee.numeric_std.ALL;

entity q3 is
	port (
		inpp : in std_logic_vector(16 downto 1);  
		outpp : out std_logic_vector(1 downto 0)
		);
end q3;		   

architecture qq3 of q3 is  
begin
	
	process(inpp)
	
	variable i, j : integer; 
	variable even : integer := 0;
	variable odd : integer := 0;
	
	begin	
		odd := 0;
		even := 0;
		i := 1;
		while i < 17 loop 
			if inpp(i) = '1' then
				odd := odd + 1;	 
			end if;	
			i := i + 2;	
		end loop;  
		
		j := 2;
		while j < 17 loop 
			if inpp(j) = '1' then
				even := even + 1;	 
			end if;	
			j := j + 2;	
		end loop;
		
		if even mod 3 = 0 then
	      outpp(1) <= '1';
	    else
	      outpp(1) <= '0';
	    end if;
	
	    if odd mod 5 = 0 then
	    	outpp(0) <= '1';
	    else
	    	outpp(0) <= '0';
	    end if;	

	end process;

end qq3; 




