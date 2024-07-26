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




