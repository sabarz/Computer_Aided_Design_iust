library hw3;
use hw3.my_matrix.all;

	-- Add your library and packages declaration here ...

entity nmd_tb is
	-- Generic declarations of the tested unit
		generic(
		rows : POSITIVE;
		cols : POSITIVE );
end nmd_tb;

architecture TB_ARCHITECTURE of nmd_tb is
	-- Component declaration of the tested unit
	component nmd
		generic(
		rows : POSITIVE;
		cols : POSITIVE );
	port(
		f : in matrix(rows-1 downto 0,rows-1 downto 0);
		s : in matrix(rows-1 downto 0,rows-1 downto 0);
		op : in INTEGER;
		outp : out matrix );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal f : matrix(rows-1 downto 0,rows-1 downto 0);
	signal s : matrix(rows-1 downto 0,rows-1 downto 0);
	signal op : INTEGER;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal outp : matrix;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : nmd
		generic map (
			rows => rows,
			cols => cols
		)

		port map (
			f => f,
			s => s,
			op => op,
			outp => outp
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_nmd of nmd_tb is
	for TB_ARCHITECTURE
		for UUT : nmd
			use entity work.nmd(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_nmd;

