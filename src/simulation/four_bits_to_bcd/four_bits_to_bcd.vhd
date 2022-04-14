----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2022 07:18:37 PM
-- Design Name: 
-- Module Name: four_bits_to_bcd - Behavioral
-- Project Name: 
-- Target Devices: zebo-z10
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity four_bits_to_bcd is
    Port ( input : in unsigned(3 downto 0);
           btn_in: in std_logic;
           led_out: out unsigned(3 downto 0);
           bcd_o : out unsigned(7 downto 0)
         );
end four_bits_to_bcd;

architecture Behavioral of four_bits_to_bcd is

    signal check_above_nine : std_logic;
    signal bcd_res : unsigned(7 downto 0);
   
    begin
        check_above_nine <= (input(3)) and (input(1) or input(2));
        bcd_res <= ("0000" & input) when check_above_nine = '0'
                 else ( "000" & ( ('0' & input) + "0110"));
        bcd_o <= bcd_res;
        led_out <= bcd_res(3 downto 0) when btn_in = '0'
                 else bcd_res(7 downto 4); 
              
end Behavioral;















