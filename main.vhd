library ieee;
use ieee.std_logic_1164.all;

entity main is 
    port
    (
        SW: in std_logic_vector(7 downto 0);
        HEX_0,HEX_1,HEX_2: out std_logic_vector(6 downto 0)
    );
end entity;

architecture logica of main is
    component bin2bcd is 
        port
        (
            SW: in std_logic_vector(7 downto 0);
            BCD: out std_logic_vector(11 downto 0)
        );
    end component;
    component display is 
        port
        (
            BCDin: in std_logic_vector(3 downto 0);
            HEX: out std_logic_vector(6 downto 0)
        );
    end component;
    signal SWout: std_logic_vector(11 downto 0);
    begin
        conv: bin2bcd port map(SW, SWout);

        Hex00: display port map(SWout(11 downto 8),HEX_2);
        Hex01: display port map(SWout(7 downto 4),HEX_1);
        Hex02: display port map(SWout(3 downto 0),HEX_0);
    
end architecture logica;