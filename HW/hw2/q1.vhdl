library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all; 
use ieee.numeric_std.ALL;
use work.my_package.all;



library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all; 



package my_package is
	type my_arr_bit is array (0 to 4) of std_logic_vector(7 downto 0);	 
	type my_arr_int is array (0 to 4) of integer;
end my_package;	 



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

library ieee;
use ieee.NUMERIC_STD.all;
library Q1;
use Q1.my_package.all;

	-- Add your library and packages declaration here ...

entity q1_tb is
end q1_tb;

architecture TB_ARCHITECTURE of q1_tb is
	-- Component declaration of the tested unit
	component q1
	port(
		inp : in my_arr_bit;
		outp : out my_arr_bit );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal inp : my_arr_bit;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal outp : my_arr_bit;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q1
		port map (
			inp => inp,
			outp => outp
		);

	-- Add your stimulus here ...
	process
	begin
		wait for 10ns;
		inp <= ("11011000" , "01010011" , "00110101" , "10000111" , "11100000");  
		wait for 20ns;
		inp <= ("10101111" , "11011001" , "00011110" , "01001101" , "00110011");  
		wait;
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q1 of q1_tb is
	for TB_ARCHITECTURE
		for UUT : q1
			use entity work.q1(qq1);
		end for;
	end for;
end TESTBENCH_FOR_q1;  




