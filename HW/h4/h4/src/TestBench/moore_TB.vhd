library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity moore_tb is
end moore_tb;

architecture TB_ARCHITECTURE of moore_tb is
	-- Component declaration of the tested unit
	component moore
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		input : in STD_LOGIC;
		output : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal input : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : moore
		port map (
			clk => clk,
			reset => reset,
			input => input,
			output => output
		);

	-- Add your stimulus here ... 
		   
	 p : process
    begin	
        -- Reset
        reset <= '1';
        wait for 10 ns;
        reset <= '0';	 
		wait for 10 ns;
        input <= '1';
        wait for 10 ns;
        input <= '1';
        wait for 10 ns;
        input <= '1';
        wait for 10 ns;
        input <= '1';
        wait for 10 ns;
        input <= '0';		   
		wait for 100 ns;
        wait;
    end process p;


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_moore of moore_tb is
	for TB_ARCHITECTURE
		for UUT : moore
			use entity work.moore(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_moore;

