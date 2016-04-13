library verilog;
use verilog.vl_types.all;
entity Calculadora is
    port(
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        Operacion       : in     vl_logic_vector(1 downto 0);
        igual           : in     vl_logic;
        respuesta       : out    vl_logic_vector(14 downto 0)
    );
end Calculadora;
