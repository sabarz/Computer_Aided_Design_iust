library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ff is

    function bcdBinary(BCD: std_logic_vector; len: integer) return unsigned;
    function reverser(Binary: std_logic_vector) return std_logic_vector;

end ff;

package body ff is

    function bcdBinary(BCD: std_logic_vector; len : integer) 
	return unsigned is
	
	variable inn: integer;
	variable r: unsigned(len-5 downto 0);	 
		
		
	begin
	    inn := to_integer(unsigned(BCD));				
		report "Element(" & integer'image(inn) & ") " ;
	   
		if BCD'length <= 4 then
	        return to_unsigned(inn, 4);
	    
		else
	        r := bcdBinary(BCD(BCD'high-1 downto 4), len-4);
	        
			return r * 10 + to_unsigned(to_integer(unsigned(BCD(4 downto 0))), 4);
	    end if;
	end bcdBinary;


    function reverser(Binary: std_logic_vector) 
	return std_logic_vector is
    begin
        
		if Binary'length = 1 then    
			return Binary;		 
			
        else        
			return  reverser(Binary(Binary'high-1 downto 0)) & Binary(Binary'high);
		end if;
    end reverser;

end ff;
	   




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;		
use work.ff.all;

entity hi is   
	
  generic (
    len : positive
  );
  port (
	 inp : in std_logic_vector(len-1 downto 0);  
	 op : in integer;
     outp1 : out std_logic_vector(len-1 downto 0);
	 outp2 : out unsigned
  );
end entity hi;

architecture Behavioral of hi is
begin
  process (op)
  begin	 
	  
	if op = 1 then	 
		outp2 <= bcdBinary(inp, len);

	elsif op = 2 then	   
		outp1 <= reverser(inp);
	
	end if; 
  
	end process; 
	
end architecture Behavioral;   





library std;
use std.ENV.all;
library hw3;
use hw3.ff.all;	  
use work.ff.all; 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

	-- Add your library and packages declaration here ...

entity hi_tb is
	-- Generic declarations of the tested unit
		generic(
		len : POSITIVE );
end hi_tb;

architecture TB_ARCHITECTURE of hi_tb is
	-- Component declaration of the tested unit
	component hi
		generic(
		len : POSITIVE );
	port(
		inp : in STD_LOGIC_VECTOR(len-1 downto 0);
		op : in INTEGER;
		outp1 : out STD_LOGIC_VECTOR(len-1 downto 0);
		outp2 : out UNSIGNED );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal inp : STD_LOGIC_VECTOR(len-1 downto 0);
	signal op : INTEGER;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal outp1 : STD_LOGIC_VECTOR(len-1 downto 0);
	signal outp2 : UNSIGNED(len-1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : hi
		generic map (
			len => len
		)

		port map (
			inp => inp,
			op => op,
			outp1 => outp1,
			outp2 => outp2
		);

	-- Add your stimulus here ...	  
	
	
	
	stimulus : process 
	begin	  
		inp <= "01001" ;
		op <= 2;
	wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_hi of hi_tb is
	for TB_ARCHITECTURE
		for UUT : hi
			use entity work.hi(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_hi;

