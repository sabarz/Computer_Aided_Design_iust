SetActiveLib -work
comp -include "$dsn\src\Q4.vhd" 
comp -include "$dsn\src\TestBench\q4_TB.vhd" 
asim +access +r TESTBENCH_FOR_q4 
wave 
wave -noreg a
wave -noreg b
wave -noreg o
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\q4_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_q4 
