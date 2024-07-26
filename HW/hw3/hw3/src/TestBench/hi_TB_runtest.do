SetActiveLib -work
comp -include "$dsn\src\q2.vhd" 
comp -include "$dsn\src\TestBench\hi_TB.vhd" 
asim +access +r TESTBENCH_FOR_hi 
wave 
wave -noreg inp
wave -noreg op
wave -noreg outp1
wave -noreg outp2
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\hi_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_hi 
