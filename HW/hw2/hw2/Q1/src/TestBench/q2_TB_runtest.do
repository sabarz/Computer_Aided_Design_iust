SetActiveLib -work
comp -include "$dsn\src\q2.vhd" 
comp -include "$dsn\src\TestBench\q2_TB.vhd" 
asim +access +r TESTBENCH_FOR_q2 
wave 
wave -noreg inp
wave -noreg outp
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\q2_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_q2 