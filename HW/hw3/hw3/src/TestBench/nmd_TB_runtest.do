SetActiveLib -work
comp -include "$dsn\src\types.vhd" 
comp -include "$dsn\src\q1.vhd" 
comp -include "$dsn\src\TestBench\nmd_TB.vhd" 
asim +access +r TESTBENCH_FOR_nmd 
wave 
wave -noreg f
wave -noreg s
wave -noreg op
wave -noreg outp
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\nmd_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_nmd 
