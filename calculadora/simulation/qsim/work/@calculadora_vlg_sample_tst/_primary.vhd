library verilog;
use verilog.vl_types.all;
entity Calculadora_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        clock           : in     vl_logic;
        igual           : in     vl_logic;
        Operacion       : in     vl_logic_vector(1 downto 0);
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Calculadora_vlg_sample_tst;
