----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2022 07:45:55 PM
-- Design Name: 
-- Module Name: four_bits_to_bcd_bench - Behavioral
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

entity four_bits_to_bcd_bench is
--  Port ( );
end four_bits_to_bcd_bench;

architecture Behavioral of four_bits_to_bcd_bench is
    component four_bits_to_bcd
       Port ( input : in unsigned(3 downto 0);
              btn_in: in std_logic;
              led_out: out unsigned(3 downto 0);
              bcd_o : out unsigned(7 downto 0)
            );
    end component;
    
    signal input_s : unsigned(3 downto 0);
    signal bcd_o_s : unsigned(7 downto 0);
    signal btn_in_s : std_logic;
    signal led_out_s: unsigned(3 downto 0);

    begin
        uut: four_bits_to_bcd port map(
            input => input_s,
            bcd_o => bcd_o_s,
            btn_in => btn_in_s,
            led_out => led_out_s
        );
    start_proc: process
    begin
        input_s <= "0000";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "0001";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "0010";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "0011";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "0100";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "0101"; 
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';                
        wait for 20 ns;
        input_s <= "0110";  
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';               
        wait for 20 ns;
        input_s <= "0111";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "1000";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "1001";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "1010";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "1011";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "1100";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "1101";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "1110";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait for 20 ns;
        input_s <= "1111";
        btn_in_s <= '0';
        wait for 20 ns;
        btn_in_s <= '1';
        wait;
    end process;

end Behavioral;
