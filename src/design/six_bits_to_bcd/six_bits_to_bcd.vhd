----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2022 04:29:20 PM
-- Design Name: 
-- Module Name: six_bits_to_bcd - Behavioral
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

entity six_bits_to_bcd is
    Port ( 
            input: in unsigned(5 downto 0);
            output: out unsigned(7 downto 0)
         );
end six_bits_to_bcd;

architecture Behavioral of six_bits_to_bcd is

    signal input_tmp: unsigned(13 downto 0) := "00000000000000";
    
    signal ones_1: unsigned(3 downto 0);
    signal ones_2: unsigned(3 downto 0);                                     
    signal ones_3: unsigned(3 downto 0);                                    
    signal ones_4: unsigned(3 downto 0);
    
    signal shift_1: unsigned(13 downto 0);
    signal shift_2: unsigned(13 downto 0);
    signal shift_3: unsigned(13 downto 0);
    signal shift_4: unsigned(13 downto 0);
    
    signal add_3_1: unsigned(13 downto 0);                                     
    signal add_3_2: unsigned(13 downto 0);
    signal add_3_3: unsigned(13 downto 0);
    signal add_3_4: unsigned(13 downto 0);
    
    signal test_s_1: std_logic;
    signal test_s_2: std_logic;
    signal test_s_3: std_logic;                              
    signal test_s_4: std_logic;
    
begin
    input_tmp(5 downto 0) <= input;
first_stage:
    shift_1 <= input_tmp sll 3;
    ones_1 <= shift_1(9 downto 6);
    test_s_1 <= (ones_1(2)) and (ones_1(0) or ones_1(1));
    add_3_1 <= (shift_1(13 downto 10) & (ones_1 + "011") & shift_1(5 downto 0))
               when test_s_1 = '1' else shift_1;
    
second_stage:
    shift_2 <= add_3_1 sll 1;
    ones_2 <= shift_2(9 downto 6);
    test_s_2 <= (ones_2(2)) and (ones_2(0) or ones_2(1));
    add_3_2 <= (shift_2(13 downto 10) & (ones_2 + "011") & shift_2(5 downto 0))
               when test_s_2 = '1' else shift_2;

third_stage:
    shift_3 <= add_3_2 sll 1;
    ones_3 <= shift_3(9 downto 6);
    test_s_3 <= (ones_3(2)) and (ones_3(0) or ones_3(1));
    add_3_3 <= (shift_3(13 downto 10) & (ones_3 + "011") & shift_3(5 downto 0))
               when test_s_3 = '1' else shift_3;

last_stage:
    shift_4 <= add_3_3 sll 1;
    ones_4 <= shift_4(9 downto 6);
    test_s_4 <= (ones_4(2)) and (ones_4(0) or ones_4(1));
    add_3_4 <= (shift_4(13 downto 10) & (ones_4 + "011") & shift_4(5 downto 0))
               when test_s_4 = '1' else shift_4;

    -- save the reaults.
    output <= add_3_4(13 downto 6);


end Behavioral;
