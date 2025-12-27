read_libs slow.lib
read_hdl mac.v
elaborate
read_sdc constraints_top.sdc
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic
syn_map
syn_opt
report_timing > rpt_time.rep
report_area > rpt_area.rep
report_power > rpt_power.rep
report_gates > gates.rep
write_hdl > MAC_netlist.v
write_sdc > MAC_new.sdc

