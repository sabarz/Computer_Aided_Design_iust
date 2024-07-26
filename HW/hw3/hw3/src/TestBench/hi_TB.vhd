library std;
use std.ENV.all;
library hw3;
use hw3.ff.all;	  
use work.ff.all; 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

	-- Add your library and packages declaration here ...

entity hi_tb is
	-- Generic declarations of the tested unit
		generic(
		len : POSITIVE );
end hi_tb;

architecture TB_ARCHITECTURE of hi_tb is
	-- Component declaration of the tested unit
	component hi
		generic(
		len : POSITIVE );
	port(
		inp : in STD_LOGIC_VECTOR(len-1 downto 0);
		op : in INTEGER;
		outp1 : out STD_LOGIC_VECTOR(len-1 downto 0);
		outp2 : out UNSIGNED );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal inp : STD_LOGIC_VECTOR(len-1 downto 0);
	signal op : INTEGER;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal outp1 : STD_LOGIC_VECTOR(len-1 downto 0);
	signal outp2 : UNSIGNED(len-1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : hi
		generic map (
			len => len
		)

		port map (
			inp => inp,
			op => op,
			outp1 => outp1,
			outp2 => outp2
		);

	-- Add your stimulus here ...	  
	
	
	
	stimulus : process 
	begin	  
		inp <= "01001" ;
		op <= 2;
	wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_hi of hi_tb is
	for TB_ARCHITECTURE
		for UUT : hi
			use entity work.hi(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_hi;

