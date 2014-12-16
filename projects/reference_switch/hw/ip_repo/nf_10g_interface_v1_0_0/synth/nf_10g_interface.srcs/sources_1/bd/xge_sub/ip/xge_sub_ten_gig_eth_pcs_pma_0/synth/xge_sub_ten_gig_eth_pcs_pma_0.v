//-----------------------------------------------------------------------------
// Title      : Core level wrapper
// Project    : 10GBASE-R
//-----------------------------------------------------------------------------
// File       : xge_sub_ten_gig_eth_pcs_pma_0.v
//-----------------------------------------------------------------------------
// Description: This file is a wrapper for the 10GBASE-R core.
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

(* CORE_GENERATION_INFO = "xge_sub_ten_gig_eth_pcs_pma_0,ten_gig_eth_pcs_pma_v4_1,{x_ipProduct=Vivado 2014.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=ten_gig_eth_pcs_pma,x_ipVersion=4.1,x_ipCoreRevision=2,x_ipLanguage=VERILOG,x_ipLicense=ten_gig_eth_pcs_pma_basekr@2013.12(design_linking),c_family=virtex7,c_component_name=xge_sub_ten_gig_eth_pcs_pma_0,c_has_mdio=true,c_has_fec=false,c_has_an=false,c_is_kr=false,c_gttype=1,c_1588=1,c_data_width=32,c_sub_core_name=xge_sub_ten_gig_eth_pcs_pma_0_gt,c_gt0_dmonitorout_width=15}" *)
(* X_CORE_INFO = "ten_gig_eth_pcs_pma_v4_1,Vivado 2014.2" *)
(* DowngradeIPIdentifiedWarnings="yes" *)
module xge_sub_ten_gig_eth_pcs_pma_0
  (
  input           refclk_p,
  input           refclk_n,
  output          core_clk156_out,
  output          dclk_out,
  output          qplloutclk_out,
  output          qplloutrefclk_out,
  output          qplllock_out,
  output          areset_clk156_out,
  input [47:0]    systemtimer_s_field,
  input [31:0]    systemtimer_ns_field,
  output [47:0]   rxphy_s_field,
  output [35:0]   rxphy_ns_field,
  output          rxrecclk,
  output          reset_counter_done_out,
  input           reset,
  input  [63:0]   xgmii_txd,
  input  [7:0]    xgmii_txc,
  output [63:0]   xgmii_rxd,
  output [7:0]    xgmii_rxc,
  output          txp,
  output          txn,
  input           rxp,
  input           rxn,
  input           mdc,
  input           mdio_in,
  output          mdio_out,
  output          mdio_tri,
  input  [4 : 0]  prtad,
  output [7 : 0]  core_status,
  output          resetdone,
  input           signal_detect,
  input           tx_fault,
  output          drp_req,
  input           drp_gnt,
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
  output          tx_disable);

//
// Instantiate the 10Gig PCS/PMA core
//

  xge_sub_ten_gig_eth_pcs_pma_0_support inst
    (
    .refclk_p(refclk_p),
    .refclk_n(refclk_n),
    .core_clk156_out(core_clk156_out),
    .dclk_out(dclk_out),
    .qplloutclk_out(qplloutclk_out),
    .qplloutrefclk_out(qplloutrefclk_out),
    .qplllock_out(qplllock_out),
    .areset_clk156_out(areset_clk156_out),
    .systemtimer_s_field(systemtimer_s_field),
    .systemtimer_ns_field(systemtimer_ns_field),
    .rxphy_s_field(rxphy_s_field),
    .rxphy_ns_field(rxphy_ns_field),
    .rxrecclk(rxrecclk),
    .reset_counter_done_out(reset_counter_done_out),
    .reset(reset),
    .xgmii_txd(xgmii_txd),
    .xgmii_txc(xgmii_txc),
    .xgmii_rxd(xgmii_rxd),
    .xgmii_rxc(xgmii_rxc),
//-----------------------------------------------------------------------------
// Serial Interface
//-----------------------------------------------------------------------------
    .txp(txp),
    .txn(txn),
    .rxp(rxp),
    .rxn(rxn),
    .resetdone(resetdone),
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
    .tx_disable(tx_disable),
//-----------------------------------------------------------------------------
// MDIO Interface
//-----------------------------------------------------------------------------
    .mdc(mdc),
    .mdio_in(mdio_in),
    .mdio_out(mdio_out),
    .mdio_tri(mdio_tri),
    .prtad(prtad),
    .core_status(core_status)
    );

endmodule



