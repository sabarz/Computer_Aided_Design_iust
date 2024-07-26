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
    function add_matrix(A, B: matrix) return matrix;
    function multi_matrix(A, B: matrix) return matrix;
	impure function get_random return integer;
	procedure fill_matrix(inp : out matrix);
    procedure print_matrix(M: matrix);

end my_matrix;


package body my_matrix is
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
 
	procedure fill_matrix(inp : out matrix) is
		
	  begin
	    for i in inp'range(1) loop
	      for j in inp'range(2) loop
	        inp(i, j).Reall := get_random;
	        inp(i, j).Imaginary := get_random;
	      end loop;
	    end loop;
	 end procedure;
  
end my_matrix;





