----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.09.2016 17:01:09
-- Design Name: 
-- Module Name: bloco_operacional - Behavioral
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

entity bloco_operacional is
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
end bloco_operacional;

architecture Behavioral of bloco_operacional is

    component rCount
     Port ( ld1 : in STD_LOGIC;
            rst1 : in STD_LOGIC;
            es1 : in STD_LOGIC_VECTOR (10 downto 0);
            clk1 : in STD_LOGIC;
            sc1 : out STD_LOGIC_VECTOR (10 downto 0));
    end component;
    
    component somador1
     Port ( sum1 : in STD_LOGIC_VECTOR (10 downto 0);
            som1 : out STD_LOGIC_VECTOR (10 downto 0));
    end component;
     
    component comp1
     Port ( num1 : in STD_LOGIC_VECTOR (10 downto 0);
            s_comp1 : out STD_LOGIC);
    end component;
      
    component wCount
     Port ( ld2 : in STD_LOGIC;
            rst2 : in STD_LOGIC;
            es2 : in STD_LOGIC_VECTOR (13 downto 0);
            clk2 : in STD_LOGIC;
            sc2 : out STD_LOGIC_VECTOR (13 downto 0));
    end component;
    
    component somador2
     Port ( sum2 : in STD_LOGIC_VECTOR (13 downto 0);
            som2 : out STD_LOGIC_VECTOR (13 downto 0));
    end component;
    
    component comp2
     Port ( num2 : in STD_LOGIC_VECTOR (13 downto 0);
            s_comp2 : out STD_LOGIC);
    end component;
    
    component r_time
     Port ( ld3 : in STD_LOGIC;
            rst3 : in STD_LOGIC;
            clk3 : in STD_LOGIC;
            count1 : in STD_LOGIC_VECTOR (10 downto 0);
            rtime_out : out STD_LOGIC_VECTOR (10 downto 0));
    end component;
    
    signal s_cont1, s_som1_cont1: STD_LOGIC_VECTOR (10 downto 0);
    signal s_cont2, s_som2_cont2: STD_LOGIC_VECTOR (13 downto 0);
         
begin

    U1: rCount port map ( ld1 => rCount_ld,
                          rst1 => rCount_rst,
                          clk1 => clk,
                          es1 => s_som1_cont1,
                          sc1 => s_cont1);
    U2: somador1 port map ( sum1 => s_cont1,
                            som1 => s_som1_cont1);
    U3: comp1 port map ( num1 => s_cont1,
                         s_comp1 => rCount_lt_2000);
    U4: wCount port map ( ld2 => wCount_ld,
                          rst2 => wCount_rst,
                          clk2 => clk,
                          es2 => s_som2_cont2,
                          sc2 => s_cont2);
    U5: somador2 port map ( sum2 => s_cont2,
                            som2 => s_som2_cont2);
    U6: comp2 port map ( num2 => s_cont2,
                         s_comp2 => wCount_lt_10000);
    U7: r_time port map (ld3 => rtime_ld,
                        rst3 => rtime_rst,
                        clk3 => clk,
                        count1 => s_cont1,
                        rtime_out => rtime);
                           
end Behavioral;
