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

