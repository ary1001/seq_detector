# -----------------------------------------------------
#  Top Module
# -----------------------------------------------------
current_design seq_detector


# -----------------------------------------------------
#  Clock Definition
# -----------------------------------------------------
create_clock -name EXT_CLK -period 2 -waveform {0 1} [get_ports clock_i]

# Clock_slew
set_clock_transition -max 0.2 [get_clocks EXT_CLK]
set_clock_transition -min 0.2 [get_clocks EXT_CLK]

# Latency 
set_clock_latency -source 0.4 [get_clocks EXT_CLK]
set_clock_latency        0.6 [get_clocks EXT_CLK]

# Uncertainty
set_clock_uncertainty  -setup 0.2 [get_clocks EXT_CLK]
set_clock_uncertainty  -hold  0.2 [get_clocks EXT_CLK]


# -----------------------------------------------------
#  Input Constraints 
# -----------------------------------------------------
set_input_delay -max 1.0  -clock EXT_CLK \
    [remove_from_collection [all_inputs] [get_ports clock_i]]

set_input_delay -min 0.2  -clock EXT_CLK \
    [remove_from_collection [all_inputs] [get_ports clock_i]]

# Input driving cell 
set_driving_cell -lib_cell BUFX4 \
    [remove_from_collection [all_inputs] [get_ports clock_i]]


# -----------------------------------------------------
#  Output Constraints
# -----------------------------------------------------
set_output_delay -max 0.6 -clock EXT_CLK [all_outputs]
set_output_delay -min 0.2 -clock EXT_CLK [all_outputs]

# Load at outputs (generic capacitance)
set_load 0.1 [all_outputs]





