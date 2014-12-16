#######################################################
# Ten Gigabit Ethernet MAC core constraints           #
#######################################################

# Asynchronous paths into resets
set_false_path -to [get_pins -filter {NAME =~ */PRE} -of_objects [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/G_SYNC_MGMT_RESET.sync_mgmt_reset_i/*]]
set_false_path -to [get_pins -filter {NAME =~ */PRE} -of_objects [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/sync_tx_reset_i/*]]
set_false_path -to [get_pins -filter {NAME =~ */PRE} -of_objects [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/sync_rx_reset_i/*]]

# Reconciliation sublayer clock-domain crossings.
set_false_path -from [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/rsgen/detect_link_fail/local_failure_reg] -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/rsgen/sync_lf_i/d_1_reg]
set_false_path -from [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/rsgen/detect_link_fail/remote_failure_reg] -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/rsgen/sync_rf_i/d_1_reg]

# Flow control clock domain crossings

set_false_path -from [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/rxgen/rx_pause_control_i/good_frame_to_tx_reg] -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/txgen/tx_pause_control_i/sync_i/d_1_reg] 
set_false_path -from [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/rxgen/rx_pause_control_i/pause_value_to_tx_reg[*]]

set_false_path -from [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/rxgen/rx_pause_control_i/pause_req_to_tx_reg]


#######################################################
#  MANAGEMENT CONSTRAINTS                             #
#  Please do not edit these constraints.              #
#######################################################

### Configuration and status registers ###
# Clock domain crossings into and out of the configuration/status registers
set_false_path -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/txgen/config_sync_i/*/d_1_reg]
set_false_path -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/rxgen/config_sync_i/*/d_1_reg]
set_false_path -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/txgen/config_sync_i/tx_mtu_size_reg[*]]
set_false_path -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/rxgen/config_sync_i/rx_mtu_size_reg[*]]
set_false_path -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/rxgen/config_sync_i/rx_pause_ad_reg[*]]
set_false_path -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/txgen/config_sync_i/tx_1588_adj_value_reg[*]]
set_false_path -from [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/G_MANAGEMENT.managen/conf/rx0_out_reg[*]] -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/txgen/txframer/pause_source_held_reg[*]]
set_false_path -from [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/G_MANAGEMENT.managen/conf/pause_addr_hi_out_reg[*]] -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/txgen/txframer/pause_source_held_reg[*]]
set_false_path -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/G_MANAGEMENT.managen/conf/*/d_1_reg]
set_false_path -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/G_MANAGEMENT.managen/conf/*/d_1_reg]
set_false_path -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/rsgen/rs_disable_sync/d_1_reg]

# False paths from Reconciliation sublayer to the management status regs
set_false_path -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/G_MANAGEMENT.managen/conf/*/d_1_reg]
set_false_path -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/G_MANAGEMENT.managen/conf/*/d_1_reg]

# The constraint on the clock period for the MDIO block is half the MDC
# minimum period of 400 ns; the turnaround phase of a read operation leads
# to a half-cycle operation in the middle of the transaction.
# Value below is correct for a 133 MHz bus2ip_clk - 200 ns / 7518 ps = 26.60
set mdioEnCells [get_cells -of [get_pins -leaf -filter {is_enable} -of [get_nets -of_objects [get_pins xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/G_MANAGEMENT.managen/mdio_master_i/mdc_ce_reg/Q]]]]
set_multicycle_path -from $mdioEnCells -to $mdioEnCells -setup 26
set_multicycle_path -from $mdioEnCells -to $mdioEnCells -hold 25
# ignore the timing on the MDIO_IN signal as it is only sampled in the middle of a very large
# window.
set_false_path -to [get_cells xge_sub_ten_gig_eth_mac_0_core/xgmac_inst/G_MANAGEMENT.managen/mdio_master_i/mdio_in_reg_reg]


