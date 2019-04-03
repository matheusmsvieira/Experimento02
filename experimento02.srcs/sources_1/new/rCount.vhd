----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2016 11:18:25
-- Design Name: 
-- Module Name: rCount - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rCount is
    Port ( ld1 : in STD_LOGIC;
           rst1 : in STD_LOGIC;
           clk1 : in STD_LOGIC;
           es1 : in STD_LOGIC_vector(10 downto 0);
           sc1 : out STD_LOGIC_vector(10 downto 0));
end rCount;

architecture Behavioral of rCount is
    signal reg1 : std_logic_vector(10 downto 0);
begin
process (ld1, clk1, rst1, es1)
begin 
    if rising_edge(clk1) then
        if rst1 = '1' then
            reg1 <= "00000000000";
        elsif ld1 = '1' then
            reg1 <= es1;
        else reg1 <= reg1;
        end if;
    end if;
end process;
    sc1 <= reg1;
end Behavioral;
