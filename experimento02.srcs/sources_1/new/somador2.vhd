----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2016 16:15:51
-- Design Name: 
-- Module Name: somador2 - Behavioral
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

entity somador2 is
    Port ( sum2 : in STD_LOGIC_VECTOR (13 downto 0);
           som2 : out STD_LOGIC_VECTOR (13 downto 0));
end somador2;

architecture Behavioral of somador2 is
    signal soma_inteiro2 : integer := 0;
begin
    process (sum2)
    begin
        soma_inteiro2 <= (conv_integer(sum2) + conv_integer("00000000000001"));
    end process;
    som2 <= std_logic_vector(to_unsigned(soma_inteiro2,14));

end Behavioral;
