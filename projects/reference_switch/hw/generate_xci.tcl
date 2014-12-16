;# Defines and sources
set scripts_vivado_version 		2014.2
set part_version			xc7vx690tffg1761-2
;# set this as env variable
set xilinx_ip_catalog			"/opt/Xilinx/Vivado/$scripts_vivado_version/data/ip/xilinx/"
set ip_catalog			        $::env(IP_FOLDER)

;# Local definitions
set current_directory 			[pwd]
set xci_directory			$current_directory/xci/
set project_name			project_1
set simulator_language			Mixed
set target_language 			verilog 

puts "cur: $current_directory \n"
puts "xci: $xci_directory \n"

;# IP && parameters
set xil_ip_name 			pcie3_7x
set gen_xil_ip_name 			[string trim $xil_ip_name][string trim "_0"]
#set ip_name [list]
set ip_name 			{"fallthrough_small_fifo"}
#\
#					 "input_arbiter"\
 #                                        "output_queues"\
#					 "output_port_lookup"\
 #                                        "nf10_axis_converter"\
#					 "nf_10g_interface"} 
#set gen_ip_name [list]
set gen_ip_name 			[string trim $ip_name][string trim "_ip"]

;# use < report_property -all [get_ips $gen_ip_name]> 
;# for a complete list of CONFIG. OPTIONS for each core.

;# use dictionary format to specify parameters.
#set gen_ip_params [dict create  CONFIG.xlnx_ref_board {None} \
#				CONFIG.pcie_blk_locn {X0Y1} \
#				CONFIG.PL_LINK_CAP_MAX_LINK_WIDTH {X8} \
#				CONFIG.SRIOV_CAP_ENABLE {false} \
#				CONFIG.pf0_bar0_64bit {true} \
#				CONFIG.PL_LINK_CAP_MAX_LINK_SPEED {8.0_GT/s} \
#				CONFIG.pf0_bar0_scale {Megabytes} \
#				CONFIG.pf0_bar0_size {1} \
#				CONFIG.pf0_bar2_enabled {true} \
#				CONFIG.pf0_bar2_64bit {true} \
#				CONFIG.pf0_bar2_scale {Megabytes} \
#				CONFIG.pf0_bar2_size {1} \
#				CONFIG.pf0_msix_enabled {true} \
#				CONFIG.mode_selection {Advanced} \
#				CONFIG.gen_x0y0 {false} \
#				CONFIG.gen_x0y1 {true} \
#				CONFIG.axisten_if_width {256_bit} \
#				CONFIG.AXISTEN_IF_RC_STRADDLE {true} \
#				CONFIG.PF0_DEVICE_ID {7038} \
#				CONFIG.PF1_DEVICE_ID {7011} \
#				CONFIG.pf0_bar2_type {Memory} \
#				CONFIG.PF0_SRIOV_CAP_INITIAL_VF {0} \
#				CONFIG.PF0_SRIOV_FIRST_VF_OFFSET {N/A} \
#				CONFIG.PF0_MSIX_CAP_TABLE_SIZE {001} \
#				CONFIG.PF0_MSIX_CAP_TABLE_OFFSET {00000040} \
#				CONFIG.PF0_MSIX_CAP_TABLE_BIR {BAR_1:0} \
#				CONFIG.PF0_MSIX_CAP_PBA_OFFSET {00000050} \
#				CONFIG.PF0_MSIX_CAP_PBA_BIR {BAR_1:0} \
#				CONFIG.pf0_ari_enabled {false} \
#				CONFIG.SRIOV_CAP_ENABLE_EXT {false} \
#				CONFIG.axisten_freq {250}]

;# use dictionary format to specify parameters.
set gen_ip_params [dict create  CONFIG.C_M_AXIS_DATA_WIDTH {256} \
				CONFIG.C_S_AXIS_DATA_WIDTH {256} ]


;###########################################################
;# Main Procedures 
;###########################################################

;# Procedure finds and configures the required ip from 
;# xilinx ip catalog. The procedure does config of 
;# ALL parameters specified above in the list.
;# use < report_property -all [get_ips $gen_ip_name]> 
;#
;# Usage: { xilinx IP catalog; curr project dir; xilinx ip name; post-config ip name; param list}
;#
proc find_configure_ip {src_dir dest_dir ip_name ip_name_post ip_params} {
	# check whether (Xilinx) $src_dir exists
	if [catch {cd $src_dir} err] {
		puts stderr $err
		return
	} else {
		cd $dest_dir		
	}
	
	# Grab all IP folders from Xilinx IP repository.
	set all_ip_src_dirs [list]
	set all_ip_src_dirs [concat \
		[glob -nocomplain -directory $src_dir -type d *]]

	# Look for the required IP and configure it
	set success 0
	foreach ip $all_ip_src_dirs {
		set regExpr ""
		set target [regexp [append regExpr "(.*?)" $ip_name "(.*?)"] $ip]
		# IP found
		if [expr $target > 0] {	
			create_ip -name $ip_name -version 3.0 -vendor xilinx.com -library ip -module_name $ip_name_post
			
			# ADD list of options
			foreach item [dict keys $ip_params] {
				set val [dict get $ip_params $item]
				# puts "( $item , $val ) pair "
	   			set_property $item $val [get_ips $ip_name_post]				
			}

			set module_ip_name_xci [append ip_name_post_xil ".xci"]
					
			set_property generate_synth_checkpoint true [get_files $module_ip_name_xci]
			generate_target all [get_files $module_ip_name_xci]

			puts "Configuration of the following IP: \n $ip_name_xil \n into the local folder: \n $dest_dir \n is successful! \n"		
			set success 1
		} else {
			continue
		}
	}


	return $success
}

;###########################################################################
;# Main program loop
;###########################################################################	

;####################################
;# Project options
;####################################

# Create Project with -part option && -in_memory 
create_project $project_name ./$project_name -part $part_version -in_memory

# Set the directory path for the new project
set project_dir [get_property directory [current_project]]
puts "Current project directory: $project_dir \n"

# Set project properties
set obj [get_projects $project_name]
set_property simulator_language $simulator_language $obj
set_property target_language $target_language $obj

;####################################
;# IPs - Configuration
;####################################

# -- configuration of the IP --
puts "IP catalog:  $ip_catalog"
set find_conf_ip_proc [find_configure_ip $ip_catalog $project_dir $ip_name $gen_ip_name $gen_ip_params]

update_ip_catalog

# -- get the list of generated files --
# -- copy *.xci file(s) in the corresponding xci/ folder --
foreach item [get_files -of_objects [get_filesets sources_1]] {		
	if {![file isdirectory $item]} {
		set name [file tail $item]
		set regExpr ""
		set target [regexp [append regExpr "(.*?)" ".xci"] $name]
		if [expr $target > 0] {
			file copy -force $item $xci_directory
			puts "XCI file $item \n"
			puts "has been successfully copied into: \n"
			puts "$xci_directory ! \n"
		} else {
			continue
		}
	} else {
		continue 
	}	
}

close_project

exit
	
