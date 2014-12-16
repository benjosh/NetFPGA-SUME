# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set C_NUM_ADDRESS_RANGES [ipgui::add_param $IPINST -parent $Page0 -name C_NUM_ADDRESS_RANGES]
	set C_S_AXI_DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_DATA_WIDTH]
	set C_S_AXI_ACLK_FREQ_HZ [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_ACLK_FREQ_HZ]
	set C_S_AXI_MIN_SIZE [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_MIN_SIZE]
	set C_S_AXIS_TUSER_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXIS_TUSER_WIDTH]
	set C_S_AXIS_DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXIS_DATA_WIDTH]
	set C_TOTAL_NUM_CE [ipgui::add_param $IPINST -parent $Page0 -name C_TOTAL_NUM_CE]
	set C_HIGHADDR [ipgui::add_param $IPINST -parent $Page0 -name C_HIGHADDR]
	set C_DEFAULT_VALUE_ENABLE [ipgui::add_param $IPINST -parent $Page0 -name C_DEFAULT_VALUE_ENABLE]
	set C_S_AXI_ADDR_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_ADDR_WIDTH]
	set IF_NUMBER [ipgui::add_param $IPINST -parent $Page0 -name IF_NUMBER]
	set C_DEFAULT_DST_PORT [ipgui::add_param $IPINST -parent $Page0 -name C_DEFAULT_DST_PORT]
	set C_USE_WSTRB [ipgui::add_param $IPINST -parent $Page0 -name C_USE_WSTRB]
	set C_DPHASE_TIMEOUT [ipgui::add_param $IPINST -parent $Page0 -name C_DPHASE_TIMEOUT]
	set C_ARD_NUM_CE_ARRAY [ipgui::add_param $IPINST -parent $Page0 -name C_ARD_NUM_CE_ARRAY]
	set C_DEFAULT_SRC_PORT [ipgui::add_param $IPINST -parent $Page0 -name C_DEFAULT_SRC_PORT]
	set C_M_AXIS_TUSER_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_M_AXIS_TUSER_WIDTH]
	set C_M_AXIS_DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_M_AXIS_DATA_WIDTH]
	set C_BASEADDR [ipgui::add_param $IPINST -parent $Page0 -name C_BASEADDR]
}

proc update_PARAM_VALUE.C_NUM_ADDRESS_RANGES { PARAM_VALUE.C_NUM_ADDRESS_RANGES } {
	# Procedure called to update C_NUM_ADDRESS_RANGES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_NUM_ADDRESS_RANGES { PARAM_VALUE.C_NUM_ADDRESS_RANGES } {
	# Procedure called to validate C_NUM_ADDRESS_RANGES
	return true
}

proc update_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ { PARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ } {
	# Procedure called to update C_S_AXI_ACLK_FREQ_HZ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ { PARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ } {
	# Procedure called to validate C_S_AXI_ACLK_FREQ_HZ
	return true
}

proc update_PARAM_VALUE.C_S_AXI_MIN_SIZE { PARAM_VALUE.C_S_AXI_MIN_SIZE } {
	# Procedure called to update C_S_AXI_MIN_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_MIN_SIZE { PARAM_VALUE.C_S_AXI_MIN_SIZE } {
	# Procedure called to validate C_S_AXI_MIN_SIZE
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_TUSER_WIDTH { PARAM_VALUE.C_S_AXIS_TUSER_WIDTH } {
	# Procedure called to update C_S_AXIS_TUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_TUSER_WIDTH { PARAM_VALUE.C_S_AXIS_TUSER_WIDTH } {
	# Procedure called to validate C_S_AXIS_TUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_DATA_WIDTH { PARAM_VALUE.C_S_AXIS_DATA_WIDTH } {
	# Procedure called to update C_S_AXIS_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_DATA_WIDTH { PARAM_VALUE.C_S_AXIS_DATA_WIDTH } {
	# Procedure called to validate C_S_AXIS_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_TOTAL_NUM_CE { PARAM_VALUE.C_TOTAL_NUM_CE } {
	# Procedure called to update C_TOTAL_NUM_CE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_TOTAL_NUM_CE { PARAM_VALUE.C_TOTAL_NUM_CE } {
	# Procedure called to validate C_TOTAL_NUM_CE
	return true
}

proc update_PARAM_VALUE.C_HIGHADDR { PARAM_VALUE.C_HIGHADDR } {
	# Procedure called to update C_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_HIGHADDR { PARAM_VALUE.C_HIGHADDR } {
	# Procedure called to validate C_HIGHADDR
	return true
}

proc update_PARAM_VALUE.C_DEFAULT_VALUE_ENABLE { PARAM_VALUE.C_DEFAULT_VALUE_ENABLE } {
	# Procedure called to update C_DEFAULT_VALUE_ENABLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DEFAULT_VALUE_ENABLE { PARAM_VALUE.C_DEFAULT_VALUE_ENABLE } {
	# Procedure called to validate C_DEFAULT_VALUE_ENABLE
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.IF_NUMBER { PARAM_VALUE.IF_NUMBER } {
	# Procedure called to update IF_NUMBER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IF_NUMBER { PARAM_VALUE.IF_NUMBER } {
	# Procedure called to validate IF_NUMBER
	return true
}

proc update_PARAM_VALUE.C_DEFAULT_DST_PORT { PARAM_VALUE.C_DEFAULT_DST_PORT } {
	# Procedure called to update C_DEFAULT_DST_PORT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DEFAULT_DST_PORT { PARAM_VALUE.C_DEFAULT_DST_PORT } {
	# Procedure called to validate C_DEFAULT_DST_PORT
	return true
}

proc update_PARAM_VALUE.C_USE_WSTRB { PARAM_VALUE.C_USE_WSTRB } {
	# Procedure called to update C_USE_WSTRB when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_USE_WSTRB { PARAM_VALUE.C_USE_WSTRB } {
	# Procedure called to validate C_USE_WSTRB
	return true
}

proc update_PARAM_VALUE.C_DPHASE_TIMEOUT { PARAM_VALUE.C_DPHASE_TIMEOUT } {
	# Procedure called to update C_DPHASE_TIMEOUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DPHASE_TIMEOUT { PARAM_VALUE.C_DPHASE_TIMEOUT } {
	# Procedure called to validate C_DPHASE_TIMEOUT
	return true
}

proc update_PARAM_VALUE.C_ARD_NUM_CE_ARRAY { PARAM_VALUE.C_ARD_NUM_CE_ARRAY } {
	# Procedure called to update C_ARD_NUM_CE_ARRAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_ARD_NUM_CE_ARRAY { PARAM_VALUE.C_ARD_NUM_CE_ARRAY } {
	# Procedure called to validate C_ARD_NUM_CE_ARRAY
	return true
}

proc update_PARAM_VALUE.C_DEFAULT_SRC_PORT { PARAM_VALUE.C_DEFAULT_SRC_PORT } {
	# Procedure called to update C_DEFAULT_SRC_PORT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DEFAULT_SRC_PORT { PARAM_VALUE.C_DEFAULT_SRC_PORT } {
	# Procedure called to validate C_DEFAULT_SRC_PORT
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_TUSER_WIDTH { PARAM_VALUE.C_M_AXIS_TUSER_WIDTH } {
	# Procedure called to update C_M_AXIS_TUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_TUSER_WIDTH { PARAM_VALUE.C_M_AXIS_TUSER_WIDTH } {
	# Procedure called to validate C_M_AXIS_TUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_DATA_WIDTH { PARAM_VALUE.C_M_AXIS_DATA_WIDTH } {
	# Procedure called to update C_M_AXIS_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_DATA_WIDTH { PARAM_VALUE.C_M_AXIS_DATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_BASEADDR { PARAM_VALUE.C_BASEADDR } {
	# Procedure called to update C_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BASEADDR { PARAM_VALUE.C_BASEADDR } {
	# Procedure called to validate C_BASEADDR
	return true
}


proc update_MODELPARAM_VALUE.C_M_AXIS_DATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_DATA_WIDTH PARAM_VALUE.C_M_AXIS_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_DATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_DATA_WIDTH PARAM_VALUE.C_S_AXIS_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_TUSER_WIDTH { MODELPARAM_VALUE.C_M_AXIS_TUSER_WIDTH PARAM_VALUE.C_M_AXIS_TUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_TUSER_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_TUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_TUSER_WIDTH { MODELPARAM_VALUE.C_S_AXIS_TUSER_WIDTH PARAM_VALUE.C_S_AXIS_TUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_TUSER_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_TUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_DEFAULT_VALUE_ENABLE { MODELPARAM_VALUE.C_DEFAULT_VALUE_ENABLE PARAM_VALUE.C_DEFAULT_VALUE_ENABLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DEFAULT_VALUE_ENABLE}] ${MODELPARAM_VALUE.C_DEFAULT_VALUE_ENABLE}
}

proc update_MODELPARAM_VALUE.C_DEFAULT_SRC_PORT { MODELPARAM_VALUE.C_DEFAULT_SRC_PORT PARAM_VALUE.C_DEFAULT_SRC_PORT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DEFAULT_SRC_PORT}] ${MODELPARAM_VALUE.C_DEFAULT_SRC_PORT}
}

proc update_MODELPARAM_VALUE.C_DEFAULT_DST_PORT { MODELPARAM_VALUE.C_DEFAULT_DST_PORT PARAM_VALUE.C_DEFAULT_DST_PORT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DEFAULT_DST_PORT}] ${MODELPARAM_VALUE.C_DEFAULT_DST_PORT}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ { MODELPARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ PARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ}] ${MODELPARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ}
}

proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_USE_WSTRB { MODELPARAM_VALUE.C_USE_WSTRB PARAM_VALUE.C_USE_WSTRB } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_USE_WSTRB}] ${MODELPARAM_VALUE.C_USE_WSTRB}
}

proc update_MODELPARAM_VALUE.C_DPHASE_TIMEOUT { MODELPARAM_VALUE.C_DPHASE_TIMEOUT PARAM_VALUE.C_DPHASE_TIMEOUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DPHASE_TIMEOUT}] ${MODELPARAM_VALUE.C_DPHASE_TIMEOUT}
}

proc update_MODELPARAM_VALUE.C_NUM_ADDRESS_RANGES { MODELPARAM_VALUE.C_NUM_ADDRESS_RANGES PARAM_VALUE.C_NUM_ADDRESS_RANGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_NUM_ADDRESS_RANGES}] ${MODELPARAM_VALUE.C_NUM_ADDRESS_RANGES}
}

proc update_MODELPARAM_VALUE.C_TOTAL_NUM_CE { MODELPARAM_VALUE.C_TOTAL_NUM_CE PARAM_VALUE.C_TOTAL_NUM_CE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_TOTAL_NUM_CE}] ${MODELPARAM_VALUE.C_TOTAL_NUM_CE}
}

proc update_MODELPARAM_VALUE.C_S_AXI_MIN_SIZE { MODELPARAM_VALUE.C_S_AXI_MIN_SIZE PARAM_VALUE.C_S_AXI_MIN_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_MIN_SIZE}] ${MODELPARAM_VALUE.C_S_AXI_MIN_SIZE}
}

proc update_MODELPARAM_VALUE.C_ARD_NUM_CE_ARRAY { MODELPARAM_VALUE.C_ARD_NUM_CE_ARRAY PARAM_VALUE.C_ARD_NUM_CE_ARRAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_ARD_NUM_CE_ARRAY}] ${MODELPARAM_VALUE.C_ARD_NUM_CE_ARRAY}
}

proc update_MODELPARAM_VALUE.C_BASEADDR { MODELPARAM_VALUE.C_BASEADDR PARAM_VALUE.C_BASEADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BASEADDR}] ${MODELPARAM_VALUE.C_BASEADDR}
}

proc update_MODELPARAM_VALUE.C_HIGHADDR { MODELPARAM_VALUE.C_HIGHADDR PARAM_VALUE.C_HIGHADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_HIGHADDR}] ${MODELPARAM_VALUE.C_HIGHADDR}
}

proc update_MODELPARAM_VALUE.IF_NUMBER { MODELPARAM_VALUE.IF_NUMBER PARAM_VALUE.IF_NUMBER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IF_NUMBER}] ${MODELPARAM_VALUE.IF_NUMBER}
}

