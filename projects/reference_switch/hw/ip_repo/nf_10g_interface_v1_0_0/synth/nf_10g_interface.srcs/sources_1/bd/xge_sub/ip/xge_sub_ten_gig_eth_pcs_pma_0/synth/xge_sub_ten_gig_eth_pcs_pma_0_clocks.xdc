## (c) Copyright 2009 - 2013 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and 
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.

set clk156name [get_clocks -of_objects [get_ports core_clk156_out]]
set RXOUTCLK_OUT [get_clocks -of  [get_pins -of_objects [get_cells * -hierarchical -filter {REF_NAME=~ GTHE2_CHANNEL}] -filter {NAME =~ *RXOUTCLK}]]
# 1588 - False path to the registers after the distributed RAM in the 1588 rx elastic buffer
set_false_path -from $RXOUTCLK_OUT -to [get_cells -hierarchical -filter {NAME =~ *ten_gig_eth_pcs_pma_inst/rx_elastic_buffer_i/G_1588_ToD.rd_rxphy_ns_reg*}]
set_false_path -from $RXOUTCLK_OUT -to [get_cells -hierarchical -filter {NAME =~ *ten_gig_eth_pcs_pma_inst/rx_elastic_buffer_i/G_1588_ToD.rd_rxphy_s_reg*}]

#The following path refers to registers in front of the DP RAM in the rx elastic buffer async fifo
set_false_path -from $RXOUTCLK_OUT -to [get_cells -hierarchical -filter {NAME =~ *dp_ram_i*fd_i* && (PRIMITIVE_SUBGROUP =~ flop || PRIMITIVE_SUBGROUP =~ SDR)}]

