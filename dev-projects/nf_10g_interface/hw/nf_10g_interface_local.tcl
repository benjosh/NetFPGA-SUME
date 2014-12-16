# Vivado Launch Script
#### Change design settings here #######
set design nf_10g_interface 
set top nf_10g_interface
set sim_top nf_10g_interface
set device xc7vx690t-2-ffg1761
set proj_dir ./synth
#set repo_dir ./ip_repo
set repo_dir ../../../lib/ip_repo
set ip_version v1_0_0
set ip_output ../../../lib/hw/std/cores/${design}/${design}_${ip_version}.zip
set lib_name NetFPGA
#####################################
# set IP paths
#####################################
 #set axi_lite_ipif_ip_path $::env(XILINX_IP_FOLDER)/axi_lite_ipif/source/
set axi_lite_ipif_ip_path ../../../lib/hw/xilinx/cores/axi_lite_ipif/source/
#set fallthrough_small_fifo_ip $::env(IP_FOLDER)/generic/fallthrough_small_fifo_v1_0_0.zip
#set nf10_axis_converter_ip $::env(IP_FOLDER)/generic/nf10_axis_converter_v1_0_0.zip
set nf10_axis_converter_ip ../../../lib/hw/std/cores/generic/nf10_axis_converter_v1_0_0.zip
#set fallthrough_small_fifo_ip $::env(IP_FOLDER)/generic/fallthrough_small_fifo_v1_0_0.zip
set fallthrough_small_fifo_ip ../../../lib/hw/std/cores/generic/fallthrough_small_fifo_v1_0_0.zip
#####################################
# Project Settings
#####################################
create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} -ip
set_property source_mgmt_mode None [current_project] 
set_property top ${top} [current_fileset]
file mkdir ${repo_dir}
 set_property ip_repo_paths ${repo_dir} [current_fileset]
puts "Creating 10G Interface IP"
# Project Constraints
#####################################
# Proj
 #Project Structure & IP Build
#####################################
#######
read_verilog "${axi_lite_ipif_ip_path}/address_decoder.v"
read_verilog "${axi_lite_ipif_ip_path}/axi_lite_ipif.v"
read_verilog "${axi_lite_ipif_ip_path}/counter_f.v"
read_verilog "${axi_lite_ipif_ip_path}/pselect_f.v"
read_verilog "${axi_lite_ipif_ip_path}/slave_attachment.v"
#read_verilog "./source/fallthrough_small_fifo_v2.v"
#read_verilog "./source/small_fifo_v3.v"
update_ip_catalog
#update_ip_catalog -add_ip ${nf10_axis_converter_ip} -repo_path ${repo_dir}
#create_ip -name nf10_axis_converter -vendor NetFPGA -library NetFPGA -module_name converter_master
#set_property generate_synth_checkpoint false [get_files converter_master.xci]
#generate_target all [get_ips converter_master]
#create_ip -name nf10_axis_converter -vendor NetFPGA -library NetFPGA -module_name converter_slave
#set_property generate_synth_checkpoint false [get_files converter_slave.xci]
#generate_target all [get_ips converter_slave]

###
# local axis converter
###
#update_ip_catalog -add_ip ${fallthrough_small_fifo_ip} -repo_path ${repo_dir}
#create_ip -name fallthrough_small_fifo -vendor NetFPGA -library NetFPGA -module_name  input_fifo
#set_property generate_synth_checkpoint false [get_files  input_fifo.xci]
#generate_target all [get_ips  input_fifo]
#create_ip -name fallthrough_small_fifo -vendor NetFPGA -library NetFPGA -module_name  info_fifo
#set_property generate_synth_checkpoint false [get_files  info_fifo.xci]
#generate_target all [get_ips  info_fifo]
read_verilog "../../fallthrough_small_fifo/hw/source/fallthrough_small_fifo.v"
read_verilog "../../fallthrough_small_fifo/hw/source/small_fifo.v"

read_verilog "./source/nf10_axis_converter.v"

create_bd_design "xge_sub"
open_bd_design "xge_sub"
source ./source/xge_sub.tcl
#validate_bd_design
save_bd_design
#generate_target all [get_files  xge_sub.bd ]

#read_verilog "./source/rx_queue.v"
read_verilog "./source/FIFO36_72.v"
read_verilog "./source/small_async_fifo.v"
#read_verilog "./source/tx_queue.v"
read_verilog "./source/nf10_axis_converter.v"
read_verilog "./source/cpu_sync.v"

read_verilog "./source/nf_10g_if_cpu_regs_defines.v"
read_verilog "./source/nf_10g_if_cpu_regs.v"
read_verilog "./source/nf_10g_interface.v"
update_compile_order -fileset sources_1
#update_compile_order -fileset sim_1
ipx::package_project
set_property library ${lib_name} [ipx::current_core]
set_property vendor_display_name {NetFPGA} [ipx::current_core]
set_property company_url {www.netfpga.org} [ipx::current_core]
#set_property name {nf10_input_arbiter} [ipx::current_core]
set_property vendor {NetFPGA} [ipx::current_core]
set_property supported_families {{virtex7} {Production}} [ipx::current_core]
set_property taxonomy {{/NetFPGA/Data_Path}} [ipx::current_core]
set_property value {0x01} [ipx::get_user_parameter C_ARD_NUM_CE_ARRAY [ipx::current_core]]
#set_property value_bit_string_length {64} [ipx::get_user_parameter C_ARD_ADDR_RANGE_ARRAY [ipx::current_core]]
#set_property value {0x0000FFFF00000000} [ipx::get_user_parameter C_ARD_ADDR_RANGE_ARRAY [ipx::current_core]]
ipx::infer_user_parameters [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::archive_core ${ip_output} [ipx::current_core]
update_ip_catalog -add_ip ${ip_output} -repo_path ${repo_dir}
create_ip -name ${ip_output} -vendor NetFPGA -library NetFPGA -module_name  ${ip_output}_ip
set_property generate_synth_checkpoint false [get_files  ${ip_output}_ip.xci]
set_property is_enabled true [get_files  ${ip_output}_ip.xci]
reset_target all [get_ips ${ip_output}_ip]
generate_target all [get_ips  ${ip_output}_ip]
close_project

########set_property top ${sim_top} [get_filesets sim_1]
########set_property include_dirs {${proj_dir} ./} [get_filesets sim_1]
######## set_property verilog_define { {SIMULATION=1} } [get_filesets sim_1]
######### Vivado Simulator settings
########set_property -name xsim.more_options -value {-testplusarg TESTNAME=basic_test} -objects [get_filesets sim_1]
########set_property runtime {} [get_filesets sim_1]
######## # set_property XSIM.TCLBATCH ../../../../misc/xsim_wave.tcl [get_filesets sim_1]
######### Default to MTI
########set_property target_simulator xsim [current_project]
######### MTI settings
########set_property runtime {} [get_filesets sim_1]
#########set_property -name xsim.vlog_more_options -value +acc -objects [get_filesets sim_1]
#########set_property -name xsim.vsim_more_options -value {+notimingchecks +TESTNAME=basic_test -GSIM_COLLISION_CHECK=NONE } -objects [get_filesets sim_1]
########set_property compxlib.compiled_library_dir {} [current_project]
#########set_property xsim.custom_udo "./misc/wave.do" [get_filesets sim_1]
######### Generate the IPs
#########generate_target {synthesis simulation} [get_ips]
#########  generate_target example [get_files *mig_axi_mm_dual.xci]
########### set_property include_dirs { ../tb ../tb/dsport ../tb/include ../source/gen_chk project_1/xt_connectivity_trd.srcs/sources_1/ip/mig_axi_mm_dual/mig_axi_mm_dual/example_design/sim} [get_filesets sim_1]
########create_run -flow {Vivado Synthesis 2014} sim_1
########launch_runs sim_1
########launch_xsim -simset sim_1 -mode behavioral
########run 10us












