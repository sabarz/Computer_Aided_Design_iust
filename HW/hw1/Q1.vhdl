library ieee;
use ieee.std_logic_1164.all;    
use ieee.numeric_std.all;
use work.my_package.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all; 



package my_package is
	type matrix is array (0 to 2, 0 to 2) of std_logic_vector(3 downto 0);
end my_package;	 


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



library ieee;
use ieee.NUMERIC_STD.all;
library hw1;
use hw1.my_package.all;

	-- Add your library and packages declaration here ...

entity q1_tb is
end q1_tb;

architecture TB_ARCHITECTURE of q1_tb is
	-- Component declaration of the tested unit
	component q1
	port(
		inp : in matrix;
		outp : out INTEGER );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal inp : matrix;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal outp : INTEGER;

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
		inp <= (("1001" , "0000" , "0100"), ("0010" , "1100" , "0011") , ("0101" , "0001" , "1010"));  
		wait for 20ns;
		inp <= (("1101" , "0110" , "0100"), ("0010" , "1010" , "0011") , ("0101" , "1111" , "1000"));
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


