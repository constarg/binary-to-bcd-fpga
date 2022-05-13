----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2022 03:33:15 PM
-- Design Name: 
-- Module Name: binary_to_bcd_bench - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity binary_to_bcd_bench is
--  Port ( );
end binary_to_bcd_bench;

architecture Behavioral of binary_to_bcd_bench is
    component six_bits_to_bcd
       Port ( input : in unsigned(5 downto 0);
              output: out unsigned(7 downto 0)
            );
    end component;
    
    signal input_s: unsigned(5 downto 0);
    signal output_s: unsigned(7 downto 0);
    
begin
    uut: six_bits_to_bcd port map(
            input => input_s,
            output => output_s
         );
    start_proc: process
    begin
        input_s <= "000011";
        wait for 20ns;
        input_s <= "001010";
        wait for 20ns;
        input_s <= "010110";
        wait for 20ns;
        input_s <= "111111";
        wait;
    end process;

end Behavioral;
