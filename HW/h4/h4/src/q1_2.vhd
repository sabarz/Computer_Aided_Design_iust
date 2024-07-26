library ieee;
use ieee.std_logic_1164.all;

entity moore is
    port (
        clk     : in  std_logic;
        reset   : in  std_logic;
        input   : in  std_logic;
        output  : out std_logic
    );
end entity moore ;

architecture Behavioral of Moore is
    type state is (S0, S1, S2, S3);
    signal current_state, next_state : state;
begin
    process (clk, reset)
    begin
      		if reset = '1' then
            current_state <= S0;
        
		elsif (clk'event and clk ='1') then
    
        case current_state is
            when S0 =>
                if input = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
                
            when S1 =>
                if input = '1' then
                    next_state <= S2;
                else
                    next_state <= S0;
                end if;
                
            when S2 =>
                if input = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;
                
            when S3 =>
                if input = '0' then
                    next_state <= S0;
                else
                    next_state <= S3;
                end if;

            when others =>
                next_state <= S0;
        end case;
		end if;
    end process;

    	output <= '1' when (current_state = S0 and input = '0') else '0';	 

end architecture Behavioral;	




library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity moore_tb is
end moore_tb;

architecture TB_ARCHITECTURE of moore_tb is
	-- Component declaration of the tested unit
	component moore
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		input : in STD_LOGIC;
		output : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal input : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : moore
		port map (
			clk => clk,
			reset => reset,
			input => input,
			output => output
		);

	-- Add your stimulus here ... 
		   
	 p : process
    begin	
        -- Reset
        reset <= '1';
        wait for 10 ns;
        reset <= '0';	 
		wait for 10 ns;
        input <= '1';
        wait for 10 ns;
        input <= '1';
        wait for 10 ns;
        input <= '1';
        wait for 10 ns;
        input <= '1';
        wait for 10 ns;
        input <= '0';		   
		wait for 100 ns;
        wait;
    end process p;


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_moore of moore_tb is
	for TB_ARCHITECTURE
		for UUT : moore
			use entity work.moore(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_moore;

