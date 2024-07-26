library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity q_tb is
	-- Generic declarations of the tested unit
		generic(
		N : INTEGER := 21 );
end q_tb;

architecture TB_ARCHITECTURE of q_tb is
	-- Component declaration of the tested unit
	component q
		generic(
		N : INTEGER := 21 );
	port(
		clk : in STD_LOGIC;
		input : in STD_LOGIC;
		fs : out STD_LOGIC_VECTOR(N-1 downto 0);
		ls : out STD_LOGIC_VECTOR(N-1 downto 0);
		fe : out STD_LOGIC_VECTOR(N-1 downto 0);
		le : out STD_LOGIC_VECTOR(N-1 downto 0);
		index : out INTEGER );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC := '0';
	signal input : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal fs : STD_LOGIC_VECTOR(N-1 downto 0);
	signal ls : STD_LOGIC_VECTOR(N-1 downto 0);
	signal fe : STD_LOGIC_VECTOR(N-1 downto 0);
	signal le : STD_LOGIC_VECTOR(N-1 downto 0);
	signal index : INTEGER;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q
		generic map (
			N => N
		)

		port map (
			clk => clk,
			input => input,
			fs => fs,
			ls => ls,
			fe => fe,
			le => le,
			index => index
		);

	-- Add your stimulus here ... 
	
	clk_process : process
	begin
		-- Toggle the clock every 10 ns
		while now < 1000 ns loop
			clk <= '0';
			wait for 5 ns;
			clk <= '1';
			wait for 5 ns;
		end loop;
		wait;
	end process;  
	
	process --sample of pdf:
	begin
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '0';
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
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '1';
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
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '1';
		wait for 10 ns;
	
	end process;

end TB_ARCHITECTURE;


configuration TESTBENCH_FOR_q of q_tb is
	for TB_ARCHITECTURE
		for UUT : q
			use entity work.q(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_q;

