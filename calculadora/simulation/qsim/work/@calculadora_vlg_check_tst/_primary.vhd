library verilog;
use verilog.vl_types.all;
entity Calculadora_vlg_check_tst is
    port(
        respuesta       : in     vl_logic_vector(14 downto 0);
        sampler_rx      : in     vl_logic
    );
end Calculadora_vlg_check_tst;
