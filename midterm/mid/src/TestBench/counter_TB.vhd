library ieee;
use ieee.MATH_REAL.all;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity counter_tb is
end counter_tb;

architecture TB_ARCHITECTURE of counter_tb is
	-- Component declaration of the tested unit
	component counter
	port(
		clk : in STD_LOGIC;
		Clear : in STD_LOGIC;
		Preset : in STD_LOGIC;
		Count : in STD_LOGIC;
		Output : out STD_LOGIC_VECTOR(11 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal Clear : STD_LOGIC;
	signal Preset : STD_LOGIC;
	signal Count : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Output : STD_LOGIC_VECTOR(11 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : counter
		port map (
			clk => clk,
			Clear => Clear,
			Preset => Preset,
			Count => Count,
			Output => Output
		);

	-- Add your stimulus here ... 
	
	process
	begin
		wait for 100ns;
	 	clk <= '0';
		Clear <= '1';
		Preset <='0';
		Count <= '0';
		wait for 10ns;
		clk <= '1';
		Clear <='1';
		Preset <= '0';
		Count <= '0';	 
		wait for 10ns;
		clk <= '0';
		Clear <='1';
		Preset <= '0';
		Count <= '0';
		wait for 10ns;
		clk <= '1';
		Clear <='0';
		Preset <= '1';
		Count <= '0';
		wait for 10ns;
		clk <= '0';
		Clear <='1';
		Preset <= '0';
		Count <= '0';  
		wait for 10ns;
		clk <= '1';
		Clear <='0';
		Preset <= '0';
		Count <= '1';
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_counter of counter_tb is
	for TB_ARCHITECTURE
		for UUT : counter
			use entity work.counter(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_counter;

