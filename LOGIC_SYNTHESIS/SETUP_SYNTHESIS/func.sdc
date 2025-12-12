current_design p4_O_SEQdet       

# CLOCK CONSTRAINTS

create_clock -name EXT_CLK -period 2 -waveform {0 1} [get_ports clock_i]

set_clock_transition 0.2 -max  [get_clocks EXT_CLK]

set_clock_transition 0.2 -min  [get_clocks EXT_CLK]

set_clock_latency 0.4 -source [get_clocks EXT_CLK]    

set_clock_latency 0.6 [get_clocks EXT_CLK]

set_clock_uncertainty  -setup 0.2  [get_clocks EXT_CLK]

set_clock_uncertainty 0.2 -hold [get_clocks EXT_CLK]



#INPUT CONSTRAINTS

set_input_delay  -max 1 -clock [get_clocks EXT_CLK] [remove_from_collection [all_inputs] [get_ports clock_i]]

set_input_delay  0.2 -min -clock [get_clocks EXT_CLK]  [remove_from_collection [all_inputs] [get_ports clock_i]]

set_driving_cell -lib_cell BUFFD8 [remove_from_collection [all_inputs] [get_ports clock_i]]




#OUTPUT CONSTRAINTS

set_output_delay  -max 0.6 -clock [get_clocks EXT_CLK] [all_outputs]

set_output_delay 0.2 -min -clock [get_clocks EXT_CLK] [all_outputs]

set_load 0.1 [all_outputs]




