library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nmd is
    port (
        input  : in  std_logic_vector(2 downto 0);
        output : out std_logic_vector(7 downto 0)
    );
end nmd;

architecture Behavioral of nmd is
begin
    process (input)
    begin
        case input is
           	when "111" =>
			output <= "11111111"; 
			   
			when "110" =>
			output <= "01111111"; 
			
			when "101" =>
			output <= "00111111";  
			
			when "100" =>
			output <= "00011111"; 
			
			when "011" =>
            output <= "00001111";

			when "010" =>
            output <= "00000111"; 
			
			when "001" =>
            output <= "00000011"; 
			
			when "000" =>
            output <= "00000001";
        
            
			when others =>
                output <= "00000000";
        end case;
    end process;
end Behavioral;


library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity nmd_tb is
end nmd_tb;

architecture TB_ARCHITECTURE of nmd_tb is
	-- Component declaration of the tested unit
	component nmd
	port(
		input : in STD_LOGIC_VECTOR(2 downto 0);
		output : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : nmd
		port map (
			input => input,
			output => output
		);

	-- Add your stimulus here ...	  
	process
    begin
        input <= "011";
        wait for 10 ns;

        input <= "111";
        wait for 10 ns;

        input <= "000";
        wait for 10 ns;	 
		
		input <= "100";
        wait for 10 ns;
        
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


