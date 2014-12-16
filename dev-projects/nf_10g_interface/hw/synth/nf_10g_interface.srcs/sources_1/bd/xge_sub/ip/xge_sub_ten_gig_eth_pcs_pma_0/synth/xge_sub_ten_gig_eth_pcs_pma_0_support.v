//-----------------------------------------------------------------------------
// Title      : Core Support level wrapper
// Project    : 10GBASE-R
//-----------------------------------------------------------------------------
// File       : xge_sub_ten_gig_eth_pcs_pma_0_support.v
//-----------------------------------------------------------------------------
// Description: This file is a wrapper for the 10GBASE-R/KR Core Support level
// It contains the block level for the core which a user would instance in
// their own design, along with various modules which can be shared between
// several block levels.
//-----------------------------------------------------------------------------
// (c) Copyright 2009 - 2013 Xilinx, Inc. All rights reserved.
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

`timescale 1ns / 1ps

(* DowngradeIPIdentifiedWarnings="yes" *)
module xge_sub_ten_gig_eth_pcs_pma_0_support
  (
  input           refclk_p,
  input           refclk_n,
  output          core_clk156_out,
  output          dclk_out,
  input           reset,
  output          qplloutclk_out,
  output          qplloutrefclk_out,
  output          qplllock_out,
  output          areset_clk156_out,
  output          reset_counter_done_out,
  input           drp_gnt,
  output          drp_req,
  output          drp_den_o,
  output          drp_dwe_o,
  output [15 : 0] drp_daddr_o,
  output [15 : 0] drp_di_o,
  output          drp_drdy_o,
  output [15 : 0] drp_drpdo_o,
  input           drp_den_i,
  input           drp_dwe_i,
  input  [15 : 0] drp_daddr_i,
  input  [15 : 0] drp_di_i,
  input           drp_drdy_i,
  input  [15 : 0] drp_drpdo_i,
  input  [63 : 0] xgmii_txd,
  input  [7 : 0]  xgmii_txc,
  output [63 : 0] xgmii_rxd,
  output [7 : 0]  xgmii_rxc,
  output          txp,
  output          txn,
  input           rxp,
  input           rxn,
  input           mdc,
  input           mdio_in,
  output          mdio_out,
  output          mdio_tri,
  input [4 : 0]   prtad,
  input  [47:0]   systemtimer_s_field,
  input  [31:0]   systemtimer_ns_field,
  output [47:0]   rxphy_s_field,
  output [35:0]   rxphy_ns_field,
  output          rxrecclk,
  output [7:0]    core_status,
  output          resetdone,
  input           signal_detect,
  input           tx_fault,
  output          tx_disable);

  // Signal declarations
  wire clk156;

  assign core_clk156_out = clk156;

  wire txclk322;

  wire dclk;
  wire qplloutclk;
  wire qplloutrefclk;
  wire qplllock;

  wire tx_resetdone_int;
  wire rx_resetdone_int;

  wire gttxreset;
  wire gtrxreset;
  wire qpllreset;
  wire txuserrdy;
  wire reset_counter_done;

  wire txusrclk;
  wire txusrclk2;

  assign resetdone = tx_resetdone_int && rx_resetdone_int;

  assign qplloutclk_out = qplloutclk;
  assign qplloutrefclk_out = qplloutrefclk;
  assign qplllock_out = qplllock;
  assign reset_counter_done_out = reset_counter_done;

  // Instantiate the 10GBASER/KR GT Common block
  xge_sub_ten_gig_eth_pcs_pma_0_gt_common # (
      .WRAPPER_SIM_GTRESET_SPEEDUP("TRUE") ) //Does not affect hardware
  ten_gig_eth_pcs_pma_gt_common_block
    (
     .refclk(refclk),
     .qpllreset(qpllreset),
     .qplllock(qplllock),
     .qplloutclk(qplloutclk),
     .qplloutrefclk(qplloutrefclk)
    );

  // Instantiate the 10GBASER/KR shared clock/reset block

  xge_sub_ten_gig_eth_pcs_pma_0_shared_clock_and_reset ten_gig_eth_pcs_pma_shared_clock_reset_block
    (
     .areset(reset),
     .refclk_p(refclk_p),
     .refclk_n(refclk_n),
     .refclk(refclk),
     .clk156(clk156),
     .qpllreset(qpllreset),
     .reset_counter_done(reset_counter_done)
    );

  // Instantiate the 10GBASER/KR Block Level

  xge_sub_ten_gig_eth_pcs_pma_0_block ten_gig_eth_pcs_pma_block_i
    (
     .core_clk156_out(clk156),
     .dclk_out(dclk_out),
     .areset_clk156_out(areset_clk156_out),
     .areset(reset),
     .gttxreset(1'b0),
     .gtrxreset(1'b0),
     .qplllock(qplllock),
     .qplloutclk(qplloutclk),
     .qplloutrefclk(qplloutrefclk),
     .reset_counter_done(reset_counter_done),
     .xgmii_txd(xgmii_txd),
     .xgmii_txc(xgmii_txc),
     .xgmii_rxd(xgmii_rxd),
     .xgmii_rxc(xgmii_rxc),
     .txp(txp),
     .txn(txn),
     .rxp(rxp),
     .rxn(rxn),
      .mdc(mdc),
      .mdio_in(mdio_in),
      .mdio_out(mdio_out),
      .mdio_tri(mdio_tri),
      .prtad(prtad),
      .systemtimer_s_field(systemtimer_s_field),
      .systemtimer_ns_field(systemtimer_ns_field),
      .rxphy_s_field(rxphy_s_field),
      .rxphy_ns_field(rxphy_ns_field),
      .rxrecclk(rxrecclk),
      .core_status(core_status),
      .tx_resetdone(tx_resetdone_int),
      .rx_resetdone(rx_resetdone_int),
      .signal_detect(signal_detect),
      .tx_fault(tx_fault),
      .drp_req(drp_req),
      .drp_gnt(drp_gnt),
      .drp_den_o(drp_den_o),
      .drp_dwe_o(drp_dwe_o),
      .drp_daddr_o(drp_daddr_o),
      .drp_di_o(drp_di_o),
      .drp_drdy_o(drp_drdy_o),
      .drp_drpdo_o(drp_drpdo_o),
      .drp_den_i(drp_den_i),
      .drp_dwe_i(drp_dwe_i),
      .drp_daddr_i(drp_daddr_i),
      .drp_di_i(drp_di_i),
      .drp_drdy_i(drp_drdy_i),
      .drp_drpdo_i(drp_drpdo_i),
      .pma_pmd_type(3'b101),
      .tx_disable(tx_disable)
      );

endmodule
