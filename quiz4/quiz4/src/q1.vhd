library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
    port (
        a, b, cin : in std_logic;
        sum, cout : out std_logic
    );
end entity fulladder;

architecture Behavioral of fulladder is
begin
    sum <= a xor b xor cin;
    cout <= (a and b) or (cin and (a xor b));
	
end architecture Behavioral;


library ieee;
use ieee.std_logic_1164.all;

entity NbitAdder is
    generic (
        N : integer range 2 to 9
    );
    port (
        a, b : in std_logic_vector(N-1 downto 0);
        cin : in std_logic;
        sum : out std_logic_vector(N-1 downto 0);
        cout : out std_logic
    );
end entity NbitAdder;



architecture Behavioral of NbitAdder is
    component FullAdder is
        port ( 
            a, b, cin : in std_logic;
            sum, cout : out std_logic
        );
    end component fulladder;

    signal carry : std_logic;
begin
    FA: for i in 0 to N-1 generate
        FA_inst: FullAdder port map (a(i), b(i), carry, sum(i), carry);
    end generate FA;

    cout <= carry;
end architecture Behavioral;


library ieee;
use ieee.std_logic_1164.all;

entity checkevens is
    generic (
        N : integer range 2 to 9
    );
    port (
        a : in std_logic_vector(N-1 downto 0);
        even : out std_logic
    );
end entity checkevens;

architecture Behavioral of checkevens is

signal ones_count : integer range 0 to N;
begin
    process(a)
    begin
        ones_count <= 0;
        
		for i in 0 to N-1 loop
            if a(i) = '1' then
                ones_count <= ones_count + 1;
            end if;
        end loop;
	
		if ones_count mod 2 = 0 then
            even <= '1';
        else
            even <= '0';
        end if;
    
		end process;
end architecture Behavioral;

library ieee;
use ieee.std_logic_1164.all;

entity OutputGenerator is
    
	generic (
        N : integer range 2 to 9
    );
    
	port (
        nor_out : in std_logic;
        adder_sum : in std_logic_vector(N-1 downto 0);
        output : out std_logic_vector(N-1 downto 0)
    );
end entity OutputGenerator;

architecture Behavioral of OutputGenerator is
begin
    
	process(nor_out, adder_sum)
    begin
        output <= (nor_out & adder_sum);
    
	end process;
end architecture Behavioral;

library ieee;
use ieee.std_logic_1164.all;

entity MainComponent is
    
	generic (
        N : integer range 2 to 9
    );
    
	port (
        A, B : in std_logic_vector(N-1 downto 0);
        C : out std_logic_vector(N-1 downto 0)
    );
end entity MainComponent;

architecture Behavioral of MainComponent is
    component CheckEvenOnes is
        
		generic (
            N : integer range 2 to 9
        );
        
		port (
            a : in std_logic_vector(N-1 downto 0);
            even : out std_logic
        );
  
	end component CheckEvenOnes;

    component NBitAdder is
        
		generic (
            N : integer range 2 to 9
        );
        port (
            a, b : in std_logic_vector(N-1 downto 0);
            cin : in std_logic;
            sum : out std_logic_vector(N-1 downto 0);
            cout : out std_logic
        );
    end component NBitAdder;

    component OutputGenerator is
    
		generic (
            N : integer range 2 to 9
        );
        port (
            nor_out : in std_logic;
            adder_sum : in std_logic_vector(N-1 downto 0);
            output : out std_logic_vector(N-1 downto 0)
        );
    end component OutputGenerator;

    signal nor_out : std_logic;
    signal adder_sum : std_logic_vector(N-1 downto 0);
	
	
begin
    CheckEvenOnes_inst: CheckEvenOnes generic map (N) port map (A, nor_out);

    NBitAdder_inst: NBitAdder generic map (N) port map (A, B, '0', adder_sum, open);

    
	OutputGenerator_inst: OutputGenerator generic map (N) port map (nor_out, adder_sum, C);
end architecture Behavioral;
