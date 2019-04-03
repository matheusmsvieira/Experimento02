----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2016 14:40:01
-- Design Name: 
-- Module Name: comp1 - Behavioral
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

entity comp1 is
  Port ( num1 : in STD_LOGIC_VECTOR (10 downto 0);
         s_comp1 : out STD_LOGIC);
end comp1;  

architecture Behavioral of comp1 is

begin
    process (num1)
    begin
        if (conv_integer(num1) >= 2) then
            s_comp1 <= '0';
        else s_comp1 <= '1';
        end if;
    end process;
end Behavioral;
