SetActiveLib -work
comp -include "$dsn\src\q4.vhd" 
comp -include "$dsn\src\TestBench\q4_TB.vhd" 
asim +access +r TESTBENCH_FOR_q4 
wave 
wave -noreg clk
wave -noreg reset
wave -noreg set_clock
wave -noreg set_alarm
wave -noreg stop_alarm
wave -noreg houri1
wave -noreg houri0
wave -noreg mini1
wave -noreg mini0
wave -noreg hour1
wave -noreg hour0
wave -noreg min1
wave -noreg min0
wave -noreg alarm_on
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\q4_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_q4 
