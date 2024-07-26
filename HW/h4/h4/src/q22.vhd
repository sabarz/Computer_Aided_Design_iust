library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity q2 is
    generic (
        n : positive := 17
    );
    port (
        clk : in std_logic;
        reset : in std_logic;
        input : in std_logic_vector(n-1 downto 0);
        output : out std_logic_vector(n-1 downto 0)
    );
end q2;

architecture behavioral of q2 is

    type state_machine1 is (S0, S1, S2, S3, S4, S5, S6, S7);
    type state_machine2 is (S01, S11, S21, S31, S41, S51);
    
	signal state          : state_machine1;
    signal state1        : state_machine2;	
	
	signal temp1  : std_logic_vector(n-1 downto 0);
    signal temp2  : std_logic_vector(n-1 downto 0);	
	
    signal index1 : unsigned(4 downto 0);
    signal index2 : unsigned(4 downto 0);

begin
    process (clk, reset)
    begin
        if reset = '1' then	
           
			state1 <= S01;
            index2 <= (others => '0');
            temp2  <= (others => '0');
			state <= S0;
            index1 <= (others => '0');
            temp1  <= (others => '0');
 
		
		
		elsif rising_edge(clk) then
            
			if index1 = n-1 then
               
				null;
			else 		
	            
				case state is
	                when S0 =>
	            
					if input(to_integer(index1)) = '1' then
	                        state <= S1;
	                
					end if;
					index1 <= index1 + 1; 
					
	                when S1 =>
	                    if input(to_integer(index1)) = '0' then
	                        state <= S2;
	                    end if;
	                    index1 <= index1 + 1;  
						
	                when S2 =>
	                    if input(to_integer(index1)) = '0' then
	                        state <= S3;
	                    end if;
	                    index1 <= index1 + 1;
	              
					when S3 =>
	                    if input(to_integer(index1)) = '1' then
	                        state <= S4;
	                    end if;
	                    index1<= index1 + 1;  
						
	                when S4 =>
	                    if index1(to_integer(index1)) = '0' then
	                        state <= S5;
	                    end if;					  
	                    index1 <= index1 + 1;	
						
	                when S5 =>
	                    if input(to_integer(index1)) = '0' then
	                        state <= S6;
	                    end if;
	                    index1 <= index1 + 1; 
						
	                when S6 =>
	                    if input(to_integer(index1)) = '1' then
	                        temp1 <= not input;
	                        state <= S7;
	                    else
	                        index1 <= index1 + 1;
	                    end if;	 
						
						
	                when S7 =>
	                    null;
	            end case;	
            end if;

            if index2 = n-1 then 
                null;
            else  
	            case state1 is	
					
	                when S01 =>
	                    if input(to_integer(index2)) = '0' then
	                        state1 <= S11;
	                    end if;
	                    index2 <= index2 + 1;
						
	                when S11 =>
	                    if input(to_integer(index2)) = '0' then
	                        state1 <= S21;
	                    end if;
	                    index2 <= index2 + 1;
						
	                when S21 =>
	                    if input(to_integer(index2)) = '1' then
	                        state1 <= S31;
	                    end if;
	                    index2 <= index2 + 1;
						
	                when S31 =>
	                    if input(to_integer(index2)) = '0' then
	                        state1 <= S41;
	                    end if;
	                    index2 <= index2 + 1;
						
	                when S41 =>
					if input(to_integer(index2)) = '0' then
						
	                        temp2 <= std_logic_vector(unsigned(input) + 1);
	                        state1 <= S51;
					end if;	 
					
	                    index2 <= index2 + 1;
	                
						when S51 =>
	                    null;
	            end case;            
            end if;
        end if;
    end process;

    output <= (not input) when state = S7 
			else
				std_logic_vector(unsigned(input) + 1) when state1 = S51 
		else input; 

end behavioral;		 




library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity q2_tb is
	-- Generic declarations of the tested unit
		generic(
		n : POSITIVE := 17 );
end q2_tb;

architecture TB_ARCHITECTURE of q2_tb is
	-- Component declaration of the tested unit
	component q2
		generic(
		n : POSITIVE := 17 );
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		input : in STD_LOGIC_VECTOR(n-1 downto 0);
		output : out STD_LOGIC_VECTOR(n-1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal input : STD_LOGIC_VECTOR(n-1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC_VECTOR(n-1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q2
		generic map (
			n => n
		)

		port map (
			clk => clk,
			reset => reset,
			input => input,
			output => output
		);

	-- Add your stimulus here ...	
	
	
	CC: process 
	begin
		clk <= '0';
		wait for 5ns;
		
		clk <= '1';
		wait for 5ns;
	end process;   
	
	process 
	begin
		wait for 100ns;
		reset <= '1';
		
		wait for 10ns;
		reset <= '0';
		input <= "00111100011110001";
		
		wait for 300ns;
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q2 of q2_tb is
	for TB_ARCHITECTURE
		for UUT : q2
			use entity work.q2(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_q2;

