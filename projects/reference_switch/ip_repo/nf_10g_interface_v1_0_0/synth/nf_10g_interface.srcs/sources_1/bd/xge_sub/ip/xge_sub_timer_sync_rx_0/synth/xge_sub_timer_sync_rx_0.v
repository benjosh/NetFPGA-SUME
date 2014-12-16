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


// IP VLNV: xilinx.com:ip:timer_sync_1588:1.2
// IP Revision: 0

(* X_CORE_INFO = "timer_sync_1588_v1_2,Vivado 2014.2" *)
(* CHECK_LICENSE_TYPE = "xge_sub_timer_sync_rx_0,timer_sync_1588_v1_2,{}" *)
(* CORE_GENERATION_INFO = "xge_sub_timer_sync_rx_0,timer_sync_1588_v1_2,{x_ipProduct=Vivado 2014.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=timer_sync_1588,x_ipVersion=1.2,x_ipCoreRevision=0,x_ipLanguage=VERILOG,TIMER_CLK_PERIOD=4000,RESYNC_CLK_PERIOD=3100,TAPS=32,TIMER_FORMAT=0,USE_DPLL=0}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module xge_sub_timer_sync_rx_0 (
  timer_clk,
  timer_nanosec,
  timer_sec,
  resync_clk,
  resync_nanosec,
  resync_sec,
  resync_clk_locked
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 timer_clk CLK" *)
input wire timer_clk;
input wire [31 : 0] timer_nanosec;
input wire [47 : 0] timer_sec;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 resync_clk CLK" *)
input wire resync_clk;
output wire [31 : 0] resync_nanosec;
output wire [47 : 0] resync_sec;
input wire resync_clk_locked;

  timer_sync_1588_v1_2 #(
    .TIMER_CLK_PERIOD(4000),
    .RESYNC_CLK_PERIOD(3100),
    .TAPS(32),
    .TIMER_FORMAT(0),
    .USE_DPLL(0)
  ) inst (
    .timer_clk(timer_clk),
    .timer_nanosec(timer_nanosec),
    .timer_sec(timer_sec),
    .correction_timer(64'B0),
    .resync_clk(resync_clk),
    .resync_nanosec(resync_nanosec),
    .resync_sec(resync_sec),
    .resync_correction_timer(),
    .resync_clk_locked(resync_clk_locked),
    .disable_dpll(1'B0),
    .dpll_locked()
  );
endmodule
