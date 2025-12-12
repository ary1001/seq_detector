# -----------------------------------------------------
#  Library Sets 
#  Use your actual .lib paths when running locally.
# -----------------------------------------------------

create_library_set -name WC_LIBS -timing {
    "./lib/tsmc65/wc/tcbn65gpluswc.lib"
    "./lib/tsmc65/wc/tcbn65gplus_cglvt_wc.lib"
    "./lib/tsmc65/wc/tcbn65gplus_cghvt_wc.lib"
}

create_library_set -name TT_LIBS -timing {
    "./lib/tsmc65/tt/tcbn65gplus_tt.lib"
    "./lib/tsmc65/tt/tcbn65gplus_cglvt_tt.lib"
    "./lib/tsmc65/tt/tcbn65gplus_cghvt_tt.lib"
}

create_library_set -name BC_LIBS -timing {
    "./lib/tsmc65/bc/tcbn65gplus_bc.lib"
    "./lib/tsmc65/bc/tcbn65gplus_cglvt_bc.lib"
    "./lib/tsmc65/bc/tcbn65gplus_cghvt_bc.lib"
}

# -----------------------------------------------------
#  Timing Conditions
# -----------------------------------------------------

create_timing_condition -name WC_COND -library_sets {WC_LIBS}
create_timing_condition -name TT_COND -library_sets {TT_LIBS}
create_timing_condition -name BC_COND -library_sets {BC_LIBS}

# -----------------------------------------------------
#  RC Corners
#  (Replace with actual .tch files if available)
# -----------------------------------------------------

create_rc_corner -name RC_TYP
create_rc_corner -name RC_WC
create_rc_corner -name RC_BC

# -----------------------------------------------------
#  Delay Corners
# -----------------------------------------------------

create_delay_corner -name TT_CORNER -timing_condition TT_COND -rc_corner RC_TYP
create_delay_corner -name WC_CORNER -timing_condition WC_COND -rc_corner RC_WC
create_delay_corner -name BC_CORNER -timing_condition BC_COND -rc_corner RC_BC

# -----------------------------------------------------
#  Constraint Mode (Path Sanitized)
# -----------------------------------------------------

create_constraint_mode -name FUNC_MODE \
    -sdc_files {"./constraints/func.sdc"}

# -----------------------------------------------------
#  Analysis Views (Single-Mode Multi-Corner)
# -----------------------------------------------------

create_analysis_view -name TT_VIEW -constraint_mode FUNC_MODE -delay_corner TT_CORNER
create_analysis_view -name WC_VIEW -constraint_mode FUNC_MODE -delay_corner WC_CORNER
create_analysis_view -name BC_VIEW -constraint_mode FUNC_MODE -delay_corner BC_CORNER

# -----------------------------------------------------
#  Set Setup/Hold Views
# -----------------------------------------------------

set_analysis_view -setup {WC_VIEW} -hold {BC_VIEW}
