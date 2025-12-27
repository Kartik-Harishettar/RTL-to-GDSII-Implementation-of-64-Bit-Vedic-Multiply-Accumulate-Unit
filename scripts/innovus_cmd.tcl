//Design initialization
set init_pwr_net VDD
set init_gnd_net VSS

set init_lef_file {lef/gsclib045_tech.lef lef/gsclib045_macro.lef}
set init_mmmc_file MMMC.tcl
set init_top_cell counter
set init_verilog ./counter_netlist_dft.v
set init_io_file placement.io
init_design

globalNetConnect VDD -type pgpin -pin VDD -all
globalNetConnect VSS -type pgpin -pin VSS -all
globalNetConnect VSS -type tielo
globalNetConnect VDD -type tiehi
//floorplan
floorPlan -coreMarginsBy die -site CoreSite -r 1 0.7 2.5 2.5 2.5 2.5

//manual IO placement and macro

//powerplan

addRing -layer {bottom Metal11 top Metal11 right Metal10 left Metal10} -width 0.7 -spacing .4 -offset 0.6 -nets {VDD VSS}
addStripe -block_ring_top_layer_limit Metal11 -max_same_layer_jog_length 0.44 -padcore_ring_bottom_layer_limit Metal9 -set_to_set_distance 5 -padcore_ring_top_layer_limit Metal11 -spacing 0.4 -merge_stripes_value 0.6 -layer Metal10 -block_ring_bottom_layer_limit Metal9 -width 0.3 -nets {VDD VSS}
sroute -connect core_pin -layerChangeRange { Metal1(1) Metal11(11) } -blockPinTarget nearest_target -corePinTarget first_after_row_end -allowJogging 1 -crossoverViaLayerRange { Metal1(1) Metal11(11) } -nets { VDD VSS } -allowLayerChange 1 -targetViaLayerRange { Metal1(1) Metal11(11) }

//scanchain

defIn ../synsthesis/outputs/counter_scanDEF.scandef

// placement

place_design
report_timing
checkDesign -place
saveDesign place.enc

//CTS

ccopt_design
report_timing
checkDesign -all
saveDesign post_clock.enc

//Routing

routeDesign -globalDetail
checkDesign -all
report_timing

//Spef extract
reset_parasitics
extract_rc
