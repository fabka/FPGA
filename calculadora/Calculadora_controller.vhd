library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Calculadora_controller is
	port(
		reset: in std_logic;
		clock: in std_logic;
		operacion: in std_logic_vector(1 downto 0);
		igual: in std_logic;
		contador: in std_logic;
		habilitar_contador: out std_logic;
		salida: out std_logic_vector(2 downto 0)
		);
end Calculadora_controller;

architecture Calculadora_controller_arch of Calculadora_controller is
signal estado: std_logic_vector(3 downto 0);
begin
	process(clock, reset, operacion, igual, contador)
	begin
		if reset = '1' then
			estado <= "0001";
		elsif clock'event AND clock='1' then
			estado(0) <= (contador and not estado(1)) or (not igual and estado(0));
			estado(1) <= (not contador and estado(1)) or (igual and estado(0) and not operacion(0) and not operacion(1));
			estado(2) <= (not contador and estado(2)) or (igual and estado(0) and not operacion(0) and operacion(1));
			estado(3) <= (not contador and estado(3)) or (igual and estado(0) and operacion(0) and not operacion(1));
		end if;
	end process;
	habilitar_contador <= not estado(0);
	salida(0) <= estado(1);
	salida(1) <= estado(2);
	salida(2) <= estado(3);
	
end Calculadora_controller_arch;