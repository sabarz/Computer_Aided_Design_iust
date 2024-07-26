library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity Counter is
  port (
    clk  : in  std_logic;
    Clear  : in  std_logic;
    Preset : in  std_logic;
    Count  : in  std_logic;
    Output : out std_logic_vector(11 downto 0)
  );
end entity Counter;

architecture Behavioral of Counter is

signal clk_prev : std_logic := '0';

begin
  process(clk)
  
  variable cnt : integer := 0;
  variable std_number : integer := 99521316;

  begin	   
	  
	  if rising_edge(clk) then
	      if Clear = '1' then
	        cnt := 0;
	      elsif Preset = '0' then
	        cnt := std_number mod 100;
	      elsif Count = '1' and clk_prev = '1' then
	        cnt := cnt + (std_number mod 10);
	      end if;
    end if;
    clk_prev <= clk;   
	
  Output <= std_logic_vector(to_unsigned(cnt, 12));	
  end process;

  
end architecture Behavioral;
