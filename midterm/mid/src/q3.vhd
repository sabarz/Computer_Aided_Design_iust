LIbrary ieee;
use ieee.std_logic_1164.all;   
USE ieee.numeric_std.All;


entity flip_flop is
    port (
      D   : in std_logic;
      T   : in std_logic;
      R   : in std_logic;
      clk : in std_logic;
      TQ  : inout std_logic;
      DQ  : out std_logic
    );
end entity flip_flop;


architecture behavioral of flip_flop is

begin

    flip_flop_block : block

        type TD is record
          TQ : std_logic;
          DQ : std_logic;
        end record;

        type state is array (natural range 0 to 7) of TD;

        signal present_state : natural range 0 to 7 := 0;

        constant next_state : state := (
            (TQ => '0', DQ => '0'),
            (TQ => '1', DQ => '0'),
            (TQ => '1', DQ => '0'),
            (TQ => '0', DQ => '1'),
            (TQ => '0', DQ => '1'),
            (TQ => '0', DQ => '1'),
            (TQ => '0', DQ => '0'),
            (TQ => '1', DQ => '0')
        );

    begin

        process(clk)

        begin

            if rising_edge(clk) then

                TQ <= '0';
                DQ <= '0';

                present_state <= 0;
              else 
                TQ <= next_state(present_state).TQ;
                DQ <= next_state(present_state).DQ;

                if T = '1' then 
                  TQ <= not TQ;
                end if;
  
                present_state <= to_integer(unsigned(D & T & R));
              end if;

        end process;

    end block flip_flop_block;

end architecture behavioral;