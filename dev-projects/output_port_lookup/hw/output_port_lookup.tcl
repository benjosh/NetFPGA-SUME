# Vivado Launch Script
#### Change design settings here #######
set design output_port_lookup
set top output_port_lookup
set device xc7vx690t-2-ffg1761
set proj_dir ./synth
#set repo_dir ./ip_repo
set repo_dir ../../../lib/ip_repo
set ip_version v1_0_0
#set ip_output $::env(IP_FOLDER)/${design}/${design}_${ip_version}.zip
set ip_output ../../../lib/hw/std/cores/${design}/${design}_${ip_version}.zip
set lib_name NetFPGA
#####################################
# set IP paths
#####################################
 #set axi_lite_ipif_ip_path $::env(XILINX_IP_FOLDER)/axi_lite_ipif/source/
set axi_lite_ipif_ip_path ../../../lib/hw/xilinx/cores/axi_lite_ipif/source/
#set fallthrough_small_fifo_ip $::env(IP_FOLDER)/generic/fallthrough_small_fifo_v1_0_0.zip
set fallthrough_small_fifo_ip ../../../lib/hw/std/cores/generic/fallthrough_small_fifo_v1_0_0.zip
#####################################
# Project Settings
#####################################
create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} -ip
#set_property source_mgmt_mode None [current_project] 
set_property source_mgmt_mode All [current_project]  
set_property top ${top} [current_fileset]
  file mkdir ${repo_dir}
 set_property ip_repo_paths ${repo_dir} [current_fileset]
puts "Creating Output Port Lookup IP"
# Project Constraints
#####################################
# Project Structure & IP Build
#####################################
read_verilog "${axi_lite_ipif_ip_path}/address_decoder.v"
read_verilog "${axi_lite_ipif_ip_path}/axi_lite_ipif.v"
read_verilog "${axi_lite_ipif_ip_path}/counter_f.v"
read_verilog "${axi_lite_ipif_ip_path}/pselect_f.v"
read_verilog "${axi_lite_ipif_ip_path}/slave_attachment.v"
#read_verilog "./source/fallthrough_small_fifo_v2.v"
#read_verilog "./source/small_fifo_v3.v"
#update_ip_catalog
#update_ip_catalog -add_ip ${fallthrough_small_fifo_ip} -repo_path ${repo_dir}
##create_ip -name fallthrough_small_fifo -vendor NetFPGA -library NetFPGA -module_name input_fifo
##set_property generate_synth_checkpoint false [get_files input_fifo.xci]
###set_property generate_synth_checkpoint true [get_files input_fifo.xci]
##set_property is_enabled true [get_files  input_fifo.xci]
###create_ip_run [get_files input_fifo.xci]
##reset_target all [get_ips input_fifo]
##generate_target all [get_ips input_fifo]

#create_ip -name fallthrough_small_fifo -vendor NetFPGA -library NetFPGA -module_name fallthrough_small_fifo_ip
#set_property generate_synth_checkpoint false [get_files  fallthrough_small_fifo_ip.xci]
#set_property generate_synth_checkpoint true [get_files input_fifo.xci]
#set_property is_enabled true [get_files   fallthrough_small_fifo_ip.xci]
#create_ip_run [get_files input_fifo.xci]
#reset_target all [get_ips  fallthrough_small_fifo_ip]
#generate_target all [get_ips  fallthrough_small_fifo_ip]


read_verilog "./source/cpu_sync.v"
read_verilog "./source/small_async_fifo.v"
read_verilog "./source/opl_cpu_regs_defines.v"
read_verilog "./source/opl_cpu_regs.v"
read_verilog "./source/output_port_lookup.v"
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
ipx::package_project
set_property library ${lib_name} [ipx::current_core]
set_property vendor_display_name {NetFPGA} [ipx::current_core]
set_property company_url {www.netfpga.org} [ipx::current_core]
set_property vendor {NetFPGA} [ipx::current_core]
#set_property value {0x1} [ipx::get_user_parameter C_ARD_NUM_CE_ARRAY [ipx::current_core]]
set_property value {1} [ipx::get_user_parameter C_NUM_ADDRESS_RANGES [ipx::current_core]]
set_property value {1} [ipx::get_user_parameter C_TOTAL_NUM_CE [ipx::current_core]]
set_property value {0} [ipx::get_user_parameter C_DPHASE_TIMEOUT [ipx::current_core]]
set_property value {0} [ipx::get_user_parameter C_USE_WSTRB [ipx::current_core]]
set_property value {32} [ipx::get_user_parameter C_S_AXI_ADDR_WIDTH [ipx::current_core]]
set_property value {32} [ipx::get_user_parameter C_S_AXI_DATA_WIDTH [ipx::current_core]]

set_property supported_families {{virtex7} {Production}} [ipx::current_core]
set_property taxonomy {{/NetFPGA/Data_Path}} [ipx::current_core]
ipx::add_subcore NetFPGA:NetFPGA:fallthrough_small_fifo:1.0 [ipx::get_file_groups xilinx_verilogsynthesis -of_objects [ipx::current_core]]
ipx::add_subcore NetFPGA:NetFPGA:fallthrough_small_fifo:1.0 [ipx::get_file_groups xilinx_verilogbehavioralsimulation -of_objects [ipx::current_core]]


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










