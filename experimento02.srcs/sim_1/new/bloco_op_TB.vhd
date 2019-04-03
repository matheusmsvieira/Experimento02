----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2016 16:34:35
-- Design Name: 
-- Module Name: bloco_op_TB - Behavioral
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

entity bloco_op_TB is
--  Port ( );
end bloco_op_TB;

architecture Behavioral of bloco_op_TB is
    
    component bloco_operacional 
    PORT (     clk : in STD_LOGIC;
               rtime_rst : in STD_LOGIC;
               rtime_ld : in STD_LOGIC;
               rCount_rst : in STD_LOGIC;
               rCount_ld : in STD_LOGIC;
               wCount_rst : in STD_LOGIC;
               wCount_ld : in STD_LOGIC;
               rCount_lt_2000 : out STD_LOGIC;
               wCount_lt_10000 : out STD_LOGIC;
               rtime : out STD_LOGIC_VECTOR (10 downto 0));
    end component;
    
    signal s_rtr, s_rtl, s_rcr, s_rcl, s_wcr, s_wcl, clk: STD_LOGIC;
    signal s_rc_lt_2000, s_wc_lt_10000 : STD_LOGIC;
    signal s_rtime : STD_LOGIC_VECTOR (10 downto 0);
    constant clk_period: time := 10 ns;
begin
    UU2: bloco_operacional port map(
         clk => clk,
         rtime_rst => s_rtr,
         rtime_ld => s_rtl,
         rCount_rst => s_rcr,
         rCount_ld => s_rcl,
         wCount_rst => s_wcr,
         wCount_ld => s_wcl,
         rCount_lt_2000 => s_rc_lt_2000,
         wCount_lt_10000 => s_wc_lt_10000,
         rtime => s_rtime);
    
     process
       begin
       clk <= '0';
       wait for clk_period/2;
       clk <= '1';
       wait for clk_period/2;
     end process;

    process
        begin
        s_rtr <= '1'; s_rcr <= '1'; s_wcr <= '1';
        s_rtl <= '0'; s_rcl <= '0'; s_wcl <= '0';
        wait for 10 ns;
        s_wcr <= '0';
        s_wcl <= '1';
        wait for 100 ns; 
        s_rcr <= '0'; s_wcr <= '1';
        s_rcl <= '1'; s_wcl <= '0';
        wait for 55 ns;
        s_rtr <= '0'; s_rcl <= '0';
        s_rtl <= '1';
        wait for 15 ns;
        s_rtr <= '1'; s_rcr <= '1'; s_wcr <= '1';
        s_rtl <= '0'; s_rcl <= '0'; s_wcl <= '0';
        wait for 10 ns;
    end process;

end Behavioral;
