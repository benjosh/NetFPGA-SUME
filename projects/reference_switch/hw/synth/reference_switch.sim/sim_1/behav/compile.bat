@echo off
rem  Vivado(TM)
rem  compile.bat: a Vivado-generated XSim simulation Script
rem  Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.

set PATH=$XILINX/lib/$PLATFORM:$XILINX/bin/$PLATFORM;/opt/Xilinx/Vivado/2014.2/ids_lite/ISE/bin/lin64;/opt/Xilinx/Vivado/2014.2/ids_lite/ISE/lib/lin64;/opt/Xilinx/Vivado/2014.2/bin;%PATH%
set XILINX_PLANAHEAD=/opt/Xilinx/Vivado/2014.2

xelab -m64 --debug typical --relax --include /root/NetFPGA-SUME-2014.2/projects/reference_switch/hw/synth/reference_switch.srcs/sources_1/ip/output_port_lookup_ip/source --include /root/NetFPGA-SUME-2014.2/projects/reference_switch/hw/synth/reference_switch.srcs/sources_1/ip/input_arbiter_ip/source --include /root/NetFPGA-SUME-2014.2/projects/reference_switch/hw/synth/reference_switch.srcs/sources_1/ip/output_queues_ip/source --include /root/NetFPGA-SUME-2014.2/projects/reference_switch/hw/synth/reference_switch.srcs/sources_1/ipshared/xilinx.com/axi_infrastructure_v1_1/e13550d2/hdl/verilog --include /root/NetFPGA-SUME-2014.2/projects/reference_switch/hw/synth/reference_switch.srcs/sources_1/ip/nf10_10g_interface/source -L xil_defaultlib -L generic_baseblocks_v2_1 -L axi_infrastructure_v1_1 -L axi_register_slice_v2_1 -L fifo_generator_v12_0 -L axi_data_fifo_v2_1 -L axi_crossbar_v2_1 -L timer_sync_1588_v1_2 -L ten_gig_eth_pcs_pma_v4_1 -L ten_gig_eth_mac_v13_1 -L unisims_ver -L unimacro_ver -L secureip --snapshot top_behav --prj /root/NetFPGA-SUME-2014.2/projects/reference_switch/hw/synth/reference_switch.sim/sim_1/behav/top.prj   xil_defaultlib.top   xil_defaultlib.glbl
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
