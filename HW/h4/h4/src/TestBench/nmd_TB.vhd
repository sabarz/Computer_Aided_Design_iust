library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity nmd_tb is
end nmd_tb;

architecture TB_ARCHITECTURE of nmd_tb is
	-- Component declaration of the tested unit
	component nmd
	port(
		input : in STD_LOGIC_VECTOR(2 downto 0);
		output : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : nmd
		port map (
			input => input,
			output => output
		);

	-- Add your stimulus here ...	  
	process
    begin
        input <= "011";
        wait for 10 ns;

        input <= "111";
        wait for 10 ns;

        input <= "000";
        wait for 10 ns;	 
		
		input <= "100";
        wait for 10 ns;
        
        wait;
    end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_nmd of nmd_tb is
	for TB_ARCHITECTURE
		for UUT : nmd
			use entity work.nmd(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_nmd;

