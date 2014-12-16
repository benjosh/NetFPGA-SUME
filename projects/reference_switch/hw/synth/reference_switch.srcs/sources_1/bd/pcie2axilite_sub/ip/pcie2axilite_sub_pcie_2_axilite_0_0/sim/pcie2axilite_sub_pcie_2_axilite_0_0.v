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


// IP VLNV: xilinx.com:ip:pcie_2_axilite:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module pcie2axilite_sub_pcie_2_axilite_0_0 (
  axi_clk,
  axi_aresetn,
  s_axis_cq_tdata,
  s_axis_cq_tuser,
  s_axis_cq_tlast,
  s_axis_cq_tkeep,
  s_axis_cq_tvalid,
  s_axis_cq_tready,
  m_axis_cc_tdata,
  m_axis_cc_tuser,
  m_axis_cc_tlast,
  m_axis_cc_tkeep,
  m_axis_cc_tvalid,
  m_axis_cc_tready,
  m_axi_awaddr,
  m_axi_awprot,
  m_axi_awvalid,
  m_axi_awready,
  m_axi_wdata,
  m_axi_wstrb,
  m_axi_wvalid,
  m_axi_wready,
  m_axi_bresp,
  m_axi_bvalid,
  m_axi_bready,
  m_axi_araddr,
  m_axi_arprot,
  m_axi_arvalid,
  m_axi_arready,
  m_axi_rdata,
  m_axi_rresp,
  m_axi_rvalid,
  m_axi_rready
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_signal_clock CLK" *)
input wire axi_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi_signal_reset RST" *)
input wire axi_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cq TDATA" *)
input wire [255 : 0] s_axis_cq_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cq TUSER" *)
input wire [84 : 0] s_axis_cq_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cq TLAST" *)
input wire s_axis_cq_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cq TKEEP" *)
input wire [7 : 0] s_axis_cq_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cq TVALID" *)
input wire s_axis_cq_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cq TREADY" *)
output wire [21 : 0] s_axis_cq_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cc TDATA" *)
output wire [255 : 0] m_axis_cc_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cc TUSER" *)
output wire [32 : 0] m_axis_cc_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cc TLAST" *)
output wire m_axis_cc_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cc TKEEP" *)
output wire [7 : 0] m_axis_cc_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cc TVALID" *)
output wire m_axis_cc_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cc TREADY" *)
input wire [3 : 0] m_axis_cc_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWADDR" *)
output wire [31 : 0] m_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWPROT" *)
output wire [2 : 0] m_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWVALID" *)
output wire m_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWREADY" *)
input wire m_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WDATA" *)
output wire [31 : 0] m_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WSTRB" *)
output wire [3 : 0] m_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WVALID" *)
output wire m_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WREADY" *)
input wire m_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BRESP" *)
input wire [1 : 0] m_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BVALID" *)
input wire m_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BREADY" *)
output wire m_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARADDR" *)
output wire [31 : 0] m_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARPROT" *)
output wire [2 : 0] m_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARVALID" *)
output wire m_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARREADY" *)
input wire m_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RDATA" *)
input wire [31 : 0] m_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RRESP" *)
input wire [1 : 0] m_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RVALID" *)
input wire m_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RREADY" *)
output wire m_axi_rready;

  pcie_2_axilite #(
    .AXIS_TDATA_WIDTH(256),
    .S_AXI_TDATA_WIDTH(32),
    .S_AXI_ADDR_WIDTH(5),
    .M_AXI_TDATA_WIDTH(32),
    .M_AXI_ADDR_WIDTH(32),
    .RELAXED_ORDERING(1'B0),
    .ENABLE_CONFIG(1'B0),
    .BAR2AXI0_TRANSLATION('H0000000000000000),
    .BAR2AXI1_TRANSLATION('H0000000001000000),
    .BAR2AXI2_TRANSLATION('H0000000040000000),
    .BAR2AXI3_TRANSLATION('H0000000030000000),
    .BAR2AXI4_TRANSLATION('H0000000020000000),
    .BAR2AXI5_TRANSLATION('H0000000010000000),
    .BAR0SIZE('HFFFFFFFFFFC00000),
    .BAR1SIZE('HFFFFFFFFFFF00000),
    .BAR2SIZE('HFFFFFFFFFFFFFF80),
    .BAR3SIZE('HFFFFFFFFFFFFFF80),
    .BAR4SIZE('HFFFFFFFFFFFFFF80),
    .BAR5SIZE('HFFFFFFFFFFFFFF80),
    .OUTSTANDING_READS(5)
  ) inst (
    .axi_clk(axi_clk),
    .axi_aresetn(axi_aresetn),
    .s_axis_cq_tdata(s_axis_cq_tdata),
    .s_axis_cq_tuser(s_axis_cq_tuser),
    .s_axis_cq_tlast(s_axis_cq_tlast),
    .s_axis_cq_tkeep(s_axis_cq_tkeep),
    .s_axis_cq_tvalid(s_axis_cq_tvalid),
    .s_axis_cq_tready(s_axis_cq_tready),
    .m_axis_cc_tdata(m_axis_cc_tdata),
    .m_axis_cc_tuser(m_axis_cc_tuser),
    .m_axis_cc_tlast(m_axis_cc_tlast),
    .m_axis_cc_tkeep(m_axis_cc_tkeep),
    .m_axis_cc_tvalid(m_axis_cc_tvalid),
    .m_axis_cc_tready(m_axis_cc_tready),
    .m_axi_awaddr(m_axi_awaddr),
    .m_axi_awprot(m_axi_awprot),
    .m_axi_awvalid(m_axi_awvalid),
    .m_axi_awready(m_axi_awready),
    .m_axi_wdata(m_axi_wdata),
    .m_axi_wstrb(m_axi_wstrb),
    .m_axi_wvalid(m_axi_wvalid),
    .m_axi_wready(m_axi_wready),
    .m_axi_bresp(m_axi_bresp),
    .m_axi_bvalid(m_axi_bvalid),
    .m_axi_bready(m_axi_bready),
    .m_axi_araddr(m_axi_araddr),
    .m_axi_arprot(m_axi_arprot),
    .m_axi_arvalid(m_axi_arvalid),
    .m_axi_arready(m_axi_arready),
    .m_axi_rdata(m_axi_rdata),
    .m_axi_rresp(m_axi_rresp),
    .m_axi_rvalid(m_axi_rvalid),
    .m_axi_rready(m_axi_rready),
    .s_axi_awaddr(5'B0),
    .s_axi_awprot(3'B0),
    .s_axi_awvalid(1'B0),
    .s_axi_awready(),
    .s_axi_wdata(32'B0),
    .s_axi_wstrb(4'B0),
    .s_axi_wvalid(1'B0),
    .s_axi_wready(),
    .s_axi_bresp(),
    .s_axi_bvalid(),
    .s_axi_bready(1'B0),
    .s_axi_araddr(5'B0),
    .s_axi_arprot(3'B0),
    .s_axi_arvalid(1'B0),
    .s_axi_arready(),
    .s_axi_rdata(),
    .s_axi_rresp(),
    .s_axi_rvalid(),
    .s_axi_rready(1'B0)
  );
endmodule
