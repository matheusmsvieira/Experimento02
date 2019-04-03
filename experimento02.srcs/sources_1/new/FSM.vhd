----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.09.2016 08:58:30
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           B : in STD_LOGIC;
           rCount_lt_2000 : in STD_LOGIC;
           wCount_lt_10000 : in STD_LOGIC;
           inicio : out STD_LOGIC;
           lento : out STD_LOGIC;
           wCount_rst : out STD_LOGIC;
           rCount_rst : out STD_LOGIC;
           rtime_rst : out STD_LOGIC;
           wCount_ld : out STD_LOGIC;
           rCount_ld : out STD_LOGIC;
           rtime_ld : out STD_LOGIC
   --      estado_teste : out STD_LOGIC_VECTOR (3 downto 0)
           );
end FSM;

architecture Behavioral of FSM is

type estados is (init, espera, count, slow, done);
signal atual, prox: estados;

begin
process (clk)
begin
    if rising_edge (clk) then
        if reset = '0' then
            atual <= init;
        else atual <= prox;
        end if;
    end if;
end process;

process (atual, clk, reset, wCount_lt_10000, rCount_lt_2000, B)
begin
    case atual is
        when init =>
     --     estado_teste <= "0000";
            wCount_rst <= '1';
            wCount_ld <= '0';
            rCount_rst <= '1';
            rCount_ld <= '0';
            inicio <= '0';
            lento <= '0';
            if reset = '1' then
                prox <= espera;
            else prox <= init;
            end if;
        when espera =>
       --   estado_teste <= "0001";
            rtime_rst <= '1';
            rtime_ld <= '0';
            wCount_ld <= '1';
            wCount_rst <= '0';
            rCount_ld <= '0';
            rCount_rst <= '1';
            lento <= '0';
            inicio <= '0';
            if wCount_lt_10000 = '0' then
                prox <= count;
            else prox <= espera;
            end if;
       when count =>
      --    estado_teste <= "0010";
            inicio <= '1';
            rCount_ld <= '1';
            rCount_rst <= '0';
            wCount_ld <= '0';
            wCount_rst <= '1';
            rtime_ld <= '0';
            rtime_rst <= '1';
            lento <= '0';
            if B = '1' then
                prox <= done;
            elsif B = '0' then 
                if rCount_lt_2000 = '0' then
                    prox <= slow;
                else prox <= atual;
                end if;
            else prox <= atual;   
            end if;
       when slow =>
       --   estado_teste <= "0011";
            rCount_ld <= '1';
            rCount_rst <= '0';
            wCount_ld <= '0';
            wCount_rst <= '1';
            rtime_ld <= '0';
            rtime_rst <= '1';
            lento <= '1';
            inicio <= '0';
            prox <= done;
       when done =>
     --     estado_teste <= "0100";
            rtime_ld <= '1';
            rtime_rst <= '0';
            rCount_ld <= '1';
            rCount_rst <= '0';
            wCount_ld <= '0';
            wCount_rst <= '1';
            lento <= '0';
            inicio <= '0';
            prox <= init;
    end case;
end process;
end Behavioral;
