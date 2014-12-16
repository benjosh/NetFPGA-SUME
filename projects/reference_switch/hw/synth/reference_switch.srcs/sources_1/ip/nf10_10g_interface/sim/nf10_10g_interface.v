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


// IP VLNV: NetFPGA:NetFPGA:nf_10g_interface:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module nf10_10g_interface (
  axi_aclk,
  axi_resetn,
  refclk_p,
  refclk_n,
  m_axis_tdata,
  m_axis_tstrb,
  m_axis_tuser,
  m_axis_tvalid,
  m_axis_tready,
  m_axis_tlast,
  s_axis_tdata,
  s_axis_tstrb,
  s_axis_tuser,
  s_axis_tvalid,
  s_axis_tready,
  s_axis_tlast,
  S_AXI_ACLK,
  S_AXI_ARESETN,
  S_AXI_AWADDR,
  S_AXI_AWVALID,
  S_AXI_WDATA,
  S_AXI_WSTRB,
  S_AXI_WVALID,
  S_AXI_BREADY,
  S_AXI_ARADDR,
  S_AXI_ARVALID,
  S_AXI_RREADY,
  S_AXI_ARREADY,
  S_AXI_RDATA,
  S_AXI_RRESP,
  S_AXI_RVALID,
  S_AXI_WREADY,
  S_AXI_BRESP,
  S_AXI_BVALID,
  S_AXI_AWREADY,
  XGE_S_AXI_ACLK,
  XGE_S_AXI_ARESETN,
  XGE_S_AXI_AWADDR,
  XGE_S_AXI_AWVALID,
  XGE_S_AXI_WDATA,
  XGE_S_AXI_WSTRB,
  XGE_S_AXI_WVALID,
  XGE_S_AXI_BREADY,
  XGE_S_AXI_ARADDR,
  XGE_S_AXI_ARVALID,
  XGE_S_AXI_RREADY,
  XGE_S_AXI_ARREADY,
  XGE_S_AXI_RDATA,
  XGE_S_AXI_RRESP,
  XGE_S_AXI_RVALID,
  XGE_S_AXI_WREADY,
  XGE_S_AXI_BRESP,
  XGE_S_AXI_BVALID,
  XGE_S_AXI_AWREADY,
  txp,
  txn,
  rxp,
  rxn
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_signal_clock CLK" *)
input wire axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi_signal_reset RST" *)
input wire axi_resetn;
input wire refclk_p;
input wire refclk_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *)
output wire [255 : 0] m_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TSTRB" *)
output wire [31 : 0] m_axis_tstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TUSER" *)
output wire [127 : 0] m_axis_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *)
output wire m_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *)
input wire m_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *)
output wire m_axis_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *)
input wire [255 : 0] s_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TSTRB" *)
input wire [31 : 0] s_axis_tstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TUSER" *)
input wire [127 : 0] s_axis_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *)
input wire s_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *)
output wire s_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *)
input wire s_axis_tlast;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXI_signal_clock CLK" *)
input wire S_AXI_ACLK;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_AXI_signal_reset RST" *)
input wire S_AXI_ARESETN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *)
input wire [31 : 0] S_AXI_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *)
input wire S_AXI_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *)
input wire [31 : 0] S_AXI_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *)
input wire [3 : 0] S_AXI_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *)
input wire S_AXI_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *)
input wire S_AXI_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *)
input wire [31 : 0] S_AXI_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *)
input wire S_AXI_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *)
input wire S_AXI_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *)
output wire S_AXI_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *)
output wire [31 : 0] S_AXI_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *)
output wire [1 : 0] S_AXI_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *)
output wire S_AXI_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *)
output wire S_AXI_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *)
output wire [1 : 0] S_AXI_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *)
output wire S_AXI_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *)
output wire S_AXI_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 XGE_S_AXI_signal_clock CLK" *)
input wire XGE_S_AXI_ACLK;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 XGE_S_AXI_signal_reset RST" *)
input wire XGE_S_AXI_ARESETN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI AWADDR" *)
input wire [31 : 0] XGE_S_AXI_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI AWVALID" *)
input wire XGE_S_AXI_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI WDATA" *)
input wire [31 : 0] XGE_S_AXI_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI WSTRB" *)
input wire [3 : 0] XGE_S_AXI_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI WVALID" *)
input wire XGE_S_AXI_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI BREADY" *)
input wire XGE_S_AXI_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI ARADDR" *)
input wire [31 : 0] XGE_S_AXI_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI ARVALID" *)
input wire XGE_S_AXI_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI RREADY" *)
input wire XGE_S_AXI_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI ARREADY" *)
output wire XGE_S_AXI_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI RDATA" *)
output wire [31 : 0] XGE_S_AXI_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI RRESP" *)
output wire [1 : 0] XGE_S_AXI_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI RVALID" *)
output wire XGE_S_AXI_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI WREADY" *)
output wire XGE_S_AXI_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI BRESP" *)
output wire [1 : 0] XGE_S_AXI_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI BVALID" *)
output wire XGE_S_AXI_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 XGE_S_AXI AWREADY" *)
output wire XGE_S_AXI_AWREADY;
output wire txp;
output wire txn;
input wire rxp;
input wire rxn;

  nf_10g_interface #(
    .C_M_AXIS_DATA_WIDTH(256),
    .C_S_AXIS_DATA_WIDTH(256),
    .C_M_AXIS_TUSER_WIDTH(128),
    .C_S_AXIS_TUSER_WIDTH(128),
    .C_DEFAULT_VALUE_ENABLE(0),
    .C_DEFAULT_SRC_PORT(0),
    .C_DEFAULT_DST_PORT(0),
    .C_S_AXI_ACLK_FREQ_HZ(250),
    .C_S_AXI_DATA_WIDTH(32),
    .C_S_AXI_ADDR_WIDTH(32),
    .C_USE_WSTRB(0),
    .C_DPHASE_TIMEOUT(0),
    .C_NUM_ADDRESS_RANGES(1),
    .C_TOTAL_NUM_CE(1),
    .C_S_AXI_MIN_SIZE(32'H0000FFFF),
    .C_ARD_NUM_CE_ARRAY(8'B00000001),
    .C_FAMILY("virtex7"),
    .C_BASEADDR(32'H00000000),
    .C_HIGHADDR(32'H0000FFFF),
    .IF_NUMBER(16'H0000)
  ) inst (
    .axi_aclk(axi_aclk),
    .axi_resetn(axi_resetn),
    .refclk_p(refclk_p),
    .refclk_n(refclk_n),
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tstrb(m_axis_tstrb),
    .m_axis_tuser(m_axis_tuser),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tready(m_axis_tready),
    .m_axis_tlast(m_axis_tlast),
    .s_axis_tdata(s_axis_tdata),
    .s_axis_tstrb(s_axis_tstrb),
    .s_axis_tuser(s_axis_tuser),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tready(s_axis_tready),
    .s_axis_tlast(s_axis_tlast),
    .S_AXI_ACLK(S_AXI_ACLK),
    .S_AXI_ARESETN(S_AXI_ARESETN),
    .S_AXI_AWADDR(S_AXI_AWADDR),
    .S_AXI_AWVALID(S_AXI_AWVALID),
    .S_AXI_WDATA(S_AXI_WDATA),
    .S_AXI_WSTRB(S_AXI_WSTRB),
    .S_AXI_WVALID(S_AXI_WVALID),
    .S_AXI_BREADY(S_AXI_BREADY),
    .S_AXI_ARADDR(S_AXI_ARADDR),
    .S_AXI_ARVALID(S_AXI_ARVALID),
    .S_AXI_RREADY(S_AXI_RREADY),
    .S_AXI_ARREADY(S_AXI_ARREADY),
    .S_AXI_RDATA(S_AXI_RDATA),
    .S_AXI_RRESP(S_AXI_RRESP),
    .S_AXI_RVALID(S_AXI_RVALID),
    .S_AXI_WREADY(S_AXI_WREADY),
    .S_AXI_BRESP(S_AXI_BRESP),
    .S_AXI_BVALID(S_AXI_BVALID),
    .S_AXI_AWREADY(S_AXI_AWREADY),
    .XGE_S_AXI_ACLK(XGE_S_AXI_ACLK),
    .XGE_S_AXI_ARESETN(XGE_S_AXI_ARESETN),
    .XGE_S_AXI_AWADDR(XGE_S_AXI_AWADDR),
    .XGE_S_AXI_AWVALID(XGE_S_AXI_AWVALID),
    .XGE_S_AXI_WDATA(XGE_S_AXI_WDATA),
    .XGE_S_AXI_WSTRB(XGE_S_AXI_WSTRB),
    .XGE_S_AXI_WVALID(XGE_S_AXI_WVALID),
    .XGE_S_AXI_BREADY(XGE_S_AXI_BREADY),
    .XGE_S_AXI_ARADDR(XGE_S_AXI_ARADDR),
    .XGE_S_AXI_ARVALID(XGE_S_AXI_ARVALID),
    .XGE_S_AXI_RREADY(XGE_S_AXI_RREADY),
    .XGE_S_AXI_ARREADY(XGE_S_AXI_ARREADY),
    .XGE_S_AXI_RDATA(XGE_S_AXI_RDATA),
    .XGE_S_AXI_RRESP(XGE_S_AXI_RRESP),
    .XGE_S_AXI_RVALID(XGE_S_AXI_RVALID),
    .XGE_S_AXI_WREADY(XGE_S_AXI_WREADY),
    .XGE_S_AXI_BRESP(XGE_S_AXI_BRESP),
    .XGE_S_AXI_BVALID(XGE_S_AXI_BVALID),
    .XGE_S_AXI_AWREADY(XGE_S_AXI_AWREADY),
    .txp(txp),
    .txn(txn),
    .rxp(rxp),
    .rxn(rxn)
  );
endmodule
