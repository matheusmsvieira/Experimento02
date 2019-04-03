----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2016 11:17:35
-- Design Name: 
-- Module Name: somador1 - Behavioral
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

entity somador1 is
  Port ( sum1 : in STD_LOGIC_VECTOR (10 downto 0);
         som1 : out STD_LOGIC_VECTOR(10 downto 0));
end somador1;

architecture Behavioral of somador1 is
    signal soma_inteiro1 : integer := 0;
begin
    process (sum1)
    begin
        soma_inteiro1 <= (conv_integer(sum1) + conv_integer("00000000001"));
    end process;
    som1 <= std_logic_vector(to_unsigned(soma_inteiro1,11));
end Behavioral;
