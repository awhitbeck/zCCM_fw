#load RUCKUS environment and library
source -quiet $::env(RUCKUS_DIR)/vivado_proc.tcl

#loadRuckusTcl $::env(TOP_DIR)/common
loadRuckusTcl $::env(TOP_DIR)/submodules/surf
loadRuckusTcl $::env(TOP_DIR)/submodules/axi-soc-ultra-plus-core/shared
loadRuckusTcl $::env(TOP_DIR)/submodules/axi-soc-ultra-plus-core/hardware/XilinxKriaKv260

loadSource -lib ldmx_ts -dir "$::env(TOP_DIR)/common/rtl/"

loadSource -path "$::DIR_PATH/rtl/test_kv260.vhd"
loadConstraints -path "$::DIR_PATH/xdc/default.xdc"


