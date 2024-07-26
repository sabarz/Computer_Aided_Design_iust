library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all; 
use ieee.numeric_std.ALL;

entity q3 is
	port (
		inpp : in std_logic_vector(16 downto 1);  
		outpp : out std_logic_vector(1 downto 0)
		);
end q3;		   

architecture qq3 of q3 is  
begin
	
	process(inpp)
	
	variable i, j : integer; 
	variable even : integer := 0;
	variable odd : integer := 0;
	
	begin	
		odd := 0;
		even := 0;
		i := 1;
		while i < 17 loop 
			if inpp(i) = '1' then
				odd := odd + 1;	 
			end if;	
			i := i + 2;	
		end loop;  
		
		j := 2;
		while j < 17 loop 
			if inpp(j) = '1' then
				even := even + 1;	 
			end if;	
			j := j + 2;	
		end loop;
		
		if even mod 3 = 0 then
	      outpp(1) <= '1';
	    else
	      outpp(1) <= '0';
	    end if;
	
	    if odd mod 5 = 0 then
	    	outpp(0) <= '1';
	    else
	    	outpp(0) <= '0';
	    end if;	

	end process;

end qq3; 

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


