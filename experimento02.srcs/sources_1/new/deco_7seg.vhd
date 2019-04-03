----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2016 13:11:34
-- Design Name: 
-- Module Name: deco_7seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity deco_7seg is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (7 downto 0);
           segmentos : out STD_LOGIC_VECTOR (7 downto 0);
           anodos : out STD_LOGIC_VECTOR (3 downto 0));
end deco_7seg;

architecture Behavioral of deco_7seg is

constant preset : STD_LOGIC_VECTOR(18 downto 0) := "1011111010111100001";
signal count : STD_LOGIC_VECTOR(18 downto 0) := (others => '0');
signal dig1 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal dig2 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal dig3 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal dig4 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal deco : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal control : STD_LOGIC_VECTOR (1 downto 0) := "00";

begin
    with control select
        deco <= dig1 when "00",
                dig2 when "01",
                dig3 when "10",
                dig4 when others;
                
    dig1 <= A (3 downto 0);
    dig2 <= A (7 downto 4);
    dig3 <= "0000";
    dig4 <= "0000";
            
    process (clk, reset)
        variable aux_anodo : STD_LOGIC_VECTOR (4 downto 0) := "11110";
    begin
        if rising_edge (clk) then
            if reset = '1' then
                count <= (others => '0');
                aux_anodo := (others => '0');
                control <= "00";
            elsif count = preset then
                count <= (others => '0');
                control <= control + "01";
                aux_anodo := aux_anodo (3 downto 0)&'1';
                if aux_anodo = "01111" then
                    aux_anodo := "11110";
                end if;
            else
                count <= count + '1';
            end if;
            anodos <= aux_anodo (3 downto 0);
        end if;
    end process;        

    process (deco)
    begin
        case deco is
            when "0000" => segmentos <= "11000000"; --0
            when "0001" => segmentos <= "11111001"; --1
            when "0010" => segmentos <= "10100100"; --2
            when "0011" => segmentos <= "10110000"; --3
            when "0100" => segmentos <= "10011001"; --4
            when "0101" => segmentos <= "10010010"; --5
            when "0110" => segmentos <= "10000010"; --6
            when "0111" => segmentos <= "11111000"; --7
            when "1000" => segmentos <= "10000000"; --8
            when "1001" => segmentos <= "10011000"; --9
            when "1010" => segmentos <= "10001000"; --A
            when "1011" => segmentos <= "10000011"; --b
            when "1100" => segmentos <= "11000110"; --c
            when "1101" => segmentos <= "10100001"; --d
            when "1110" => segmentos <= "10000110"; --E
           when others => segmentos <= "10001110"; --F
        end case;
    end process;

end Behavioral;
