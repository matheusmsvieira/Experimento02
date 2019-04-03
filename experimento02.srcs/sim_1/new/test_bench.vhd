----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.09.2016 09:38:37
-- Design Name: 
-- Module Name: test_bench - Behavioral
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

entity test_bench is
--  Port ( );
end test_bench;

architecture Behavioral of test_bench is

    component FSM 
    PORT (     clk : in STD_LOGIC;
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
               --estado_teste : out STD_LOGIC_VECTOR (3 downto 0)
               );
    end component;
    
signal clk, reset, B,rCount_lt_2000,wCount_lt_10000,inicio,lento: STD_LOGIC; 
signal wCount_rst,rCount_rst,rtime_rst,wCount_ld,rCount_ld,rtime_ld: STD_LOGIC;
--SIGNAL estado_teste: STD_LOGIC_VECTOR (3 downto 0);

constant clk_period: time := 100 ns;
    
begin
    U1 : FSM port map (
        clk => clk,
        reset => reset,
        B => B,
        rCount_lt_2000 => rCount_lt_2000,
        wCount_lt_10000 => wCount_lt_10000,
        inicio => inicio,
        lento => lento,
        wCount_rst => wCount_rst,
        rCount_rst => rCount_rst,
        rtime_rst => rtime_rst,
        wCount_ld => wCount_ld,
        rCount_ld => rCount_ld,
        rtime_ld => rtime_ld
        --estado_teste => estado_teste
        );


    process
    begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
    end process;
    
    process
    begin
    reset <= '0'; 
    wait for 100 ns;
    reset <= '1'; 
    
    B <= '0'; rCount_lt_2000 <= '0'; wCount_lt_10000 <= '1';
    wait for 100 ns;
    wCount_lt_10000 <= '0';
    wait for 100 ns;
    B <= '0'; rCount_lt_2000 <= '1';
    wait for 100 ns;
    B <= '0'; rCount_lt_2000 <= '0';
    wait for 100 ns;
    B <= '1'; rCount_lt_2000 <= '1';
    wait for 100 ns;
    end process;
end Behavioral;
