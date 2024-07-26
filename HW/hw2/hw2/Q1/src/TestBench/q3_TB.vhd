library ieee;
use ieee.MATH_REAL.all;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity q3_tb is
end q3_tb;

architecture TB_ARCHITECTURE of q3_tb is
		-- Component declaration of the tested unit
	component q3        
	port(
		inpp : in STD_LOGIC_VECTOR(16 downto 1);
		outpp : out STD_LOGIC_VECTOR(1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal inpp : STD_LOGIC_VECTOR(16 downto 1);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal outpp : STD_LOGIC_VECTOR(1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q3
		port map (
			inpp => inpp,
			outpp => outpp
		);

	-- Add your stimulus here ...  
	
	 process
	 begin

		inpp <= "0000000000000000";

    	inpp <= "0000000110000001";
    	wait for 50 ns;
    	

    	inpp <= "0000001010000010";
    	wait for 50 ns;
    	

    	inpp <= "0011110000000011";
    	wait for 50 ns;
    	
	  end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q3 of q3_tb is
	for TB_ARCHITECTURE
		for UUT : q3
			use entity work.q3(qq3);
		end for;
	end for;
end TESTBENCH_FOR_q3;

