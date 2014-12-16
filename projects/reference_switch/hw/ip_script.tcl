;# Defines and sources
set scripts_vivado_version 		2014.2
set part_version			xc7vx690t-2-ffg1761

;# Local definitions
set project_directory 			./synth
set repo_directory 			./ip_repo

;# design related definitions
#set current_design 			output_queues 
#set top 				output_queues 
#set ip_version 				v1_0_0
#set ip_output 				$::env(IP_FOLDER)/${current_design}/${current_design}_${ip_version}.zip
set lib_name 				NetFPGA


;# all req. xilinx ips specified here
;# are configured from already packaged IPs
;# These are fetched from $::env(IP_FOLDER). 
;# Parts of an ip name will also work.
set target_ip_blks [list]
set target_ip_blks 			{"fallthrough_small_fifo"\
					 "input_arbiter"\
                                         "output_queues"\
					 "output_port_lookup"\
                                         "nf10_axis_converter"\
					 "nf_10g_interface"} 

;# Set of xilinx ips that
;# are configured from HDL SOURCES.
;# These are fetched from $::env(XILINX_IP_FOLDER).
;# Partial names will also work. 
set target_ip_srcs [list]	 
set target_ip_srcs 		       {}
#"axi_lite_ipif"}
#					  "axi_iic" }

;# set of directory tags to find SOURCES
;# can be expanded
set ip_rtl_dir_names [list]
set ip_rtl_dir_names			{ "source" \
					  "sources"\
					  "srcs"   \		
					  "rtl"	   \
					  "hdl"	    }

;###########################################################
;# Main Procedures 
;###########################################################

;# Proc finds an IP in Xilinx catalog and 
;# copies it into the local repository. 
proc find_copy_ip {src_dir dest_dir ip_name} {

	# Search the required IP and
	# rename it if exists.
	set old_tag "_old"
	foreach loc_ip [glob -nocomplain -directory $dest_dir -type d *] {
		set regExpr ""
		set rename_ip ""
		set target [regexp [append regExpr "(.*?)" $ip_name "(.*?)"] $loc_ip]
		if [expr $target > 0] {			
			set rename_ip [string trim $loc_ip][string trim $old_tag]
			puts "The required IP is found in the local folder: \n $loc_ip \n"
			file rename -force $loc_ip $rename_ip
			puts "The IP is renamed into: \n $rename_ip \n"
		} else {
			continue
		}
	}
		
	# Look for the required IP and copy it
	# into the local directory.	
	set success 0
	foreach ip [glob -nocomplain -directory $src_dir -type d *] {
		set regExpr ""
		set target [regexp [append regExpr "(.*?)" $ip_name "(.*?)"] $ip]
		if [expr $target > 0] {	
			set dir_tail [file tail $ip]
			# XXX-BZ ugly hack to avoid what looks like a TCL bug
			# when recursively copying a directory into another;
			# rather than taking all files it copies the directory in this case.
			set dirx_tail "tempdir"
			file mkdir $dest_dir/$dirx_tail	
			file copy -force -- $ip $dest_dir/$dirx_tail/
			file rename $dest_dir/$dirx_tail/$dir_tail $dest_dir/$dir_tail
			file delete $dest_dir/$dirx_tail
			puts "Fetching the following IP: \n $ip \n into the local folder: \n $dest_dir \n"		
			set success 1
		} else {
			continue
		}
	}
   return $success
}

;# Proc modifies the hidden IP attribute, 
;# enabling the IP for further reuse.
proc change_hidden_attribute_ip {src_dir ip_name} {
	# get all local folders
	set all_loc_ips [list]
	set all_loc_ips [concat \
		[glob -nocomplain -directory $src_dir -type d *]]
		
	# find the required IP in local directory 	
	foreach ip $all_loc_ips {
		set regExpr ""
		set target [regexp [append regExpr "(.*?)" $ip_name "(.*?)"] $ip]
		if [expr $target > 0] {
			set ip_dir_found $ip
		} else {
			continue
		}	
	}
		
	puts "The required IP is found locally:\n $ip_dir_found \n" 
	
	# find the "component" file in the directory
	set files [glob -nocomplain -directory $ip_dir_found *]
	foreach item $files {		
		if {![file isdirectory $item]} {
			set name [file tail $item]
			if {[string equal $name "component.xml" ]} {
				set file_found 	$item
				puts $file_found
			} else {
				continue
			}	
		} else {
			continue
		}
	}
	
	# Open the file for w/r operations 
	# and change "GUI Hidden" attribute to "false".
	# Read file and save contents into variable.
	set fi [open "$file_found" r]
    set file_data [read $fi]
    close $fi
	 
	# split the contents 
	set data [split $file_data "\n"]
    
	# search tags	
	set hide_true ">true<"
	set hide_false ">false<"
	set hide_attr "xilinx:hide"  
	
	# replace the required line in the list
	set idx -1
	set success 0
	foreach data_line $data {
		set regE ""
		set temp ""	
		[incr idx]
		set target [regexp [append regE "(.*?)" $hide_attr "(.*?)" $hide_true "(.*?)"] $data_line]
		if {[expr $target > 0]} {
			set temp $data_line
			regsub -all $hide_true $temp $hide_false temp
			lset data $idx $temp
			puts "hideInCatalogGUI attribute >true< is found. Changing it to >false< for IP reuse. \n"
			set success 1
		} else {
			continue
		}
	}
	 
	# write changes back to file
	set fo [open "$file_found" w]
	foreach d_line $data {
		puts $fo $d_line
	}
	close $fo
	
	return $success
}

;# Proc creates and generate an IP from 
;# the locally copied sources.
proc create_generate_ip { ip_name module_ip_name synth_chk_point ref_to_sources } {
	set success 0 
	
	create_ip -name $ip_name -vendor NetFPGA -library NetFPGA -module_name $module_ip_name
	set_property -name CONFIG.Component_Name -value $module_ip_name -objects [get_ips $module_ip_name]
	
	set module_ip_name_xci [append module_ip_name ".xci"]
	generate_target {instantiation_template} [get_files $module_ip_name_xci -of_objects $ref_to_sources]
	
	set all_ips_with_name [append ip_name "*"]	
#	report_property -all [get_ips $all_ips_with_name]
	
	set_property generate_synth_checkpoint $synth_chk_point [get_files $module_ip_name_xci]
	generate_target all [get_files $module_ip_name_xci]

	set success 1
	return $success
}

;# Proc creates and generate a Xilinx IP from 
;# the locally copied sources.
proc create_generate_xilinx_ip { xilinx_ip_name module_ip_name synth_chk_point ref_to_sources } {
	set success 0 
	
	create_ip -name $xilinx_ip_name -vendor xilinx.com -library ip -module_name $module_ip_name
	set_property -name CONFIG.Component_Name -value $module_ip_name -objects [get_ips $module_ip_name]
	
	set module_ip_name_xci [append module_ip_name ".xci"]
	generate_target {instantiation_template} [get_files $module_ip_name_xci -of_objects $ref_to_sources]
	
	set all_ips_with_name [append xilinx_ip_name "*"]	
#	report_property -all [get_ips $all_ips_with_name]
	
	set_property generate_synth_checkpoint $synth_chk_point [get_files $module_ip_name_xci]
	generate_target all [get_files $module_ip_name_xci]

	set success 1
	return $success
}


;# finds all files in a specified directory
proc find_all_files {{dirs .}} {
    set result [list]	
    while {[llength $dirs]} {
        set dirs [lassign $dirs name]
        lappend dirs {*}[glob -nocomplain -directory $name -type {d f} *]

	if {$name ni $result} {
		if {[file isfile $name]} {		
	 		lappend result $name
		} else {
		}
	} else {		
	}
    }

    return $result	
}

;###########################################################################
;# Main program loop
;###########################################################################	

;####################################
;# Vivado version
;#################################### 

# Vivado version -- from Steve's script
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. \n" 
   puts "Please upgrade the design by running \"Tools => Report => Report IP Status...\", \n"
   puts "then run write_bd_tcl to create an updated script.\n"
   return 1
}

;###########################################
;# Project -package IP in the Project Mode
;###########################################

# Create Project with -part and -ip options
#create_project -name $current_design -force -dir ./$project_directory -part $part_version 
#puts "Current project directory: $project_directory \n"

# project properties
#set_property source_mgmt_mode None [current_project] 
#set_property top ${top} [current_fileset]

	
# look if "ip_repo/" folder exists; delete and recreate if true.
foreach folder [glob -nocomplain -directory [pwd] -type d *] {
	set regExpr ""
	set target [regexp [append regExpr "(.*?)" $repo_directory "(.*?)"] $folder]
	if [expr $target > 0] {		
		file delete -force $folder 		

		# create new "ip_repos/" folder 
		file mkdir $repo_directory
	} else {
		continue
	}	
}

# Add local IP repository to the fileset 
set_property ip_repo_paths ${repo_directory} [current_fileset]

;############################################
;# generate IPs with all HDL and IP dependencies  
;############################################
#puts "Creating an Input Arbiter IP"

#set_property part $part_version [current_project]

;############################################
;# generate Xilinx pre-buid IPs with all dependencies    
;############################################

foreach blk_ip_name $target_ip_blks {

	# # Find and copy IP to the local directory,
	# # using the procedure above
	# # Use multiple times if many IPs need to be generated
	set find_copy_proc [find_copy_ip $::env(IP_FOLDER) $repo_directory $blk_ip_name]

	# # Check whether the hidden attribute is set.
	# # Modify it if true.
#	set change_hidden_proc [change_hidden_attribute_ip $repo_directory $blk_ip_name]

	update_ip_catalog

	# # generate xilinx IP from local sources with all dependencies 
	# # (VHDL or Verilog)
	# # *.xci file name is current name + "_gen"
	set new_blk_ip_name [string trim $blk_ip_name][string trim "_ip"]
	set create_genetare_proc [create_generate_ip $blk_ip_name $new_blk_ip_name "false" [get_filesets sources_1] ]
}

;#########################################
;# add any XILINX HDL IP sources  
;#########################################

;# Use ONLY if xilinx ip is not packaged!

# get all folders inside $::env(XILINX_IP_FOLDER)
# and find the required Xilinx IP folder
# specified as $target_ip_srcs

# find the required IP in LOCAL xilinx ip directory. 
# for every searched IP
foreach targ_ip_src $target_ip_srcs {	

	# populate all directories
	foreach ip_srcs_d [glob -nocomplain -directory $::env(XILINX_IP_FOLDER) -type d *] {
		set regExpr ""
		set target_d [regexp [append regExpr "(.*?)" $targ_ip_src "(.*?)"] $ip_srcs_d]

		# Search for the required IPs
		if [expr $target_d > 0] {

			# search for any source/rtl/hdl folders inside the IP
			foreach ip_rtl_name $ip_rtl_dir_names {
				if {[file isdirectory $ip_srcs_d/$ip_rtl_name]} {
					puts "Importing : $ip_srcs_d/$ip_rtl_name \n"
					
					# use custom procedure to recursevely walk all dirs
					# SEARCH recursively N-levels deep
					set all_files [list]
					set all_files [find_all_files $ip_srcs_d/$ip_rtl_name]
					
					#import everything from this dir!
					foreach file_found $all_files {
						import_files -fileset [get_filesets sources_1] $file_found
					}					
				} else {
					continue
				}
			}
		} else {
			continue
		}
	}
}
	
;#########################################
;# add any CUSTOM HDL IP sources  
;#########################################

;# find the required IP sources in LOCAL directory. 
# get all local dirs 
foreach ip_srcs_d [glob -nocomplain -directory [pwd] -type d *] {

	# make sure it is a folder
	if {[file isdirectory $ip_srcs_d]} {
	#	puts "Local : $ip_srcs_d \n"
		# search for source/rtl/hdl tags
		foreach ip_rtl_name $ip_rtl_dir_names {
			set regExpr ""
			set target_d [regexp [append regExpr "(.*?)" $ip_rtl_name "(.*?)"] $ip_srcs_d]
			if [expr $target_d > 0] {
				puts "Importing : $ip_srcs_d \n"
				# search N levels deep and import
				set all_files [list]
				set all_files [find_all_files $ip_srcs_d]

				foreach file_found $all_files {
					import_files -fileset [get_filesets sources_1] $file_found
				}					
			} else {
				continue
			}
		}
		
	}	
}

update_compile_order -fileset sources_1

;#########################################
;# package your target IP   
;#########################################
#ipx::package_project

# SET parameter constraints
#set_property library 			${lib_name} [ipx::current_core] 
#set_property vendor_display_name 	{NetFPGA} [ipx::current_core]
#set_property company_url 		{www.netfpga.org} [ipx::current_core]
#set_property vendor 			{NetFPGA} [ipx::current_core]
#set_property supported_families 	{{virtex7} {Production}} [ipx::current_core]
#set_property taxonomy 			{{/NetFPGA/Data_Path}} [ipx::current_core]
#set_property value 			{0x01} [ipx::get_user_parameter C_ARD_NUM_CE_ARRAY [ipx::current_core]]

# package and INTEGRITY check
#ipx::infer_user_parameters [ipx::current_core]
#ipx::save_core [ipx::current_core]
#ipx::check_integrity [ipx::current_core]
#ipx::archive_core ${ip_output} [ipx::current_core]

#close_project

