library ieee;
use ieee.std_logic_1164.all;

package my_package is
   
	function addition(a, b : in std_logic_vector(7 downto 0)) return std_logic_vector;
    function subtraction(a, b : in std_logic_vector(7 downto 0)) return std_logic_vector;
	
end package my_package;

package body my_package is
    function addition(a, b : in std_logic_vector(7 downto 0)) return std_logic_vector is
        variable sum : std_logic_vector(7 downto 0);
    begin
        sum := (a(7) xor b(7)) & (a(6) xor b(6)) & (a(5) xor b(5)) & (a(4) xor b(4)) & 
               (a(3) xor b(3)) & (a(2) xor b(2)) & (a(1) xor b(1)) & (a(0) xor b(0));
        return sum;
    end function addition;

    function subtraction(a, b : in std_logic_vector(7 downto 0)) return std_logic_vector is
        variable diff : std_logic_vector(7 downto 0);
    begin
        diff := (a(7) xor b(7)) & (a(6) xor b(6)) & (a(5) xor b(5)) & (a(4) xor b(4)) & 
                (a(3) xor b(3)) & (a(2) xor b(2)) & (a(1) xor b(1)) & (a(0) xor b(0));
        return diff;
    end function subtraction;
end package body my_package;
