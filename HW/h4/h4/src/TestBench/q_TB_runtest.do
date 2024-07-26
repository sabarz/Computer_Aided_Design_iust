SetActiveLib -work
comp -include "$dsn\src\q11.vhd" 
comp -include "$dsn\src\TestBench\q_TB.vhd" 
asim +access +r TESTBENCH_FOR_q 
wave 
wave -noreg clk
wave -noreg input
wave -noreg fs
wave -noreg ls
wave -noreg fe
wave -noreg le
wave -noreg index
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\q_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_q 
