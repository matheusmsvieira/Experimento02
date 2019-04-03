----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2016 16:24:25
-- Design Name: 
-- Module Name: comp2 - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comp2 is
  Port ( num2 : in STD_LOGIC_VECTOR (13 downto 0);
         s_comp2 : out STD_LOGIC );
end comp2;

architecture Behavioral of comp2 is

begin
    process (num2)
    begin
        if (conv_integer(num2) >= 10) then
            s_comp2 <= '0';
        else s_comp2 <= '1';
        end if;
    end process;
end Behavioral;
