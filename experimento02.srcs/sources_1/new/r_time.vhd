----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2016 16:47:02
-- Design Name: 
-- Module Name: r_time - Behavioral
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

entity r_time is
    Port ( ld3 : in STD_LOGIC;
           rst3 : in STD_LOGIC;
           clk3 : in STD_LOGIC;
           count1 : in STD_LOGIC_vector(10 downto 0);
           rtime_out : out STD_LOGIC_vector(10 downto 0));
end r_time;

architecture Behavioral of r_time is
    signal reg3 : std_logic_vector(10 downto 0);
begin
    process (ld3, clk3, rst3, count1)
    begin 
        if rising_edge(clk3) then
            if rst3 = '1' then
                reg3 <= "00000000000";
            elsif ld3 = '1' then
                reg3 <= count1;
            else reg3 <= reg3;
            end if;
        end if;
    end process;
    rtime_out <= reg3;

end Behavioral;
