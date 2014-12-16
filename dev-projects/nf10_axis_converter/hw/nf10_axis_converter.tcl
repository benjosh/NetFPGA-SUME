# Vivado Launch Script
#### Change design settings here #######
set design nf10_axis_converter
set top nf10_axis_converter
set device xc7vx690t-2-ffg1761
set proj_dir ./synth
#set repo_dir ./ip_repo
set repo_dir ../../../lib/ip_repo
set ip_version v1_0_0
#set ip_output $::env(IP_FOLDER)/${design}/${design}_${ip_version}.zip
set ip_output ../../../lib/hw/std/cores/generic/${design}_${ip_version}.zip
set lib_name NetFPGA
#####################################
# set IP paths
#####################################
#set fallthrough_small_fifo_ip $::env(IP_FOLDER)/generic/fallthrough_small_fifo_v1_0_0.zip
set fallthrough_small_fifo_ip ../../../lib/hw/std/cores/generic/fallthrough_small_fifo_v1_0_0.zip
#####################################
# Project Settings
#####################################
#create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} -ip
create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} 
#set_property source_mgmt_mode None [current_project]
set_property source_mgmt_mode All [current_project]  
set_property top ${top} [current_fileset]
  file mkdir ${repo_dir}
 set_property ip_repo_paths ${repo_dir} [current_fileset]
puts "Creating AXIS Converter IP"
# Project Constraints
#####################################
# Project Structure & IP Build
#####################################
puts "DEBUG STARTS HERE ************************************************************************************************"

update_ip_catalog
#update_ip_catalog -add_ip ${fallthrough_small_fifo_ip} -repo_path ${repo_dir}
#create_ip -name fallthrough_small_fifo -vendor NetFPGA -library NetFPGA -module_name  fallthrough_small_fifo_ip
##set_property generate_synth_checkpoint false [get_files  input_fifo.xci]
#set_property generate_synth_checkpoint false [get_files  fallthrough_small_fifo_ip.xci]
#set_property generate_synth_checkpoint true [get_files  input_fifo.xci]
#create_ip_run [get_files input_fifo.xci]
#launch_run  input_fifo_synth_1
#
##set_property is_enabled true [get_files  input_fifo.xci]
##reset_target all [get_ips input_fifo]
##generate_target all [get_ips  input_fifo]

#set_property is_enabled true [get_files  fallthrough_small_fifo_ip.xci]
#reset_target all [get_ips fallthrough_small_fifo_ip]
#generate_target all [get_ips  fallthrough_small_fifo_ip]

##create_ip -name fallthrough_small_fifo -vendor NetFPGA -library NetFPGA -module_name  info_fifo
##set_property generate_synth_checkpoint false [get_files  info_fifo.xci]
#set_property generate_synth_checkpoint true [get_files  info_fifo.xci]
#create_ip_run [get_files  info_fifo.xci]
#launch_run  info_fifo_synth_1
#
##set_property is_enabled true [get_files  info_fifo.xci]
##reset_target all [get_ips info_fifo]
##generate_target all [get_ips  info_fifo]

read_verilog "./source/nf10_axis_converter.v"
update_compile_order -fileset sources_1


update_compile_order -fileset sim_1
ipx::package_project
set_property library ${lib_name} [ipx::current_core]
set_property vendor_display_name {NetFPGA} [ipx::current_core]
set_property company_url {www.netfpga.org} [ipx::current_core]
set_property vendor {NetFPGA} [ipx::current_core]
set_property supported_families {{virtex7} {Production}} [ipx::current_core]
set_property taxonomy {{/NetFPGA/Generic}} [ipx::current_core]
ipx::add_subcore NetFPGA:NetFPGA:fallthrough_small_fifo:1.0 [ipx::get_file_groups xilinx_verilogsynthesis -of_objects [ipx::current_core]]
ipx::add_subcore NetFPGA:NetFPGA:fallthrough_small_fifo:1.0 [ipx::get_file_groups xilinx_verilogbehavioralsimulation -of_objects [ipx::current_core]]
ipx::infer_user_parameters [ipx::current_core]

ipx::add_user_parameter {C_M_AXIS_DATA_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_M_AXIS_DATA_WIDTH [ipx::current_core]]
set_property display_name {C_M_AXIS_DATA_WIDTH} [ipx::get_user_parameter C_M_AXIS_DATA_WIDTH [ipx::current_core]]
set_property value {64} [ipx::get_user_parameter C_M_AXIS_DATA_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_M_AXIS_DATA_WIDTH [ipx::current_core]]

ipx::add_user_parameter {C_S_AXIS_DATA_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_S_AXIS_DATA_WIDTH [ipx::current_core]]
set_property display_name {C_S_AXIS_DATA_WIDTH} [ipx::get_user_parameter C_S_AXIS_DATA_WIDTH [ipx::current_core]]
set_property value {256} [ipx::get_user_parameter C_S_AXIS_DATA_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_S_AXIS_DATA_WIDTH [ipx::current_core]]

ipx::add_user_parameter {C_M_AXIS_TUSER_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_M_AXIS_TUSER_WIDTH [ipx::current_core]]
set_property display_name {C_M_AXIS_TUSER_WIDTH} [ipx::get_user_parameter C_M_AXIS_TUSER_WIDTH [ipx::current_core]]
set_property value {128} [ipx::get_user_parameter C_M_AXIS_TUSER_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_M_AXIS_TUSER_WIDTH [ipx::current_core]]

ipx::add_user_parameter {C_S_AXIS_TUSER_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_S_AXIS_TUSER_WIDTH [ipx::current_core]]
set_property display_name {C_S_AXIS_TUSER_WIDTH} [ipx::get_user_parameter C_S_AXIS_TUSER_WIDTH [ipx::current_core]]
set_property value {128} [ipx::get_user_parameter C_S_AXIS_TUSER_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_S_AXIS_TUSER_WIDTH [ipx::current_core]]

ipx::add_user_parameter {C_LEN_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_LEN_WIDTH [ipx::current_core]]
set_property display_name {C_LEN_WIDTH} [ipx::get_user_parameter C_LEN_WIDTH [ipx::current_core]]
set_property value {16} [ipx::get_user_parameter C_LEN_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_LEN_WIDTH [ipx::current_core]]

ipx::add_user_parameter {C_SPT_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_SPT_WIDTH [ipx::current_core]]
set_property display_name {C_SPT_WIDTH} [ipx::get_user_parameter C_SPT_WIDTH [ipx::current_core]]
set_property value {8} [ipx::get_user_parameter C_SPT_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_SPT_WIDTH [ipx::current_core]]

ipx::add_user_parameter {C_DPT_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_DPT_WIDTH [ipx::current_core]]
set_property display_name {C_DPT_WIDTH} [ipx::get_user_parameter C_DPT_WIDTH [ipx::current_core]]
set_property value {8} [ipx::get_user_parameter C_DPT_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_DPT_WIDTH [ipx::current_core]]

ipx::add_user_parameter {C_DEFAULT_VALUE_ENABLE} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_DEFAULT_VALUE_ENABLE [ipx::current_core]]
set_property display_name {C_DEFAULT_VALUE_ENABLE} [ipx::get_user_parameter C_DEFAULT_VALUE_ENABLE [ipx::current_core]]
set_property value {0} [ipx::get_user_parameter C_DEFAULT_VALUE_ENABLE [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_DEFAULT_VALUE_ENABLE [ipx::current_core]]

ipx::add_user_parameter {C_DEFAULT_SRC_PORT} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_DEFAULT_SRC_PORT [ipx::current_core]]
set_property display_name {C_DEFAULT_SRC_PORT} [ipx::get_user_parameter C_DEFAULT_SRC_PORT [ipx::current_core]]
set_property value {0} [ipx::get_user_parameter C_DEFAULT_SRC_PORT [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_DEFAULT_SRC_PORT [ipx::current_core]]

ipx::add_user_parameter {C_DEFAULT_DST_PORT} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_DEFAULT_DST_PORT [ipx::current_core]]
set_property display_name {C_DEFAULT_DST_PORT} [ipx::get_user_parameter C_DEFAULT_DST_PORT [ipx::current_core]]
set_property value {0} [ipx::get_user_parameter C_DEFAULT_DST_PORT [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_DEFAULT_DST_PORT [ipx::current_core]]

ipx::save_core [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::archive_core ${ip_output} [ipx::current_core]
update_ip_catalog
update_ip_catalog -add_ip ${ip_output} -repo_path ${repo_dir}
#create_ip -name ${design} -vendor NetFPGA -library NetFPGA -module_name  ${design}_ip
#set_property generate_synth_checkpoint false [get_files  ${design}_ip.xci]
#set_property is_enabled true [get_files  ${design}_ip.xci]
#reset_target all [get_ips ${design}_ip]
#generate_target all [get_ips  ${design}_ip]
close_project











