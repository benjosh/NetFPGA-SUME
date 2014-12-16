create_ip -name fallthrough_small_fifo -vendor NetFPGA -library NetFPGA -module_name fallthrough_small_fifo_opl
set_property -dict [list CONFIG.WIDTH {417}] [get_ips fallthrough_small_fifo_opl]
set_property -dict [list CONFIG.MAX_DEPTH_BITS {2}] [get_ips fallthrough_small_fifo_opl]
set_property generate_synth_checkpoint false [get_files  fallthrough_small_fifo_opl.xci]
set_property is_enabled true [get_files  fallthrough_small_fifo_opl.xci]
reset_target all [get_ips fallthrough_small_fifo_opl]
generate_target all [get_ips  fallthrough_small_fifo_opl]


#create_ip -name fallthrough_small_fifo -vendor NetFPGA -library NetFPGA -module_name  fallthrough_small_fifo_ip
#set_property -dict [list CONFIG.WIDTH {417}] [get_ips fallthrough_small_fifo_ip]
#set_property -dict [list CONFIG.MAX_DEPTH_BITS {5}] [get_ips fallthrough_small_fifo_ip]
#set_property generate_synth_checkpoint false [get_files  fallthrough_small_fifo_ip.xci]
#set_property is_enabled true [get_files  fallthrough_small_fifo_ip.xci]
#reset_target all [get_ips fallthrough_small_fifo_ip]
#generate_target all [get_ips  fallthrough_small_fifo_ip]
