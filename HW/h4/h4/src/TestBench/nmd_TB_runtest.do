SetActiveLib -work
comp -include "$dsn\src\q4.vhd" 
comp -include "$dsn\src\TestBench\nmd_TB.vhd" 
asim +access +r TESTBENCH_FOR_nmd 
wave 
wave -noreg input
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\nmd_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_nmd 
