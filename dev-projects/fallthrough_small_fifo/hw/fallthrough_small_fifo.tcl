# Vivado Launch Script
#### Change design settings here #######
set design fallthrough_small_fifo
set top fallthrough_small_fifo
set device xc7vx690t-2-ffg1761
set proj_dir ./synth
#set repo_dir ./ip_repo
#set repo_dir ../../../lib/ip_repo
#set repo_dir $::env(SUME_FOLDER)/lib/ip_repo
set repo_dir /root/NetFPGA-SUME-2014.2/lib/ip_repo
set ip_version v1_0_0
#set ip_output $::env(IP_FOLDER)/generic/${design}_${ip_version}.zip
#set ip_output $::env(SUME_FOLDER)/lib/hw/std/cores/generic/${design}_${ip_version}.zip
set ip_output /root/NetFPGA-SUME-2014.2/lib/hw/std/cores/generic/fallthrough_small_fifo_v1_0_0.zip
set lib_name NetFPGA
#####################################
# set IP paths
#####################################
set fallthrough_small_fifo_ip $::env(SUME_FOLDER)/lib/hw/std/cores/generic/${design}_${ip_version}.zip
#####################################
# Project Settings
#####################################
create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} -ip
#set_property source_mgmt_mode None [current_project] 
set_property source_mgmt_mode All [current_project]
set_property top ${top} [current_fileset]
  file mkdir ${repo_dir}
 set_property ip_repo_paths ${repo_dir} [current_fileset]
puts "Creating Fallthrough Small FIFO IP"
# Project Constraints
#####################################
# Project Structure & IP Build
#####################################

read_verilog "./source/fallthrough_small_fifo.v"
read_verilog "./source/small_fifo.v"
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
ipx::package_project
set_property library ${lib_name} [ipx::current_core]
set_property vendor_display_name {NetFPGA} [ipx::current_core]
set_property company_url {www.netfpga.org} [ipx::current_core]
#set_property name {nf10_input_arbiter} [ipx::current_core]
set_property vendor {NetFPGA} [ipx::current_core]
set_property supported_families {{virtex7} {Production}} [ipx::current_core]
set_property taxonomy {{/NetFPGA/Generic}} [ipx::current_core]
ipx::infer_user_parameters [ipx::current_core]

ipx::add_user_parameter {WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter WIDTH [ipx::current_core]]
set_property display_name {WIDTH} [ipx::get_user_parameter WIDTH [ipx::current_core]]
set_property value {72} [ipx::get_user_parameter WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter WIDTH [ipx::current_core]]

ipx::add_user_parameter {MAX_DEPTH_BITS} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter MAX_DEPTH_BITS [ipx::current_core]]
set_property display_name {MAX_DEPTH_BITS} [ipx::get_user_parameter MAX_DEPTH_BITS [ipx::current_core]]
set_property value {3} [ipx::get_user_parameter MAX_DEPTH_BITS [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter MAX_DEPTH_BITS [ipx::current_core]]

ipx::add_user_parameter {PROG_FULL_THRESHOLD} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter PROG_FULL_THRESHOLD [ipx::current_core]]
set_property display_name {PROG_FULL_THRESHOLD} [ipx::get_user_parameter PROG_FULL_THRESHOLD [ipx::current_core]]
set_property value {2} [ipx::get_user_parameter PROG_FULL_THRESHOLD [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter PROG_FULL_THRESHOLD [ipx::current_core]]

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











