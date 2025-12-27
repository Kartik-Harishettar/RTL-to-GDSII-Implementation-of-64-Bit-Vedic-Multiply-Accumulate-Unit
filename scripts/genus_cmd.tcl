read_libs /home/adld22ec193/genus/library/slow.lib
read_hdl /home/adld22ec193/GH/Vedic_SDP_64bit/mac.v
elaborate
read_sdc /home/adld22ec193/GH/vedic_sdp/MAC.sdc
set_db syn_generic_effort high and optimization
set_db syn_map_effort high
set_db syn_opt_effort high
syn_generic
syn_map
syn_opt
report_timing > /home/adld22ec193/GH/Vedic_SDP_64bit/rpt_time.rep
report_area > /home/adld22ec193/GH/Vedic_SDP_64bit/rpt_area.rep
report_power > /home/adld22ec193/GH/Vedic_SDP_64bit/rpt_power.rep
report_gates > /home/adld22ec193/GH/Vedic_SDP_64bit/gates.rep
write_hdl > /home/adld22ec193/GH/Vedic_SDP_64bit/MAC_netlist.v
write_sdc > /home/adld22ec193/GH/Vedic_SDP_64bit/MAC_new.sdc

