// (c) Copyright 1995-2014 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:ip:ten_gig_eth_pcs_pma:4.1
// IP Revision: 2

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
xge_sub_ten_gig_eth_pcs_pma_0 your_instance_name (
  .refclk_p(refclk_p),                              // input wire refclk_p
  .refclk_n(refclk_n),                              // input wire refclk_n
  .reset(reset),                                    // input wire reset
  .resetdone(resetdone),                            // output wire resetdone
  .core_clk156_out(core_clk156_out),                // output wire core_clk156_out
  .txp(txp),                                        // output wire txp
  .txn(txn),                                        // output wire txn
  .rxp(rxp),                                        // input wire rxp
  .rxn(rxn),                                        // input wire rxn
  .dclk_out(dclk_out),                              // output wire dclk_out
  .areset_clk156_out(areset_clk156_out),            // output wire areset_clk156_out
  .reset_counter_done_out(reset_counter_done_out),  // output wire reset_counter_done_out
  .qplllock_out(qplllock_out),                      // output wire qplllock_out
  .qplloutclk_out(qplloutclk_out),                  // output wire qplloutclk_out
  .qplloutrefclk_out(qplloutrefclk_out),            // output wire qplloutrefclk_out
  .xgmii_txd(xgmii_txd),                            // input wire [63 : 0] xgmii_txd
  .xgmii_txc(xgmii_txc),                            // input wire [7 : 0] xgmii_txc
  .xgmii_rxd(xgmii_rxd),                            // output wire [63 : 0] xgmii_rxd
  .xgmii_rxc(xgmii_rxc),                            // output wire [7 : 0] xgmii_rxc
  .mdc(mdc),                                        // input wire mdc
  .mdio_in(mdio_in),                                // input wire mdio_in
  .mdio_out(mdio_out),                              // output wire mdio_out
  .mdio_tri(mdio_tri),                              // output wire mdio_tri
  .prtad(prtad),                                    // input wire [4 : 0] prtad
  .core_status(core_status),                        // output wire [7 : 0] core_status
  .signal_detect(signal_detect),                    // input wire signal_detect
  .tx_fault(tx_fault),                              // input wire tx_fault
  .drp_req(drp_req),                                // output wire drp_req
  .drp_gnt(drp_gnt),                                // input wire drp_gnt
  .drp_den_o(drp_den_o),                            // output wire drp_den_o
  .drp_dwe_o(drp_dwe_o),                            // output wire drp_dwe_o
  .drp_daddr_o(drp_daddr_o),                        // output wire [15 : 0] drp_daddr_o
  .drp_di_o(drp_di_o),                              // output wire [15 : 0] drp_di_o
  .drp_drdy_o(drp_drdy_o),                          // output wire drp_drdy_o
  .drp_drpdo_o(drp_drpdo_o),                        // output wire [15 : 0] drp_drpdo_o
  .drp_den_i(drp_den_i),                            // input wire drp_den_i
  .drp_dwe_i(drp_dwe_i),                            // input wire drp_dwe_i
  .drp_daddr_i(drp_daddr_i),                        // input wire [15 : 0] drp_daddr_i
  .drp_di_i(drp_di_i),                              // input wire [15 : 0] drp_di_i
  .drp_drdy_i(drp_drdy_i),                          // input wire drp_drdy_i
  .drp_drpdo_i(drp_drpdo_i),                        // input wire [15 : 0] drp_drpdo_i
  .tx_disable(tx_disable),                          // output wire tx_disable
  .systemtimer_s_field(systemtimer_s_field),        // input wire [47 : 0] systemtimer_s_field
  .systemtimer_ns_field(systemtimer_ns_field),      // input wire [31 : 0] systemtimer_ns_field
  .rxphy_s_field(rxphy_s_field),                    // output wire [47 : 0] rxphy_s_field
  .rxphy_ns_field(rxphy_ns_field),                  // output wire [35 : 0] rxphy_ns_field
  .rxrecclk(rxrecclk)                              // output wire rxrecclk
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file xge_sub_ten_gig_eth_pcs_pma_0.v when simulating
// the core, xge_sub_ten_gig_eth_pcs_pma_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

