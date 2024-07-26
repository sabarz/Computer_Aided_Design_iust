library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_arr.all;


package my_arr is
	type arr is array (0 to 7) of integer;
end my_arr;

entity q4 is
    port (
        a : in arr;
        b : in arr;
        o : out integer
    );
end q4;

architecture qq4 of q4 is
begin
    process(a, b)
        variable temp : integer := 0;
    begin
        for i in 0 to 7 loop
           	temp := temp + a(i) * b(i);
        end loop; 
		
        o <= temp;
		temp := 0;
		
    end process;
end architecture qq4;


library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;  
use ieee.math_real.all;  
use work.my_arr.all;

	-- Add your library and packages declaration here ...

entity q4_tb is
end q4_tb;

architecture TB_ARCHITECTURE of q4_tb is
	-- Component declaration of the tested unit
	component q4
	port(
		a : in arr;
		b : in arr;
		o : out INTEGER );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : arr;
	signal b : arr;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal o : INTEGER;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q4
		port map (
			a => a,
			b => b,
			o => o
		);

	-- Add your stimulus here ...
	process	
	begin
	    wait for 10ns;
		a <= (1,2,3,4,5,6,7,8);
		b <= (3,5,7,1,2,8,0,12);
		wait for 10ns;
		a <= (4,2,12,11,9,9,5,6);
		b <= (1,5,3,8,10,0,1,1);
		wait;
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q4 of q4_tb is
	for TB_ARCHITECTURE
		for UUT : q4
			use entity work.q4(qq4);
		end for;
	end for;
end TESTBENCH_FOR_q4;


