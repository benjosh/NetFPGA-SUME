create_ip -name fallthrough_small_fifo -vendor NetFPGA -library NetFPGA -module_name  fallthrough_small_fifo_oq_output
set_property -dict [list CONFIG.WIDTH {385}] [get_ips fallthrough_small_fifo_oq_output]
set_property -dict [list CONFIG.MAX_DEPTH_BITS {7}] [get_ips fallthrough_small_fifo_oq_output]
set_property -dict [list CONFIG.PROG_FULL_THRESHOLD {78}] [get_ips fallthrough_small_fifo_oq_output]
set_property generate_synth_checkpoint false [get_files  fallthrough_small_fifo_oq_output.xci]
set_property is_enabled true [get_files  fallthrough_small_fifo_oq_output.xci]
reset_target all [get_ips fallthrough_small_fifo_oq_output]
generate_target all [get_ips  fallthrough_small_fifo_oq_output]


create_ip -name fallthrough_small_fifo -vendor NetFPGA -library NetFPGA -module_name  fallthrough_small_fifo_oq_meta
set_property -dict [list CONFIG.WIDTH {385}] [get_ips fallthrough_small_fifo_oq_meta]
set_property -dict [list CONFIG.MAX_DEPTH_BITS {7}] [get_ips fallthrough_small_fifo_oq_meta]
set_property -dict [list CONFIG.PROG_FULL_THRESHOLD {78}] [get_ips fallthrough_small_fifo_oq_meta]
set_property generate_synth_checkpoint false [get_files  fallthrough_small_fifo_oq_meta.xci]
set_property is_enabled true [get_files  fallthrough_small_fifo_oq_meta.xci]
reset_target all [get_ips fallthrough_small_fifo_oq_meta]
generate_target all [get_ips  fallthrough_small_fifo_oq_meta]



