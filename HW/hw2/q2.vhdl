library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all; 
use ieee.numeric_std.ALL ;

entity q2 is
	port (
		input : in std_logic_vector(9 downto 0);  
		output : out std_logic_vector(5 downto 0)
		);
end q2;		   

architecture qq2 of q2 is  
begin
	
	process(input)
	variable tmp : integer := 0;
	variable hold : integer;
	begin
		tmp := 0;
		hold := to_integer(unsigned(input));
		--tmp := 0;
		
		while hold > tmp*tmp loop	
			tmp := tmp + 1;
		end loop;
		
		output <= std_logic_vector(to_unsigned(tmp, 6));
		
	end process;

end qq2; 



library ieee;
use ieee.NUMERIC_STD.all; 
use ieee.std_logic_1164.all;
library Q1;
use Q1.my_package.all;

	-- Add your library and packages declaration here ...

entity q2_tb is
end q2_tb;

architecture TB_ARCHITECTURE of q2_tb is
	-- Component declaration of the tested unit
	component q2
		port(
		input : in STD_LOGIC_VECTOR(9 downto 0);
		output : out STD_LOGIC_VECTOR(5 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR(9 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(5 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q2
		port map (
			input => input,
			output => output
		);

	-- Add your stimulus here ... 
	
	process
	begin
		wait for 100ns;
		input <= "1010100111";  
		
		wait for 100ns;
		input <= "1110101100"; 
		
		wait for 100ns;
		input <= "0101001111";
		
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q2 of q2_tb is
	for TB_ARCHITECTURE
		for UUT : q2
			use entity work.q2(qq2);
		end for;
	end for;
end TESTBENCH_FOR_q2;

library ieee;
use ieee.NUMERIC_STD.all; 
use ieee.std_logic_1164.all;
library Q1;
use Q1.my_package.all;

	-- Add your library and packages declaration here ...

entity q2_tb is
end q2_tb;

architecture TB_ARCHITECTURE of q2_tb is
	-- Component declaration of the tested unit
	component q2
		port(
		input : in STD_LOGIC_VECTOR(9 downto 0);
		output : out STD_LOGIC_VECTOR(5 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR(9 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(5 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q2
		port map (
			input => input,
			output => output
		);

	-- Add your stimulus here ... 
	
	process
	begin
		wait for 100ns;
		input <= "1010100111";  
		
		wait for 100ns;
		input <= "1110101100"; 
		
		wait for 100ns;
		input <= "0101001111";
		
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q2 of q2_tb is
	for TB_ARCHITECTURE
		for UUT : q2
			use entity work.q2(qq2);
		end for;
	end for;
end TESTBENCH_FOR_q2;

