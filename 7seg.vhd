library ieee;
use ieee.std_logic_1164.all;

entity display is 
    port
    (
        BCDin: in std_logic_vector(3 downto 0);
        HEX: out std_logic_vector(6 downto 0)
    );
end display;

architecture logica of display is
    signal A,B,C,D,NA,NB,NC,ND: std_logic;
    begin
        A <= BCDin(3);
        B <= BCDin(2);
        C <= BCDin(1);
        D <= BCDin(0);
        NA <= not A;
        NB <= not B;
        NC <= not C;
        ND <= not D;

        HEX(0) <= not(C or A or (NB and ND) or (B and D));
        HEX(1) <= not(NB or (NC and ND) or (C and D));
        HEX(2) <= not(NC or D or B);
        HEX(3) <= not((NB and ND) or (NB and C) OR (C and ND) or (B and NC and D));
        HEX(4) <= not((NB and ND) or (C and ND));
        HEX(5) <= not(A or (NC and ND) or (B and NC) or (B and ND));
        HEX(6) <= not(A or (NB and C) or (C and ND) or (B and NC));
end architecture;