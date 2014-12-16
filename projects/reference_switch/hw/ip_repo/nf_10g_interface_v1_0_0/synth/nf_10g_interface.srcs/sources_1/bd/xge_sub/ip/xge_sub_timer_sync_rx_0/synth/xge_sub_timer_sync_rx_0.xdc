# This is the critical clock domain signal crossing upon which this entire design is hinged
set_max_delay -from [get_cells {*bit8_sample_rising/source_data_in_reg*_reg}] -to [get_cells {*bit8_sample_rising/data_sync1_reg}] 0.800 -datapath_only
set_max_delay -from [get_cells {*bit8_sample_falling/source_data_in_reg*_reg}] -to [get_cells {*bit8_sample_falling/data_sync1_reg}] 0.800 -datapath_only

# Constrain the static busses for sampling onto the local clock domain
set_max_delay -from [get_cells {*source_nanosec_sample_reg[*]}] -to [get_cells {*source_nanosec_8_0_wrap_value_reg[*]}] 3.1 -datapath_only
set_max_delay -from [get_cells {*timer_sec_sample_reg[*]}]      -to [get_cells {*resync_sec_reg[*]}] 3.1 -datapath_only
set_max_delay -from [get_cells {*source_nanosec_sample_reg[*]}] -to [get_cells {*resync_nanosec_reg[*]}] 3.1 -datapath_only

