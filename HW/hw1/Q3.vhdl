library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q3 is
    port (
       	u : in std_logic_vector(15 downto 0);
        b : out std_logic_vector(3 downto 0)
    );
end entity q3;

architecture nmd of q3 is
begin
    process(u)
        variable tmp : integer := 0;
    	begin
        for i in 0 to 15 loop
            if u(i) = '1' then
                tmp := tmp + 1;
            end if;
        end loop;

        case tmp is
            when 0 =>
                b <= "0000";
            when 1 =>
                b <= "0001";
            when 2 =>
                b <= "0010";
            when 3 =>
                b <= "0011";
            when 4 =>
				b <= "0100";
            when 5 =>
                b <= "0101";
            when 6 =>
                b <= "0110";
            when 7 =>
                b <= "0111";
            when 8 =>
                b <= "1000";
            when 9 =>
                b <= "1001";
            when 10 =>
                b <= "1010";
            when 11 =>
                b <= "1011";
            when 12 =>
                b <= "1100";
            when 13 =>
                b <= "1101";
            when 14 =>
                b <= "1110";
            when 15 =>
                b <= "1111";
            when others =>
                b <= "0000";
        end case;
		tmp := 0;
    end process; 
	
end architecture nmd;	 


library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity q3_tb is
end q3_tb;

architecture TB_ARCHITECTURE of q3_tb is
	-- Component declaration of the tested unit
	component q3
	port(
		u : in STD_LOGIC_VECTOR(15 downto 0);
		b : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal u : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal b : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q3
		port map (
			u => u,
			b => b
		);

	-- Add your stimulus here ... 
	process
	begin
		wait for 10ns;
		u <= "0000000000011111";	
		wait for 10ns;
		u <= "0001100011000000";
		wait for 10ns;
		u <= "1111111000000000";
		wait for 10ns;
		u <= "0000000110011111";
		wait for 10ns;
		u <= "0000111001110000";
		wait for 10ns;
		u <= "1011111111111111";
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q3 of q3_tb is
	for TB_ARCHITECTURE
		for UUT : q3
			use entity work.q3(nmd);
		end for;
	end for;
end TESTBENCH_FOR_q3;

