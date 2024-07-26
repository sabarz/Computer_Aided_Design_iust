SetActiveLib -work
comp -include "$dsn\src\Q1.vhd" 
comp -include "$dsn\src\TestBench\q1_TB.vhd" 
asim +access +r TESTBENCH_FOR_q1 
wave 
wave -noreg inp
wave -noreg outp
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\q1_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_q1 
