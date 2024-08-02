# Copyright (C) 2022, Xilinx, Inc.
# Copyright (C) 2022, Advanced Micro Devices, Inc.
# SPDX-License-Identifier: Apache-2.0

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]




set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][6]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][2]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][3]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][4]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][5]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][7]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][8]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][9]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][10]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][19]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][20]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][17]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][18]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][23]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][24]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][21]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][22]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][27]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][28]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][25]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][26]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][31]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][29]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][30]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][11]}]
set_property MARK_DEBUG true [get_nets {mAxilReadMasters[0][araddr][16]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][11]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][5]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][2]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][3]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][4]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][6]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][7]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][8]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][9]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][17]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][20]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][22]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][23]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][21]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][26]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][27]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][24]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][25]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][30]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][31]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][28]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][29]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][19]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][18]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][10]}]
set_property MARK_DEBUG true [get_nets {mAxilWriteMasters[0][awaddr][16]}]
set_property MARK_DEBUG true [get_nets {U_App/U_AxiI2cRegMaster_LOC/i2co[scloen]}]
set_property MARK_DEBUG true [get_nets {U_App/U_AxiI2cRegMaster_LOC/i2co[sdaoen]}]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 65536 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list {U_Core/REAL_CPU.U_CPU/U_Pll/clkOut[1]}]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {mAxilWriteMasters[0][awaddr][0]} {mAxilWriteMasters[0][awaddr][1]} {mAxilWriteMasters[0][awaddr][2]} {mAxilWriteMasters[0][awaddr][3]} {mAxilWriteMasters[0][awaddr][4]} {mAxilWriteMasters[0][awaddr][5]} {mAxilWriteMasters[0][awaddr][6]} {mAxilWriteMasters[0][awaddr][7]} {mAxilWriteMasters[0][awaddr][8]} {mAxilWriteMasters[0][awaddr][9]} {mAxilWriteMasters[0][awaddr][10]} {mAxilWriteMasters[0][awaddr][11]} {mAxilWriteMasters[0][awaddr][12]} {mAxilWriteMasters[0][awaddr][13]} {mAxilWriteMasters[0][awaddr][14]} {mAxilWriteMasters[0][awaddr][15]} {mAxilWriteMasters[0][awaddr][16]} {mAxilWriteMasters[0][awaddr][17]} {mAxilWriteMasters[0][awaddr][18]} {mAxilWriteMasters[0][awaddr][19]} {mAxilWriteMasters[0][awaddr][20]} {mAxilWriteMasters[0][awaddr][21]} {mAxilWriteMasters[0][awaddr][22]} {mAxilWriteMasters[0][awaddr][23]} {mAxilWriteMasters[0][awaddr][24]} {mAxilWriteMasters[0][awaddr][25]} {mAxilWriteMasters[0][awaddr][26]} {mAxilWriteMasters[0][awaddr][27]} {mAxilWriteMasters[0][awaddr][28]} {mAxilWriteMasters[0][awaddr][29]} {mAxilWriteMasters[0][awaddr][30]} {mAxilWriteMasters[0][awaddr][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {mAxilReadMasters[0][araddr][0]} {mAxilReadMasters[0][araddr][1]} {mAxilReadMasters[0][araddr][2]} {mAxilReadMasters[0][araddr][3]} {mAxilReadMasters[0][araddr][4]} {mAxilReadMasters[0][araddr][5]} {mAxilReadMasters[0][araddr][6]} {mAxilReadMasters[0][araddr][7]} {mAxilReadMasters[0][araddr][8]} {mAxilReadMasters[0][araddr][9]} {mAxilReadMasters[0][araddr][10]} {mAxilReadMasters[0][araddr][11]} {mAxilReadMasters[0][araddr][12]} {mAxilReadMasters[0][araddr][13]} {mAxilReadMasters[0][araddr][14]} {mAxilReadMasters[0][araddr][15]} {mAxilReadMasters[0][araddr][16]} {mAxilReadMasters[0][araddr][17]} {mAxilReadMasters[0][araddr][18]} {mAxilReadMasters[0][araddr][19]} {mAxilReadMasters[0][araddr][20]} {mAxilReadMasters[0][araddr][21]} {mAxilReadMasters[0][araddr][22]} {mAxilReadMasters[0][araddr][23]} {mAxilReadMasters[0][araddr][24]} {mAxilReadMasters[0][araddr][25]} {mAxilReadMasters[0][araddr][26]} {mAxilReadMasters[0][araddr][27]} {mAxilReadMasters[0][araddr][28]} {mAxilReadMasters[0][araddr][29]} {mAxilReadMasters[0][araddr][30]} {mAxilReadMasters[0][araddr][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list U_App/U_AxiI2cRegMaster_LOC/i2co]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {U_App/U_AxiI2cRegMaster_LOC/i2co[sdaoen]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets axilClk]
