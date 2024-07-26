SetActiveLib -work
comp -include "$dsn\src\Q2.vhd" 
comp -include "$dsn\src\TestBench\calculator_TB.vhd" 
asim +access +r TESTBENCH_FOR_calculator 
wave 
wave -noreg A
wave -noreg B
wave -noreg s
wave -noreg o
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\calculator_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_calculator 
