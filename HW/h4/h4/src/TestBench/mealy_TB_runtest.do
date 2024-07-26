SetActiveLib -work
comp -include "$dsn\src\q1.vhd" 
comp -include "$dsn\src\TestBench\mealy_TB.vhd" 
asim +access +r TESTBENCH_FOR_mealy 
wave 
wave -noreg clk
wave -noreg reset
wave -noreg input
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\mealy_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_mealy 
