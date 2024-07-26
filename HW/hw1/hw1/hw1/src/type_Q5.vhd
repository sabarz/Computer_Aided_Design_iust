library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all; 



package my_complex is
	type complex is record					  
		x : integer;
		y : integer;
	end record;
end my_complex;	 