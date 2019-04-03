----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2016 15:29:33
-- Design Name: 
-- Module Name: wCount - Behavioral
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

entity wCount is
    Port ( ld2 : in STD_LOGIC;
           rst2 : in STD_LOGIC;
           es2 : in STD_LOGIC_VECTOR (13 downto 0);
           clk2 : in STD_LOGIC;
           sc2 : out STD_LOGIC_VECTOR (13 downto 0));
end wCount;

architecture Behavioral of wCount is
    signal reg2 : STD_LOGIC_VECTOR (13 downto 0);
begin
    process (clk2, ld2, rst2, es2)
    begin
        if rising_edge(clk2) then
            if rst2 = '1' then
                reg2 <= "00000000000000";
            elsif ld2 = '1' then
                reg2 <= es2;
            else reg2 <= reg2;
            end if;
        end if;
    end process;
    sc2 <= reg2;
end Behavioral;
