library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity q3_tb is
end q3_tb;

architecture TB_ARCHITECTURE of q3_tb is
	-- Component declaration of the tested unit
	component q3
	port(
		u : in STD_LOGIC_VECTOR(15 downto 0);
		b : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal u : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal b : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q3
		port map (
			u => u,
			b => b
		);

	-- Add your stimulus here ... 
	process
	begin
		wait for 10ns;
		u <= "0000000000011111";	
		wait for 10ns;
		u <= "0001100011000000";
		wait for 10ns;
		u <= "1111111000000000";
		wait for 10ns;
		u <= "0000000110011111";
		wait for 10ns;
		u <= "0000111001110000";
		wait for 10ns;
		u <= "1011111111111111";
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q3 of q3_tb is
	for TB_ARCHITECTURE
		for UUT : q3
			use entity work.q3(nmd);
		end for;
	end for;
end TESTBENCH_FOR_q3;

