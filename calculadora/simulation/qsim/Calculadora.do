onerror {quit -f}
vlib work
vlog -work work Calculadora.vo
vlog -work work Calculadora.vt
vsim -novopt -c -t 1ps -L stratixii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Calculadora_vlg_vec_tst
vcd file -direction Calculadora.msim.vcd
vcd add -internal Calculadora_vlg_vec_tst/*
vcd add -internal Calculadora_vlg_vec_tst/i1/*
add wave /*
run -all
