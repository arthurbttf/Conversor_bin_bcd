library ieee;
use ieee.std_logic_1164.all;

entity add3 is 
    port
    (
        A: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(3 downto 0)
    );
end add3;

architecture ckt of add3 is
begin
    S(0) <= (A(3) and not A(0)) or (A(0) and not A(3) and not A(2)) or (A(1) and not A(0) and A(2));
    S(1) <= (A(3) and not A(0)) or (A(1) and A(0)) or (A(1) and not A(2));
    S(2) <= (A(0) and A(3)) or (A(2) and not A(1) and not A(0));
    S(3) <= (A(3)) or (A(1) and A(2)) or (A(0) and A(2));
end ckt;