----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2017 08:32:11 PM
-- Design Name: 
-- Module Name: clock_div - Behavioral
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

entity clock_div is
    Port ( clk : in STD_LOGIC;
           div : out STD_LOGIC);
end clock_div;

architecture Behavioral of clock_div is

    signal counter  : integer range 0 to 62499999;
    signal set      : std_logic;
    

begin
    cdiv: process(clk,counter,set) is 
    begin
    
        if (rising_edge(clk)) then
            if(counter = 62499999) then
                set <= not set;
                counter <= 0; 
            else
                counter <= counter +1;    
               
            end if;
                
            if( set = '1') then
                div <= '1';
            else
                div <= '0';
            end if;    
        end if;

        
    end process cdiv;
    
end Behavioral;
