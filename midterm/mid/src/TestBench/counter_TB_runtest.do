SetActiveLib -work
comp -include "$dsn\src\q1.vhd" 
comp -include "$dsn\src\TestBench\counter_TB.vhd" 
asim +access +r TESTBENCH_FOR_counter 
wave 
wave -noreg clk
wave -noreg Clear
wave -noreg Preset
wave -noreg Count
wave -noreg Output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\counter_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_counter 
