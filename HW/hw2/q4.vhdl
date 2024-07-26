library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all; 
use ieee.numeric_std.ALL ;

entity q4 is
	port (
		clk : in std_logic;
        reset : in std_logic;
        set_clock : in std_logic;
        set_alarm : in std_logic;
        stop_alarm : in std_logic;
        houri1 : in std_logic_vector(1 downto 0);
        houri0 : in std_logic_vector(3 downto 0);
        mini1 : in std_logic_vector(3 downto 0);
        mini0 : in std_logic_vector(3 downto 0);
        
		hour1 : out std_logic_vector(1 downto 0);
        hour0 : out std_logic_vector(3 downto 0);
        min1 : out std_logic_vector(3 downto 0);
        min0 : out std_logic_vector(3 downto 0);
        alarm_on : out std_logic
		);
end q4;


architecture qq4 of q4 is  
	signal alarm_hour1 : std_logic_vector(1 downto 0);
    signal alarm_hour0 : std_logic_vector(3 downto 0);
    signal alarm_min1 : std_logic_vector(3 downto 0);
    signal alarm_min0 : std_logic_vector(3 downto 0);  
	signal my_hour1 : integer := 0;
    signal my_hour0 : integer := 0;
    signal my_min1 : integer := 0;
    signal my_min0 : integer := 0;
    signal sec : integer := 0;

begin
	    process (clk)
	    begin
	        if rising_edge(clk) then
	            if reset = '1' then
	                my_hour1 <= 0;
	                my_hour0 <= 0;
	                my_min1 <= 0;
	                my_min0 <= 0;
	            elsif set_clock = '1' then
	                my_hour1 <= to_integer(unsigned(houri1));
	                my_hour0 <= to_integer(unsigned(houri0));
	                my_min1 <= to_integer(unsigned(mini1));
	                my_min0 <= to_integer(unsigned(mini0));
	            elsif set_alarm = '1' then
	                alarm_hour1 <= houri1;
	                alarm_hour0 <= houri0;
	                alarm_min1 <= mini1;
	                alarm_min0 <= mini0;
	            end if;
	
	            if my_min0 = to_integer(unsigned(alarm_min0)) and my_min1 = to_integer(unsigned(alarm_min1)) and my_hour0 = to_integer(unsigned(alarm_hour0)) and my_hour1 = to_integer(unsigned(alarm_hour1)) then
	                alarm_on <= '1';
	            end if;
	
	            if stop_alarm = '1' then
	                alarm_on <= '0';
	            end if;
	
	            sec <= sec + 1;
	            if sec = 60 then
	                my_min0 <= my_min0 + 1;
	            end if;
	            if my_min0 = 60 then
	                my_min1 <= my_min1 + 1;
	                my_min0 <= 0;
	            end if;
	            if my_min1 = 60 then
	                my_hour0 <= my_hour0 + 1;
	                my_min1 <= 0;
	            end if;
	            if my_hour0 = 10 then
	                my_hour1 <= my_hour1 + 1;
	                my_hour0 <= 0;
	            end if;
	            if my_hour1 = 24 then
	                my_hour1 <= 0;
	            end if;
	        end if;	 
			
			hour1 <= std_logic_vector(to_unsigned(my_hour1 , 2));
			hour0 <= std_logic_vector(to_unsigned(my_hour0 , 4));
			min1 <= std_logic_vector(to_unsigned(my_min1 , 4));
			min0 <= std_logic_vector(to_unsigned(my_min0 , 4));
			
	    end process;   
end qq4; 	



library ieee;
use ieee.MATH_REAL.all;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity q4_tb is
end q4_tb;

architecture TB_ARCHITECTURE of q4_tb is
	-- Component declaration of the tested unit
	component q4
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		set_clock : in STD_LOGIC;
		set_alarm : in STD_LOGIC;
		stop_alarm : in STD_LOGIC;
		houri1 : in STD_LOGIC_VECTOR(1 downto 0);
		houri0 : in STD_LOGIC_VECTOR(3 downto 0);
		mini1 : in STD_LOGIC_VECTOR(3 downto 0);
		mini0 : in STD_LOGIC_VECTOR(3 downto 0);
		hour1 : out STD_LOGIC_VECTOR(1 downto 0);
		hour0 : out STD_LOGIC_VECTOR(3 downto 0);
		min1 : out STD_LOGIC_VECTOR(3 downto 0);
		min0 : out STD_LOGIC_VECTOR(3 downto 0);
		alarm_on : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal set_clock : STD_LOGIC;
	signal set_alarm : STD_LOGIC;
	signal stop_alarm : STD_LOGIC;
	signal houri1 : STD_LOGIC_VECTOR(1 downto 0);
	signal houri0 : STD_LOGIC_VECTOR(3 downto 0);
	signal mini1 : STD_LOGIC_VECTOR(3 downto 0);
	signal mini0 : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal hour1 : STD_LOGIC_VECTOR(1 downto 0);
	signal hour0 : STD_LOGIC_VECTOR(3 downto 0);
	signal min1 : STD_LOGIC_VECTOR(3 downto 0);
	signal min0 : STD_LOGIC_VECTOR(3 downto 0);
	signal alarm_on : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q4
		port map (
			clk => clk,
			reset => reset,
			set_clock => set_clock,
			set_alarm => set_alarm,
			stop_alarm => stop_alarm,
			houri1 => houri1,
			houri0 => houri0,
			mini1 => mini1,
			mini0 => mini0,
			hour1 => hour1,
			hour0 => hour0,
			min1 => min1,
			min0 => min0,
			alarm_on => alarm_on
		);

	-- Add your stimulus here ...
	
	process
	begin
		wait for 100ns;
		clk <= '0';
		reset <= '0';
        set_clock <= '0';
        set_alarm <= '0';
        stop_alarm <= '0';
        houri1 <= "00";
        houri0 <= "0000";
        mini1 <= "0000";
        mini0 <= "0000";
		
		wait for 10ns;
		clk <= '1';
		reset <= '0';
        set_clock <= '1';
        set_alarm <= '0';
        stop_alarm <= '0';
        houri1 <= "10";
        houri0 <= "0100";
        mini1 <= "0011";
        mini0 <= "1100";
		
		wait for 10ns;
		clk <= '1';
		reset <= '0';
        set_clock <= '0';
        set_alarm <= '1';
        stop_alarm <= '0';
        houri1 <= "01";
        houri0 <= "1111";
        mini1 <= "0001";
        mini0 <= "1000";
		
		wait for 10ns;
		clk <= '1';
		reset <= '0';
        set_clock <= '0';
        set_alarm <= '0';
        stop_alarm <= '1';
        houri1 <= "00";
        houri0 <= "0110";
        mini1 <= "1100";
        mini0 <= "0101";
		
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q4 of q4_tb is
	for TB_ARCHITECTURE
		for UUT : q4
			use entity work.q4(qq4);
		end for;
	end for;
end TESTBENCH_FOR_q4;


