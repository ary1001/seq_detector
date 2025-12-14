# ####################################################################

#  Auto-generated SDC for Sequence Detector 
#  Tool: Cadence Genus

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design p4_O_SEQdet

create_clock -name "EXT_CLK" -period 2.0 -waveform {0.0 1.0} [get_ports clock_i]
set_clock_transition 0.2 [get_clocks EXT_CLK]
set_load -pin_load 0.1 [get_ports out_o]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks EXT_CLK] -add_delay -max 1.0 [get_ports in_i]
set_input_delay -clock [get_clocks EXT_CLK] -add_delay -max 1.0 [get_ports areset_ni]
set_input_delay -clock [get_clocks EXT_CLK] -add_delay -min 0.2 [get_ports in_i]
set_input_delay -clock [get_clocks EXT_CLK] -add_delay -min 0.2 [get_ports areset_ni]
set_output_delay -clock [get_clocks EXT_CLK] -add_delay -max 0.6 [get_ports out_o]
set_output_delay -clock [get_clocks EXT_CLK] -add_delay -min 0.2 [get_ports out_o]
set_driving_cell -lib_cell BUFFD8 -pin "Z" [get_ports in_i]
set_driving_cell -lib_cell BUFFD8 -pin "Z" [get_ports clock_i]
set_driving_cell -lib_cell BUFFD8 -pin "Z" [get_ports areset_ni]
set_wire_load_mode "segmented"
set_wire_load_selection_group "WireAreaForZero" -library "tcbn65gpluswc0d72"
set_clock_latency  0.6 [get_clocks EXT_CLK]
set_clock_latency -source 0.4 [get_clocks EXT_CLK]
set_clock_uncertainty -setup 0.2 [get_clocks EXT_CLK]
