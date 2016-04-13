library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Restador is
	port(
		a: in integer range -99 to 99;
		b: in integer range -99 to 99;
		r: out integer
	);
end Restador;

architecture Restador_arch of Restador is

	signal salida: integer;

	begin
		process(a, b) begin
			salida <= a-b;
			r <= salida;
		end process;
end Restador_arch;