# Project settings
set dir SEQ_DETECTOR
set design seq_detector

# Preserve hierarchy
set_db auto_ungroup none

# HDL search path (user-specific paths removed for GitHub)
set_db init_hdl_search_path   "./pre_syn_files/"

# MMMC setup
read_mmmc  "./constraints/mmmc.tcl"

# Synthesis effort levels
set_db syn_generic_effort high
set_db syn_map_effort     high
set_db syn_opt_effort     high

# Read RTL
read_hdl $design.v
elaborate  $design  
init_design -top $design

# Synthesis steps
syn_generic
syn_map
check_design -all
syn_opt 

# Reports
report_timing -lint
report_timing  > "./reports/sta.rpt"
report_power   > "./reports/power.rpt"
report_area    > "./reports/area.rpt"
report_qor     > "./reports/qor.rpt"

# Output files
write_hdl > "./synth_out/${design}_synth.v"
write_sdc -view {WC_VIEW} > "./synth_out/${design}.sdc"
write_sdf > "./synth_out/${design}.sdf"
