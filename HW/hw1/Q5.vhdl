library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_complex.all;

package my_complex is
	type complex is record					  
		x : integer;
		y : integer;
	end record;
end my_complex;	 

entity q5 is
	port (
	a : in complex;
	b : in complex;
	s : std_logic_vector(1 downto 0);
	o : out complex
		);
end q5;	

architecture qq5 of q5 is
begin
	process(a,b,s)
    begin
        case s is         
            when "00" =>
				o.x <= a.x + b.x;
				o.y	<= a.y + b.y;
            when "01" =>
				o.x <= a.x - b.x;
				o.y	<= a.y - b.y;
            when "10" =>
				o.x <= (a.x * b.x) - (a.y * b.y);
				o.y <= (a.x * b.y) + (a.y * b.x);
            when others =>
                o <= a;
        end case;
    end process;
	
end architecture qq5;

library ieee;
use ieee.NUMERIC_STD.all;
library hw1;
use hw1.my_complex.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity q5_tb is
end q5_tb;

architecture TB_ARCHITECTURE of q5_tb is
	-- Component declaration of the tested unit
	component q5
	port(
		a : in complex;
		b : in complex;
		s : in std_logic_vector(1 downto 0);
		o : out complex );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : complex;
	signal b : complex;
	signal s : STD_LOGIC_VECTOR(1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal o : complex;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q5
		port map (
			a => a,
			b => b,
			s => s,
			o => o
		);

	-- Add your stimulus here ...
	process	
	begin
	    wait for 10ns;
		a.x <= 1;
		a.y <= 2;
		b.x <= 3;
		b.y <= 4;
		s <= "00";
		wait for 10ns;
		a.x <= 11;
		a.y <= 24;
		b.x <= 8;
		b.y <= 2;
		s <= "01";
		wait for 10ns;
		a.x <= 10;
		a.y <= 2;
		b.x <= 3;
		b.y <= 6;
		s <= "10";
		wait;
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q5 of q5_tb is
	for TB_ARCHITECTURE
		for UUT : q5
			use entity work.q5(qq5);
		end for;
	end for;
end TESTBENCH_FOR_q5;

