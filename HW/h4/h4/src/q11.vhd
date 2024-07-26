library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q is
    generic (
        N : integer := 21
    );
    port (
	
	clk: in  std_logic; 
    input : in  std_logic;
    fs: out std_logic_vector(N-1 downto 0);	 
	ls: out std_logic_vector(N-1 downto 0);
	fe: out std_logic_vector(N-1 downto 0); 
	le: out std_logic_vector(N-1 downto 0);
	index: out integer	range 0 to 255

	);			
	
end q;

architecture Behavioral of q is
type state is (S0, S1, S2, S3, S4);
    signal  temp  : integer range 0 to N := 0;
    signal  current_state : state := S0;	
	signal  hold1s  : integer range 0 to N := 0;
	signal	hold1e : integer range 0 to N := 0;
	signal	hold2s  : integer range 0 to N := 0;
	signal	hold2e  : integer range 0 to N := 0;

begin	  
    process (clk)
    begin
		
		if rising_edge(clk) then
		
			temp <= temp + 1;
			index <= temp;
			
			case current_state is
				
	                when S0 =>
	                    if input = '1' then
							
							current_state <= S1;
	                    
						end if;

	                when S1 =>	
					
					if input = '0' then	
						
	                        hold1s  <= temp - 1;
							hold1e  <= temp - 1;
							hold2s  <= temp - 1; 
							hold2e  <= temp - 1;
							current_state <= S2;		
							
	                    end if;	
						
	                when S2 =>
	                    if input = '0' then
	                        hold1e <= temp;
							hold2e <= temp;
						else
							current_state <= S3;
	                    end if;	 
						
						
	                when S3 =>
	                    if input = '0' then
	                        
							hold2s <= temp;
							current_state <= S4;
	                    end if;	  
						
						
	                when S4 =>
	                    if input = '0' then
	                        hold2e <= temp;
							
						else			  	
							current_state <= S3; 
							
	                    end if;	  
						
	                    temp <= temp + 1;	

					when others => 
					current_state <= S0;
            end case;
		end if;
    end process; 
	
	fe <= std_logic_vector(to_unsigned(hold1e, fe'length));
	le <= std_logic_vector(to_unsigned(hold2e, le'length));
	
    fs <= std_logic_vector(to_unsigned(hold1s, fs'length));
	ls <= std_logic_vector(to_unsigned(hold2s, ls'length)); 

	
end Behavioral;	 














library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity q_tb is
	-- Generic declarations of the tested unit
		generic(
		N : INTEGER := 21 );
end q_tb;

architecture TB_ARCHITECTURE of q_tb is
	-- Component declaration of the tested unit
	component q
		generic(
		N : INTEGER := 21 );
	port(
		clk : in STD_LOGIC;
		input : in STD_LOGIC;
		fs : out STD_LOGIC_VECTOR(N-1 downto 0);
		ls : out STD_LOGIC_VECTOR(N-1 downto 0);
		fe : out STD_LOGIC_VECTOR(N-1 downto 0);
		le : out STD_LOGIC_VECTOR(N-1 downto 0);
		index : out INTEGER );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC := '0';
	signal input : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal fs : STD_LOGIC_VECTOR(N-1 downto 0);
	signal ls : STD_LOGIC_VECTOR(N-1 downto 0);
	signal fe : STD_LOGIC_VECTOR(N-1 downto 0);
	signal le : STD_LOGIC_VECTOR(N-1 downto 0);
	signal index : INTEGER;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q
		generic map (
			N => N
		)

		port map (
			clk => clk,
			input => input,
			fs => fs,
			ls => ls,
			fe => fe,
			le => le,
			index => index
		);

	-- Add your stimulus here ... 
	
	ll : process
	begin
	
		while now < 500 ns loop
			clk <= '0';
			wait for 5 ns;
			
			clk <= '1';
			wait for 5 ns;
		
		end loop;
		wait;
	end process;  
	
	process 
	begin
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '0';
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
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '1';
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
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '0';
		wait for 10 ns;
		input <= '1';
		wait for 10 ns;
	
	end process;

end TB_ARCHITECTURE;


configuration TESTBENCH_FOR_q of q_tb is
	for TB_ARCHITECTURE
		for UUT : q
			use entity work.q(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_q;


 