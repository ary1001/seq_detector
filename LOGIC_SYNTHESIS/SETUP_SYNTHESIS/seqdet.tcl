
#to preserve all hierarchy, avoids flatten hierarchy
set_db auto_ungroup none

#Library, hdl file loaction paths
set_db init_hdl_search_path   "/afs/iitd.ac.in/user/e/ee/een242857/PRACTICE/real_project_5/Logic_synthesis/pre_syn_files_1/"

read_mmmc  "/afs/iitd.ac.in/user/e/ee/een242857/PRACTICE/real_project_6/Logic_synthesis/pre_syn_files_1/mmmc.tcl"

#Global effort levels
set_db syn_generic_effort high
set_db syn_map_effort     high
set_db syn_opt_effort     high


#Reading three files

read_hdl seq_detector.v 


elaborate   p4_O_SEQdet  
#elaborate phele, fir sdc file read, as abhi design feed nhi hua hai

init_design -top p4_O_SEQdet

syn_generic 

syn_map 

check_design -all

#STA run, then if we want improvement, syn_opt
#syn_opt 

report_timing -lint

#PPA, sdf reports

#write_hdl > "/afs/iitd.ac.in/user/e/ee/een242857/PRACTICE/real_project_5/Logic_synthesis/synthesized_files_2/seqdet_synth.v"

#write_sdc -view {WC_VIEW} > "/afs/iitd.ac.in/user/e/ee/een242857/PRACTICE/real_project_5/Logic_synthesis/synthesized_files_2/func_synth.sdc"

#write_sdf > "/afs/iitd.ac.in/user/e/ee/een242857/PRACTICE/real_project_5/Logic_synthesis/synthesized_files_2/seqdet.sdf"

#report_timing > "/afs/iitd.ac.in/user/e/ee/een242857/PRACTICE/real_project_5/Logic_synthesis/reports_3/sta.rpt"

#report_power  >  "/afs/iitd.ac.in/user/e/ee/een242857/PRACTICE/real_project_5/Logic_synthesis/reports_3/power.rpt"

#report_area > "/afs/iitd.ac.in/user/e/ee/een242857/PRACTICE/real_project_5/Logic_synthesis/reports_3/area.rpt"

