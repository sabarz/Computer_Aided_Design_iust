library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

	-- Add your library and packages declaration here ...

entity calculator_tb is
end calculator_tb;

architecture TB_ARCHITECTURE of calculator_tb is
	-- Component declaration of the tested unit
	component calculator
	port(
		A : in STD_LOGIC_VECTOR(1 downto 0);
		B : in STD_LOGIC_VECTOR(1 downto 0);
		s : in STD_LOGIC_VECTOR(1 downto 0);
		o : out STD_LOGIC_VECTOR(1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(1 downto 0);
	signal B : STD_LOGIC_VECTOR(1 downto 0);
	signal s : STD_LOGIC_VECTOR(1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal o : STD_LOGIC_VECTOR(1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : calculator
		port map (
			A => A,
			B => B,
			s => s,
			o => o
		);

	-- Add your stimulus here ...
	process
	begin
		wait for 10ns;
		A <= "01";
		B <= "01";
		s <= "11";
		wait for 10ns;
		A <= "10";
		B <= "01";
		s <= "10";
		wait for 10ns;
		A <= "00";
		B <= "10";
		s <= "01"; 
		wait for 10ns;
		A <= "01";
		B <= "01";
		s <= "00";
		wait;
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_calculator of calculator_tb is
	for TB_ARCHITECTURE
		for UUT : calculator
			use entity work.calculator(qq2);
		end for;
	end for;
end TESTBENCH_FOR_calculator;

