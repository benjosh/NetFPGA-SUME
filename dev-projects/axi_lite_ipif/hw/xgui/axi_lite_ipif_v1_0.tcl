# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set C_NUM_ADDRESS_RANGES [ipgui::add_param $IPINST -parent $Page0 -name C_NUM_ADDRESS_RANGES]
	set C_USE_WSTRB [ipgui::add_param $IPINST -parent $Page0 -name C_USE_WSTRB]
	set C_S_AXI_MIN_SIZE [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_MIN_SIZE]
	set C_ARD_NUM_CE_ARRAY [ipgui::add_param $IPINST -parent $Page0 -name C_ARD_NUM_CE_ARRAY]
	set C_TOTAL_NUM_CE [ipgui::add_param $IPINST -parent $Page0 -name C_TOTAL_NUM_CE]
	set C_S_AXI_ADDR_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_ADDR_WIDTH]
	set C_ARD_ADDR_RANGE_ARRAY [ipgui::add_param $IPINST -parent $Page0 -name C_ARD_ADDR_RANGE_ARRAY]
	set C_DPHASE_TIMEOUT [ipgui::add_param $IPINST -parent $Page0 -name C_DPHASE_TIMEOUT]
	set C_S_AXI_DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_DATA_WIDTH]
}

proc update_PARAM_VALUE.C_NUM_ADDRESS_RANGES { PARAM_VALUE.C_NUM_ADDRESS_RANGES } {
	# Procedure called to update C_NUM_ADDRESS_RANGES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_NUM_ADDRESS_RANGES { PARAM_VALUE.C_NUM_ADDRESS_RANGES } {
	# Procedure called to validate C_NUM_ADDRESS_RANGES
	return true
}

proc update_PARAM_VALUE.C_USE_WSTRB { PARAM_VALUE.C_USE_WSTRB } {
	# Procedure called to update C_USE_WSTRB when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_USE_WSTRB { PARAM_VALUE.C_USE_WSTRB } {
	# Procedure called to validate C_USE_WSTRB
	return true
}

proc update_PARAM_VALUE.C_S_AXI_MIN_SIZE { PARAM_VALUE.C_S_AXI_MIN_SIZE } {
	# Procedure called to update C_S_AXI_MIN_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_MIN_SIZE { PARAM_VALUE.C_S_AXI_MIN_SIZE } {
	# Procedure called to validate C_S_AXI_MIN_SIZE
	return true
}

proc update_PARAM_VALUE.C_ARD_NUM_CE_ARRAY { PARAM_VALUE.C_ARD_NUM_CE_ARRAY } {
	# Procedure called to update C_ARD_NUM_CE_ARRAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_ARD_NUM_CE_ARRAY { PARAM_VALUE.C_ARD_NUM_CE_ARRAY } {
	# Procedure called to validate C_ARD_NUM_CE_ARRAY
	return true
}

proc update_PARAM_VALUE.C_TOTAL_NUM_CE { PARAM_VALUE.C_TOTAL_NUM_CE } {
	# Procedure called to update C_TOTAL_NUM_CE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_TOTAL_NUM_CE { PARAM_VALUE.C_TOTAL_NUM_CE } {
	# Procedure called to validate C_TOTAL_NUM_CE
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_ARD_ADDR_RANGE_ARRAY { PARAM_VALUE.C_ARD_ADDR_RANGE_ARRAY } {
	# Procedure called to update C_ARD_ADDR_RANGE_ARRAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_ARD_ADDR_RANGE_ARRAY { PARAM_VALUE.C_ARD_ADDR_RANGE_ARRAY } {
	# Procedure called to validate C_ARD_ADDR_RANGE_ARRAY
	return true
}

proc update_PARAM_VALUE.C_DPHASE_TIMEOUT { PARAM_VALUE.C_DPHASE_TIMEOUT } {
	# Procedure called to update C_DPHASE_TIMEOUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DPHASE_TIMEOUT { PARAM_VALUE.C_DPHASE_TIMEOUT } {
	# Procedure called to validate C_DPHASE_TIMEOUT
	return true
}

proc update_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_MIN_SIZE { MODELPARAM_VALUE.C_S_AXI_MIN_SIZE PARAM_VALUE.C_S_AXI_MIN_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_MIN_SIZE}] ${MODELPARAM_VALUE.C_S_AXI_MIN_SIZE}
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

proc update_MODELPARAM_VALUE.C_ARD_ADDR_RANGE_ARRAY { MODELPARAM_VALUE.C_ARD_ADDR_RANGE_ARRAY PARAM_VALUE.C_ARD_ADDR_RANGE_ARRAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_ARD_ADDR_RANGE_ARRAY}] ${MODELPARAM_VALUE.C_ARD_ADDR_RANGE_ARRAY}
}

proc update_MODELPARAM_VALUE.C_ARD_NUM_CE_ARRAY { MODELPARAM_VALUE.C_ARD_NUM_CE_ARRAY PARAM_VALUE.C_ARD_NUM_CE_ARRAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_ARD_NUM_CE_ARRAY}] ${MODELPARAM_VALUE.C_ARD_NUM_CE_ARRAY}
}

