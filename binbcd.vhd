library ieee;
use ieee.std_logic_1164.all;

entity bin2bcd is 
    port
    (
        SW: in std_logic_vector(7 downto 0);
        BCD: out std_logic_vector(11 downto 0)
    );
end bin2bcd;

architecture ckt of bin2bcd is
component add3 is 
    port
    (
        A: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(3 downto 0)
    );
end component;
signal iU1, iU2, iU3, iU4, iU5, iU6, iU7, oU1, oU2, oU3, oU4, oU5, oU6, oU7:  std_logic_vector(3 downto 0);
begin
    --a logica do pdf
    iU1 <= '0' & SW(7 downto 5);
    --3 bits mais significativos da saida 1
    iU2 <= oU1(2 downto 0) & SW(4);
    iU3 <= oU2(2 downto 0) & SW(3);
    iU4 <= oU3(2 downto 0) & SW(2);
    iU5 <= oU4(2 downto 0) & SW(1);
    iU6 <= '0' & oU1(3) & oU2(3) & oU3(3);
    iU7 <= oU6(2 downto 0) & oU4(3);

    U1: add3 port map(iU1,oU1);
    U2: add3 port map(iU2,oU2);
    U3: add3 port map(iU3,oU3);
    U4: add3 port map(iU4,oU4);
    U5: add3 port map(iU5,oU5);
    U6: add3 port map(iU6,oU6);
    U7: add3 port map(iU7,oU7);
    BCD(0) <= SW(0);
    BCD(1) <= oU5(0);
	 BCD(2) <= oU5(1);
	 BCD(3) <= oU5(2);
	 BCD(4) <= oU5(3);
	 BCD(5) <= oU7(0);
	 BCD(6) <= oU7(1);
	 BCD(7) <= oU7(2);
	 BCD(8) <= oU7(3);
    BCD(9) <= oU6(3);
    BCD(10) <= '0';
    BCD(11) <= '0';
end ckt;