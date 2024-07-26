library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ff is

    function bcdBinary(BCD: std_logic_vector; len: integer) return unsigned;
    function reverser(Binary: std_logic_vector) return std_logic_vector;

end ff;

package body ff is

    function bcdBinary(BCD: std_logic_vector; len : integer) 
	return unsigned is
	
	variable inn: integer;
	variable r: unsigned(len-5 downto 0);	 
		
		
	begin
	    inn := to_integer(unsigned(BCD));				
		report "Element(" & integer'image(inn) & ") " ;
	   
		if BCD'length <= 4 then
	        return to_unsigned(inn, 4);
	    
		else
	        r := bcdBinary(BCD(BCD'high-1 downto 4), len-4);
	        
			return r * 10 + to_unsigned(to_integer(unsigned(BCD(4 downto 0))), 4);
	    end if;
	end bcdBinary;


    function reverser(Binary: std_logic_vector) 
	return std_logic_vector is
    begin
        
		if Binary'length = 1 then    
			return Binary;		 
			
        else        
			return  reverser(Binary(Binary'high-1 downto 0)) & Binary(Binary'high);
		end if;
    end reverser;

end ff;
