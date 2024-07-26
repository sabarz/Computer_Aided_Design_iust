library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;
use ieee.math_real.uniform;	  
use ieee.math_real.floor;

package my_matrix is
    type Complex is record
        Reall: integer;
        Imaginary: integer;
    end record;
    type matrix is array (natural range <>, natural range <>) of Complex;
	procedure fill_matrix(inp : out matrix);
    procedure print_matrix(M: matrix);	 
	impure function get_random return integer;
	function add_matrix(A, B: matrix) return matrix;
    function multi_matrix(A, B: matrix) return matrix;

end my_matrix;


package body my_matrix is 
	
		 
    function multi_matrix(A, B: matrix) return matrix is
        variable r: matrix(A'range(1), B'range(2));
    begin
        for i in A'range(1) loop
            for j in B'range(2) loop
                r(i, j).Reall := 0;
                r(i, j).Imaginary := 0;
                for k in A'range(2) loop
                    r(i, j).Reall := r(i, j).Reall + (A(i, k).Reall * B(k, j).Reall) - (A(i, k).Imaginary * B(k, j).Imaginary);
                    r(i, j).Imaginary := r(i, j).Imaginary + (A(i, k).Reall * B(k, j).Imaginary) + (A(i, k).Imaginary * B(k, j).Reall);
                end loop;
            end loop;
        end loop;
        return r;
    end multi_matrix;
	
    function add_matrix(A, B: matrix) return matrix is
        variable r: matrix(A'range(1), A'range(2));
    begin
        for i in A'range(1) loop
            for j in A'range(2) loop
                r(i, j).Reall := A(i, j).Reall + B(i, j).Reall;
                r(i, j).Imaginary := A(i, j).Imaginary + B(i, j).Imaginary;
            end loop;
        end loop;
        return r;
    end add_matrix; 
	
	  
	procedure fill_matrix(inp : out matrix) is
		
	  begin
	    for i in inp'range(1) loop
	      for j in inp'range(2) loop
	        inp(i, j).Reall := get_random;
	        inp(i, j).Imaginary := get_random;
	      end loop;
	    end loop;
	 end procedure;
	 


	impure function get_random return integer is
	variable num : integer ;	 
	variable x : real;	  
	variable seed1 : positive;
    variable seed2 : positive;	  
	variable y : integer;
    begin 				
	seed1 := 1;
    	seed2 := 1;
	uniform(seed1,seed2,x);	
	y := integer(x) * (80 - 10) + 10;
        return y;
    end get_random;
	
    procedure print_matrix(M: matrix) is
    begin
        for i in M'range(1) loop
            for j in M'range(2) loop
                report "Element(" & integer'image(i) & "," & integer'image(j) & "): " &
                       "realx = " & integer'image(M(i, j).Reall) & ", " &
                       "Imaginary = " & integer'image(M(i, j).Imaginary);
            end loop;
        end loop;
    end print_matrix;

  
end my_matrix;





  






library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;		
use work.my_matrix.all;

entity nmd is
  generic (
    rows : positive;
    cols : positive  
  );
  port (
	  f : in matrix(rows-1 downto 0, rows-1 downto 0);
	  s: in matrix(rows-1 downto 0, rows-1 downto 0);  
	  op : in integer;
    outp : out Matrix 
  );
end entity nmd;

architecture Behavioral of nmd is
begin
  process (op)
  variable temp : Complex ;
  variable vay : matrix(rows-1 downto 0, rows-1 downto 0) := f;
  begin	
	
	  if op = 1 then	 
		outp <= add_matrix(f, s);
	
	elsif op = 2 then	   
		outp <= multi_matrix(f, s);
	
	elsif op = 3 then	 
		fill_matrix(vay);
		outp <= vay;
	
	elsif op = 4 then	   
		print_matrix(f);	
		print_matrix(s);
	end if; 
  end process;
end architecture Behavioral;



library hw3;
use hw3.my_matrix.all;	  
use work.my_matrix.all;

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
	signal outp : matrix(1 downto 0, 1 downto 0);

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
	
	
	stimulus : process 
	
	variable n1 : Complex := (Reall => 5, Imaginary => 2); 
	variable n2 : Complex := (Reall => 2, Imaginary => 8); 
	variable n3 : Complex := (Reall => 10, Imaginary => 9); 
	variable n4 : Complex := (Reall => 7, Imaginary => 1); 
	variable n5 : Complex := (Reall => 2, Imaginary => 2); 
	variable n6 : Complex := (Reall => 8, Imaginary => 3); 
	variable n7 : Complex := (Reall => 6, Imaginary => 4); 
	
	begin	  
		f <= ((n1,n2),(n3,n4));	
		s <= ((n5,n6),(n7,n1));
		op <= 3;
	wait;
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_nmd of nmd_tb is
	for TB_ARCHITECTURE
		for UUT : nmd
			use entity work.nmd(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_nmd;

