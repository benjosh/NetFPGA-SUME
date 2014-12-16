create_ip -name fallthrough_small_fifo -vendor NetFPGA -library NetFPGA -module_name  fallthrough_small_fifo_input_arbiter
set_property -dict [list CONFIG.WIDTH {417}] [get_ips fallthrough_small_fifo_input_arbiter]
set_property -dict [list CONFIG.MAX_DEPTH_BITS {5}] [get_ips fallthrough_small_fifo_input_arbiter]
set_property generate_synth_checkpoint false [get_files  fallthrough_small_fifo_input_arbiter.xci]
set_property is_enabled true [get_files  fallthrough_small_fifo_input_arbiter.xci]
reset_target all [get_ips fallthrough_small_fifo_input_arbiter]
generate_target all [get_ips  fallthrough_small_fifo_input_arbiter]


#create_ip -name fallthrough_small_fifo -vendor NetFPGA -library NetFPGA -module_name  fallthrough_small_fifo_ip
#set_property -dict [list CONFIG.WIDTH {417}] [get_ips fallthrough_small_fifo_ip]
#set_property -dict [list CONFIG.MAX_DEPTH_BITS {5}] [get_ips fallthrough_small_fifo_ip]
#set_property generate_synth_checkpoint false [get_files  fallthrough_small_fifo_ip.xci]
#set_property is_enabled true [get_files  fallthrough_small_fifo_ip.xci]
#reset_target all [get_ips fallthrough_small_fifo_ip]
#generate_target all [get_ips  fallthrough_small_fifo_ip]
