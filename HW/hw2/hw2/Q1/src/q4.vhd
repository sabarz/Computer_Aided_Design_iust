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




