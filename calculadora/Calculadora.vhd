library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Calculadora is
	port(
		reset: in std_logic;
		clock: in std_logic;
		a: in integer range -99 to 99;
		b: in integer range -99 to 99;
		Operacion: in std_logic_vector(1 downto 0);
		igual: in std_logic;
		respuesta: out integer range -9801 to 9801
	);
end Calculadora;

architecture calculadora_arch of Calculadora is

	component Sumador is
		port(
			a: in integer range -99 to 99;
			b: in integer range -99 to 99;
			r: out integer
		);
	end component;
	
	component Restador is
		port(
			a: in integer range -99 to 99;
			b: in integer range -99 to 99;
			r: out integer
		);
	end component;
	
	component Multiplicador is
		port(
			a: in integer range -99 to 99;
			b: in integer range -99 to 99;
			r: out integer
		);
	end component;
	
	component Calculadora_controller is
		port(
			reset: in std_logic;
			clock: in std_logic;
			operacion: in std_logic_vector(1 downto 0);
			igual: in std_logic;
			contador: in std_logic;
			habilitar_contador: out std_logic;
			salida: out std_logic_vector(2 downto 0)
		);
	end component;
	
	component Counter
		port( 
			Clock_enable_B	: in std_logic;
			Clock : in std_logic;
			Reset	: in std_logic;
			T0	: out std_logic;
			T1	: out std_logic
		);
	end component;
	
	component Salida
		port(
			estado: in std_logic_vector(3 downto 1);
			suma: in integer;
			resta: in integer;
			multiplicacion: in integer;
			salida: out integer
		);
	end component;
	
	signal contador_cable, contador_cable_aux, habilitar_contador_cable:std_logic;
	signal sumador_salida, restador_salida, multiplicador_salida, salida_sistema: integer;
	signal salida_maquina_estados: std_logic_vector(2 downto 0);

begin

	suma: Sumador port map (a, b, sumador_salida);
	resta: Restador port map (a, b, restador_salida);
	multiplicacion: Multiplicador port map (a, b, multiplicador_salida);
	maquina_estados: Calculadora_controller port map (reset, clock, operacion, igual, contador_cable, habilitar_contador_cable, salida_maquina_estados);
	contador: Counter port map(habilitar_contador_cable, clock, reset, contador_cable, contador_cable_aux);
	salir: Salida port map(salida_maquina_estados, sumador_salida, restador_salida,multiplicador_salida, salida_sistema);
	
	respuesta <= salida_sistema;
	
end calculadora_arch; 