library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;

entity Salida is
	port(
		estado: in std_logic_vector(2 downto 0);
		suma: in integer;
		resta: in integer;
		multiplicacion: in integer;
		salida: out integer
	);
end Salida;

architecture Salida_arch of Salida is

	signal salida_cable: integer;

	begin
		process(estado, suma, resta, multiplicacion) begin
			if estado(0) = '1' then
				salida <= suma;
			elsif estado(1) = '1' then
				salida <= resta;
			elsif estado(2) = '1'then
				salida <= multiplicacion;
			else
				salida <= 0;
			end if;
		end process;
end Salida_arch;