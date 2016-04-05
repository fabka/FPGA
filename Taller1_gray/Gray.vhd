library IEEE;
use IEEE.std_logic_1164.all;

entity Gray is 
port( reset, A, clock: in bit;
	Z: out bit_vector(2 downto 0));
end Gray;

architecture Gray_arch of Gray is

	type ESTADOS is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
	signal ESTADO, SIG_ESTADO: ESTADOS;
	signal SHIFT_REG: bit_vector(2 downto 0);
	
	begin
	
		INICIO: process(clock, reset)
		begin
			if reset = '1' then
				ESTADO <= s0;
			elsif clock'event and clock = '1' then
				ESTADO <= SIG_ESTADO;
			end if;
		end process INICIO;
	
		CONTROL: process(ESTADO)
		VARIABLE REG:bit_vector(2 downto 0);
		begin
			case ESTADO is
				when s0 =>
					REG := "000";
					if( A = '0') then
						SIG_ESTADO <= S0;
					else
						SIG_ESTADO <= S1;
					end if;
					
				when s1 =>
					SHIFT_REG <= REG;
					REG := "000";
					SIG_ESTADO <= s2;
					
				when s2 =>
					SHIFT_REG <= REG;
					REG := "001";
					SIG_ESTADO <= s3;
					
				when s3 =>
					SHIFT_REG <= REG;
					REG := "011";
					SIG_ESTADO <= s4;
					
				when s4 =>
					SHIFT_REG <= REG;
					REG := "010";
					SIG_ESTADO <= s5;
					
				when s5 =>
					SHIFT_REG <= REG;
					REG := "111";
					SIG_ESTADO <= s6;
					
				when s6 =>
					SHIFT_REG <= REG;
					REG := "101";
					SIG_ESTADO <= s7;
					
				when s7 =>
					SHIFT_REG <= REG;
					REG := "100";
					SIG_ESTADO <= s8;
				
				when s8 =>
					SHIFT_REG <= REG;
					REG := "000";
					SIG_ESTADO <= s1;
				
			end case;
		end process CONTROL;
		
		SALIDA: process(ESTADO)
		begin
			case ESTADO is
				when s1 to s8 =>
					z <= SHIFT_REG;
				when s0 =>
					z <= "000";
			end case;
		end process SALIDA;
	
end Gray_arch;