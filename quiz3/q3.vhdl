library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

package my_package is
	type matrix is array (0 to 2, 0 to 2) of std_logic_vector(3 downto 0);
end my_package;	 

	

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.array2x2.ALL;


entity hi is
    Port ( matrix1 : in  matrix;
           matrix2 : in  matrix;
           my_bit : in  std_logic;
           output  : out integer);
end hi;

architecture Behavioral of hi is
begin

    process(matrix1, matrix2, my_bit)
	variable sum : integer ;
	variable ivide : integer ;
   
	begin
        result_sum := 0; 
		result_divide := 0;
        
		for i in 1 to 2 loop
            for j in 1 to 2 loop
                sum := sum + to_integer(unsigned(matrix1(i, j))) * to_integer(unsigned(matrix2(i, j)));
                divide := divide + to_integer(unsigned(matrix1(i, j))) / to_integer(unsigned(matrix2(i, j)));
            end loop;
        end loop;
        
		if my_bit = '0' then
             output <= std_logic_vector(to_unsigned(sum, 8));
        else
             output <= std_logic_vector(to_unsigned(divide, 8));
        end if;	
       
    end process;

end Behavioral;
