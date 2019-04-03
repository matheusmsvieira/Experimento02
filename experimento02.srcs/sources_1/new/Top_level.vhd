----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.10.2016 16:38:46
-- Design Name: 
-- Module Name: Top_level - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- ===================================  hgmoura@yahoo.com  ===================================
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

entity Top_level is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           B : in STD_LOGIC;
           inicio : out STD_LOGIC;
           lento : out STD_LOGIC;
           rtime : out STD_LOGIC_VECTOR (10 downto 0));
end Top_level;

architecture Behavioral of Top_level is

    component FSM
        port ( clk : in STD_LOGIC;
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
               rtime_ld : out STD_LOGIC);
    end component;
    
    component bloco_operacional
        Port ( clk : in STD_LOGIC;
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
    
    signal s_rtr, s_rtl, s_rcr, s_rcl, s_wcr, s_wcl: STD_LOGIC;
    signal s_rc_lt_2000, s_wc_lt_10000 : STD_LOGIC;
        
begin
    V1: FSM port map (
          clk => clk,
          reset => reset,
          B => B,
          rCount_lt_2000 => s_rc_lt_2000,
          wCount_lt_10000 => s_wc_lt_10000,
          inicio => inicio,
          lento => lento,
          wCount_rst => s_wcr,
          rCount_rst => s_rcr,
          rtime_rst => s_rtr,
          wCount_ld => s_wcl,
          rCount_ld => s_rcl,
          rtime_ld => s_rtl);
    V2: bloco_operacional port map (
          clk => clk,
          rtime_rst => s_rtr,
          rtime_ld => s_rtl,
          rCount_rst => s_rcr,
          rCount_ld => s_rcl,
          wCount_rst => s_wcr,
          wCount_ld => s_wcl,
          rCount_lt_2000 => s_rc_lt_2000,
          wCount_lt_10000 => s_wc_lt_10000,
          rtime => rtime
    );

end Behavioral;
