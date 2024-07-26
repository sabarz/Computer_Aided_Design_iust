library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity calculator is
    port (
        A : in std_logic_vector(1 downto 0);
        B : in std_logic_vector(1 downto 0);   
        s : in std_logic_vector(1 downto 0);
        o : out std_logic_vector(1 downto 0)
    );
end calculator;    

architecture qq2 of calculator is  
begin 
    process(A,B,s)
    begin
        case s is         
            when "00" =>
                o <= A or B;
            when "01" =>
                o <= A and B;
            when "10" =>
                o <= std_logic_vector(signed(A) - signed(B));
            when "11" =>
                o <= std_logic_vector(signed(A) + signed(B));
            when others =>
                o <= "00";
        end case;
    end process;
end qq2;
