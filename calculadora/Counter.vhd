library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counter is
   port( Clock_enable_B: in std_logic;
 	 Clock: in std_logic;
 	 Reset: in std_logic;
 	 T0: out std_logic;
	 T1: out std_logic);
end Counter;

 
architecture Behavioral of Counter is
signal temp: std_logic_vector(0 to 3);

signal ck,rst :std_logic;

begin   

process(Clock,Reset)
   begin
      if Reset='1' then
         temp <= "0100";
      elsif(rising_edge(Clock)) then
 	 if Clock_enable_B='0' then
	    if temp="1110" then
	       temp<="0000";
	    else
	       temp <= temp + 1;
	    end if;
         end if;
      end if;
end process;
	
process (temp)
	begin
	
	case temp is
		when "1110" =>
			T0 <= '1';
		when "0100" =>
			T1 <= '1';
		when others =>
			T0 <= '0';
			T1 <= '0';
	end case;
end process;
 
end Behavioral;