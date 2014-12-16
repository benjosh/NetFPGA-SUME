//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.2 (lin64) Build 932637 Wed Jun 11 13:08:52 MDT 2014
//Date        : Wed Dec 10 13:43:44 2014
//Host        : yoyo.nf.cl.cam.ac.uk running 64-bit CentOS release 6.5 (Final)
//Command     : generate_target xge_sub.bd
//Design      : xge_sub
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "xge_sub,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=1,maxHierDepth=0}" *) 
module xge_sub
   (clk156_out,
    m_axis_rx_tdata,
    m_axis_rx_tkeep,
    m_axis_rx_tlast,
    m_axis_rx_ts_tdata,
    m_axis_rx_ts_tvalid,
    m_axis_rx_tuser,
    m_axis_rx_tvalid,
    m_axis_tx_ts_tdata,
    m_axis_tx_ts_tvalid,
    pcspma_status,
    qplllock_out,
    qplloutclk_out,
    qplloutrefclk_out,
    refclk_n,
    refclk_p,
    reset,
    reset_counter_done_out,
    resetdone,
    rx_axis_aresetn,
    rx_statistics_valid,
    rx_statistics_vector,
    rxn,
    rxp,
    s_axi_aclk,
    s_axi_araddr,
    s_axi_aresetn,
    s_axi_arready,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awready,
    s_axi_awvalid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rready,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wready,
    s_axi_wvalid,
    s_axis_pause_tdata,
    s_axis_pause_tvalid,
    s_axis_tx_tdata,
    s_axis_tx_tkeep,
    s_axis_tx_tlast,
    s_axis_tx_tready,
    s_axis_tx_tuser,
    s_axis_tx_tvalid,
    signal_detect,
    systemtimer_clk,
    systemtimer_ns_field,
    systemtimer_s_field,
    tx_axis_aresetn,
    tx_disable,
    tx_fault,
    tx_ifg_delay,
    tx_statistics_valid,
    tx_statistics_vector,
    txn,
    txp,
    xgmacint);
  output clk156_out;
  output [63:0]m_axis_rx_tdata;
  output [7:0]m_axis_rx_tkeep;
  output m_axis_rx_tlast;
  output [127:0]m_axis_rx_ts_tdata;
  output m_axis_rx_ts_tvalid;
  output m_axis_rx_tuser;
  output m_axis_rx_tvalid;
  output [127:0]m_axis_tx_ts_tdata;
  output m_axis_tx_ts_tvalid;
  output [7:0]pcspma_status;
  output qplllock_out;
  output qplloutclk_out;
  output qplloutrefclk_out;
  input refclk_n;
  input refclk_p;
  input reset;
  output reset_counter_done_out;
  output resetdone;
  input rx_axis_aresetn;
  output rx_statistics_valid;
  output [29:0]rx_statistics_vector;
  input rxn;
  input rxp;
  input s_axi_aclk;
  input [10:0]s_axi_araddr;
  input s_axi_aresetn;
  output s_axi_arready;
  input s_axi_arvalid;
  input [10:0]s_axi_awaddr;
  output s_axi_awready;
  input s_axi_awvalid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  output s_axi_wready;
  input s_axi_wvalid;
  input [15:0]s_axis_pause_tdata;
  input s_axis_pause_tvalid;
  input [63:0]s_axis_tx_tdata;
  input [7:0]s_axis_tx_tkeep;
  input s_axis_tx_tlast;
  output s_axis_tx_tready;
  input [127:0]s_axis_tx_tuser;
  input s_axis_tx_tvalid;
  input signal_detect;
  input systemtimer_clk;
  input [31:0]systemtimer_ns_field;
  input [47:0]systemtimer_s_field;
  input tx_axis_aresetn;
  output tx_disable;
  input tx_fault;
  input [7:0]tx_ifg_delay;
  output tx_statistics_valid;
  output [25:0]tx_statistics_vector;
  output txn;
  output txp;
  output xgmacint;

  wire axi_10g_ethernet_0_clk156_out;
  wire [63:0]axi_10g_ethernet_0_m_axis_rx_TDATA;
  wire [7:0]axi_10g_ethernet_0_m_axis_rx_TKEEP;
  wire axi_10g_ethernet_0_m_axis_rx_TLAST;
  wire axi_10g_ethernet_0_m_axis_rx_TUSER;
  wire axi_10g_ethernet_0_m_axis_rx_TVALID;
  wire [127:0]axi_10g_ethernet_0_m_axis_rx_ts_TDATA;
  wire axi_10g_ethernet_0_m_axis_rx_ts_TVALID;
  wire [127:0]axi_10g_ethernet_0_m_axis_tx_ts_TDATA;
  wire axi_10g_ethernet_0_m_axis_tx_ts_TVALID;
  wire [7:0]axi_10g_ethernet_0_pcspma_status;
  wire axi_10g_ethernet_0_qplllock_out;
  wire axi_10g_ethernet_0_qplloutclk_out;
  wire axi_10g_ethernet_0_qplloutrefclk_out;
  wire axi_10g_ethernet_0_reset_counter_done_out;
  wire axi_10g_ethernet_0_resetdone;
  wire axi_10g_ethernet_0_rx_statistics_valid;
  wire [29:0]axi_10g_ethernet_0_rx_statistics_vector;
  wire axi_10g_ethernet_0_tx_disable;
  wire axi_10g_ethernet_0_tx_statistics_valid;
  wire [25:0]axi_10g_ethernet_0_tx_statistics_vector;
  wire axi_10g_ethernet_0_txn;
  wire axi_10g_ethernet_0_txp;
  wire axi_10g_ethernet_0_xgmacint;
  wire refclk_n_1;
  wire refclk_p_1;
  wire reset_1;
  wire rx_axis_aresetn_1;
  wire rxn_1;
  wire rxp_1;
  wire [10:0]s_axi_1_ARADDR;
  wire s_axi_1_ARREADY;
  wire s_axi_1_ARVALID;
  wire [10:0]s_axi_1_AWADDR;
  wire s_axi_1_AWREADY;
  wire s_axi_1_AWVALID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_RDATA;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire s_axi_1_RVALID;
  wire [31:0]s_axi_1_WDATA;
  wire s_axi_1_WREADY;
  wire s_axi_1_WVALID;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;
  wire [15:0]s_axis_pause_1_TDATA;
  wire s_axis_pause_1_TVALID;
  wire [63:0]s_axis_tx_1_TDATA;
  wire [7:0]s_axis_tx_1_TKEEP;
  wire s_axis_tx_1_TLAST;
  wire s_axis_tx_1_TREADY;
  wire [127:0]s_axis_tx_1_TUSER;
  wire s_axis_tx_1_TVALID;
  wire signal_detect_1;
  wire systemtimer_clk_1;
  wire [31:0]systemtimer_ns_field_1;
  wire [47:0]systemtimer_s_field_1;
  wire tx_axis_aresetn_1;
  wire tx_fault_1;
  wire [7:0]tx_ifg_delay_1;

  assign clk156_out = axi_10g_ethernet_0_clk156_out;
  assign m_axis_rx_tdata[63:0] = axi_10g_ethernet_0_m_axis_rx_TDATA;
  assign m_axis_rx_tkeep[7:0] = axi_10g_ethernet_0_m_axis_rx_TKEEP;
  assign m_axis_rx_tlast = axi_10g_ethernet_0_m_axis_rx_TLAST;
  assign m_axis_rx_ts_tdata[127:0] = axi_10g_ethernet_0_m_axis_rx_ts_TDATA;
  assign m_axis_rx_ts_tvalid = axi_10g_ethernet_0_m_axis_rx_ts_TVALID;
  assign m_axis_rx_tuser = axi_10g_ethernet_0_m_axis_rx_TUSER;
  assign m_axis_rx_tvalid = axi_10g_ethernet_0_m_axis_rx_TVALID;
  assign m_axis_tx_ts_tdata[127:0] = axi_10g_ethernet_0_m_axis_tx_ts_TDATA;
  assign m_axis_tx_ts_tvalid = axi_10g_ethernet_0_m_axis_tx_ts_TVALID;
  assign pcspma_status[7:0] = axi_10g_ethernet_0_pcspma_status;
  assign qplllock_out = axi_10g_ethernet_0_qplllock_out;
  assign qplloutclk_out = axi_10g_ethernet_0_qplloutclk_out;
  assign qplloutrefclk_out = axi_10g_ethernet_0_qplloutrefclk_out;
  assign refclk_n_1 = refclk_n;
  assign refclk_p_1 = refclk_p;
  assign reset_1 = reset;
  assign reset_counter_done_out = axi_10g_ethernet_0_reset_counter_done_out;
  assign resetdone = axi_10g_ethernet_0_resetdone;
  assign rx_axis_aresetn_1 = rx_axis_aresetn;
  assign rx_statistics_valid = axi_10g_ethernet_0_rx_statistics_valid;
  assign rx_statistics_vector[29:0] = axi_10g_ethernet_0_rx_statistics_vector;
  assign rxn_1 = rxn;
  assign rxp_1 = rxp;
  assign s_axi_1_ARADDR = s_axi_araddr[10:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[10:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[31:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[31:0] = s_axi_1_RDATA;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  assign s_axis_pause_1_TDATA = s_axis_pause_tdata[15:0];
  assign s_axis_pause_1_TVALID = s_axis_pause_tvalid;
  assign s_axis_tx_1_TDATA = s_axis_tx_tdata[63:0];
  assign s_axis_tx_1_TKEEP = s_axis_tx_tkeep[7:0];
  assign s_axis_tx_1_TLAST = s_axis_tx_tlast;
  assign s_axis_tx_1_TUSER = s_axis_tx_tuser[127:0];
  assign s_axis_tx_1_TVALID = s_axis_tx_tvalid;
  assign s_axis_tx_tready = s_axis_tx_1_TREADY;
  assign signal_detect_1 = signal_detect;
  assign systemtimer_clk_1 = systemtimer_clk;
  assign systemtimer_ns_field_1 = systemtimer_ns_field[31:0];
  assign systemtimer_s_field_1 = systemtimer_s_field[47:0];
  assign tx_axis_aresetn_1 = tx_axis_aresetn;
  assign tx_disable = axi_10g_ethernet_0_tx_disable;
  assign tx_fault_1 = tx_fault;
  assign tx_ifg_delay_1 = tx_ifg_delay[7:0];
  assign tx_statistics_valid = axi_10g_ethernet_0_tx_statistics_valid;
  assign tx_statistics_vector[25:0] = axi_10g_ethernet_0_tx_statistics_vector;
  assign txn = axi_10g_ethernet_0_txn;
  assign txp = axi_10g_ethernet_0_txp;
  assign xgmacint = axi_10g_ethernet_0_xgmacint;
xge_sub_axi_10g_ethernet_0_0 axi_10g_ethernet_0
       (.clk156_out(axi_10g_ethernet_0_clk156_out),
        .m_axis_rx_tdata(axi_10g_ethernet_0_m_axis_rx_TDATA),
        .m_axis_rx_tkeep(axi_10g_ethernet_0_m_axis_rx_TKEEP),
        .m_axis_rx_tlast(axi_10g_ethernet_0_m_axis_rx_TLAST),
        .m_axis_rx_ts_tdata(axi_10g_ethernet_0_m_axis_rx_ts_TDATA),
        .m_axis_rx_ts_tvalid(axi_10g_ethernet_0_m_axis_rx_ts_TVALID),
        .m_axis_rx_tuser(axi_10g_ethernet_0_m_axis_rx_TUSER),
        .m_axis_rx_tvalid(axi_10g_ethernet_0_m_axis_rx_TVALID),
        .m_axis_tx_ts_tdata(axi_10g_ethernet_0_m_axis_tx_ts_TDATA),
        .m_axis_tx_ts_tvalid(axi_10g_ethernet_0_m_axis_tx_ts_TVALID),
        .pcspma_status(axi_10g_ethernet_0_pcspma_status),
        .qplllock_out(axi_10g_ethernet_0_qplllock_out),
        .qplloutclk_out(axi_10g_ethernet_0_qplloutclk_out),
        .qplloutrefclk_out(axi_10g_ethernet_0_qplloutrefclk_out),
        .refclk_n(refclk_n_1),
        .refclk_p(refclk_p_1),
        .reset(reset_1),
        .reset_counter_done_out(axi_10g_ethernet_0_reset_counter_done_out),
        .resetdone(axi_10g_ethernet_0_resetdone),
        .rx_axis_aresetn(rx_axis_aresetn_1),
        .rx_statistics_valid(axi_10g_ethernet_0_rx_statistics_valid),
        .rx_statistics_vector(axi_10g_ethernet_0_rx_statistics_vector),
        .rxn(rxn_1),
        .rxp(rxp_1),
        .s_axi_aclk(s_axi_aclk_1),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_aresetn(s_axi_aresetn_1),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wvalid(s_axi_1_WVALID),
        .s_axis_pause_tdata(s_axis_pause_1_TDATA),
        .s_axis_pause_tvalid(s_axis_pause_1_TVALID),
        .s_axis_tx_tdata(s_axis_tx_1_TDATA),
        .s_axis_tx_tkeep(s_axis_tx_1_TKEEP),
        .s_axis_tx_tlast(s_axis_tx_1_TLAST),
        .s_axis_tx_tready(s_axis_tx_1_TREADY),
        .s_axis_tx_tuser(s_axis_tx_1_TUSER),
        .s_axis_tx_tvalid(s_axis_tx_1_TVALID),
        .signal_detect(signal_detect_1),
        .systemtimer_clk(systemtimer_clk_1),
        .systemtimer_ns_field(systemtimer_ns_field_1),
        .systemtimer_s_field(systemtimer_s_field_1),
        .tx_axis_aresetn(tx_axis_aresetn_1),
        .tx_disable(axi_10g_ethernet_0_tx_disable),
        .tx_fault(tx_fault_1),
        .tx_ifg_delay(tx_ifg_delay_1),
        .tx_statistics_valid(axi_10g_ethernet_0_tx_statistics_valid),
        .tx_statistics_vector(axi_10g_ethernet_0_tx_statistics_vector),
        .txn(axi_10g_ethernet_0_txn),
        .txp(axi_10g_ethernet_0_txp),
        .xgmacint(axi_10g_ethernet_0_xgmacint));
endmodule

module xge_sub_axi_10g_ethernet_0_0
   (clk156_out,
    m_axis_rx_tdata,
    m_axis_rx_tkeep,
    m_axis_rx_tlast,
    m_axis_rx_ts_tdata,
    m_axis_rx_ts_tvalid,
    m_axis_rx_tuser,
    m_axis_rx_tvalid,
    m_axis_tx_ts_tdata,
    m_axis_tx_ts_tvalid,
    pcspma_status,
    qplllock_out,
    qplloutclk_out,
    qplloutrefclk_out,
    refclk_n,
    refclk_p,
    reset,
    reset_counter_done_out,
    resetdone,
    rx_axis_aresetn,
    rx_statistics_valid,
    rx_statistics_vector,
    rxn,
    rxp,
    s_axi_aclk,
    s_axi_araddr,
    s_axi_aresetn,
    s_axi_arready,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awready,
    s_axi_awvalid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rready,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wready,
    s_axi_wvalid,
    s_axis_pause_tdata,
    s_axis_pause_tvalid,
    s_axis_tx_tdata,
    s_axis_tx_tkeep,
    s_axis_tx_tlast,
    s_axis_tx_tready,
    s_axis_tx_tuser,
    s_axis_tx_tvalid,
    signal_detect,
    systemtimer_clk,
    systemtimer_ns_field,
    systemtimer_s_field,
    tx_axis_aresetn,
    tx_disable,
    tx_fault,
    tx_ifg_delay,
    tx_statistics_valid,
    tx_statistics_vector,
    txn,
    txp,
    xgmacint);
  output clk156_out;
  output [63:0]m_axis_rx_tdata;
  output [7:0]m_axis_rx_tkeep;
  output m_axis_rx_tlast;
  output [127:0]m_axis_rx_ts_tdata;
  output m_axis_rx_ts_tvalid;
  output m_axis_rx_tuser;
  output m_axis_rx_tvalid;
  output [127:0]m_axis_tx_ts_tdata;
  output m_axis_tx_ts_tvalid;
  output [7:0]pcspma_status;
  output qplllock_out;
  output qplloutclk_out;
  output qplloutrefclk_out;
  input refclk_n;
  input refclk_p;
  input reset;
  output reset_counter_done_out;
  output resetdone;
  input rx_axis_aresetn;
  output rx_statistics_valid;
  output [29:0]rx_statistics_vector;
  input rxn;
  input rxp;
  input s_axi_aclk;
  input [10:0]s_axi_araddr;
  input s_axi_aresetn;
  output s_axi_arready;
  input s_axi_arvalid;
  input [10:0]s_axi_awaddr;
  output s_axi_awready;
  input s_axi_awvalid;
  input s_axi_bready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  input s_axi_rready;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  output s_axi_wready;
  input s_axi_wvalid;
  input [15:0]s_axis_pause_tdata;
  input s_axis_pause_tvalid;
  input [63:0]s_axis_tx_tdata;
  input [7:0]s_axis_tx_tkeep;
  input s_axis_tx_tlast;
  output s_axis_tx_tready;
  input [127:0]s_axis_tx_tuser;
  input s_axis_tx_tvalid;
  input signal_detect;
  input systemtimer_clk;
  input [31:0]systemtimer_ns_field;
  input [47:0]systemtimer_s_field;
  input tx_axis_aresetn;
  output tx_disable;
  input tx_fault;
  input [7:0]tx_ifg_delay;
  output tx_statistics_valid;
  output [25:0]tx_statistics_vector;
  output txn;
  output txp;
  output xgmacint;

  wire [0:0]dcm_locked_driver_dout;
  wire [4:0]prtad_driver_dout;
  wire refclk_n_1;
  wire refclk_p_1;
  wire reset_1;
  wire rx_axis_aresetn_1;
  wire rxn_1;
  wire rxp_1;
  wire [10:0]s_axi_1_ARADDR;
  wire s_axi_1_ARREADY;
  wire s_axi_1_ARVALID;
  wire [10:0]s_axi_1_AWADDR;
  wire s_axi_1_AWREADY;
  wire s_axi_1_AWVALID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_RDATA;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire s_axi_1_RVALID;
  wire [31:0]s_axi_1_WDATA;
  wire s_axi_1_WREADY;
  wire s_axi_1_WVALID;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;
  wire [15:0]s_axis_pause_1_TDATA;
  wire s_axis_pause_1_TVALID;
  wire [63:0]s_axis_tx_1_TDATA;
  wire [7:0]s_axis_tx_1_TKEEP;
  wire s_axis_tx_1_TLAST;
  wire s_axis_tx_1_TREADY;
  wire [127:0]s_axis_tx_1_TUSER;
  wire s_axis_tx_1_TVALID;
  wire signal_detect_1;
  wire systemtimer_clk_1;
  wire [31:0]systemtimer_ns_field_1;
  wire [47:0]systemtimer_s_field_1;
  wire [63:0]ten_gig_eth_mac_m_axis_rx_TDATA;
  wire [7:0]ten_gig_eth_mac_m_axis_rx_TKEEP;
  wire ten_gig_eth_mac_m_axis_rx_TLAST;
  wire ten_gig_eth_mac_m_axis_rx_TUSER;
  wire ten_gig_eth_mac_m_axis_rx_TVALID;
  wire [127:0]ten_gig_eth_mac_m_axis_rx_ts_TDATA;
  wire ten_gig_eth_mac_m_axis_rx_ts_TVALID;
  wire [127:0]ten_gig_eth_mac_m_axis_tx_ts_TDATA;
  wire ten_gig_eth_mac_m_axis_tx_ts_TVALID;
  wire ten_gig_eth_mac_mdc;
  wire ten_gig_eth_mac_mdio_out;
  wire ten_gig_eth_mac_rx_statistics_valid;
  wire [29:0]ten_gig_eth_mac_rx_statistics_vector;
  wire ten_gig_eth_mac_tx_statistics_valid;
  wire [25:0]ten_gig_eth_mac_tx_statistics_vector;
  wire ten_gig_eth_mac_xgmacint;
  wire [7:0]ten_gig_eth_mac_xgmii_xgmac_RXC;
  wire [63:0]ten_gig_eth_mac_xgmii_xgmac_RXD;
  wire [7:0]ten_gig_eth_mac_xgmii_xgmac_TXC;
  wire [63:0]ten_gig_eth_mac_xgmii_xgmac_TXD;
  wire ten_gig_eth_pcs_pma_areset_clk156_out;
  wire ten_gig_eth_pcs_pma_core_clk156_out;
  wire [15:0]ten_gig_eth_pcs_pma_core_gt_drp_interface_DADDR;
  wire ten_gig_eth_pcs_pma_core_gt_drp_interface_DEN;
  wire [15:0]ten_gig_eth_pcs_pma_core_gt_drp_interface_DI;
  wire [15:0]ten_gig_eth_pcs_pma_core_gt_drp_interface_DO;
  wire ten_gig_eth_pcs_pma_core_gt_drp_interface_DRDY;
  wire ten_gig_eth_pcs_pma_core_gt_drp_interface_DWE;
  wire [7:0]ten_gig_eth_pcs_pma_core_status;
  wire ten_gig_eth_pcs_pma_drp_req;
  wire ten_gig_eth_pcs_pma_mdio_out;
  wire ten_gig_eth_pcs_pma_qplllock_out;
  wire ten_gig_eth_pcs_pma_qplloutclk_out;
  wire ten_gig_eth_pcs_pma_qplloutrefclk_out;
  wire ten_gig_eth_pcs_pma_reset_counter_done_out;
  wire ten_gig_eth_pcs_pma_resetdone;
  wire [35:0]ten_gig_eth_pcs_pma_rxphy_ns_field;
  wire [47:0]ten_gig_eth_pcs_pma_rxphy_s_field;
  wire ten_gig_eth_pcs_pma_rxrecclk;
  wire ten_gig_eth_pcs_pma_tx_disable;
  wire ten_gig_eth_pcs_pma_txn;
  wire ten_gig_eth_pcs_pma_txp;
  wire [31:0]timer_sync_rx_resync_nanosec;
  wire [47:0]timer_sync_rx_resync_sec;
  wire [31:0]timer_sync_tx_resync_nanosec;
  wire [47:0]timer_sync_tx_resync_sec;
  wire tx_axis_aresetn_1;
  wire tx_fault_1;
  wire [7:0]tx_ifg_delay_1;

  assign clk156_out = ten_gig_eth_pcs_pma_core_clk156_out;
  assign m_axis_rx_tdata[63:0] = ten_gig_eth_mac_m_axis_rx_TDATA;
  assign m_axis_rx_tkeep[7:0] = ten_gig_eth_mac_m_axis_rx_TKEEP;
  assign m_axis_rx_tlast = ten_gig_eth_mac_m_axis_rx_TLAST;
  assign m_axis_rx_ts_tdata[127:0] = ten_gig_eth_mac_m_axis_rx_ts_TDATA;
  assign m_axis_rx_ts_tvalid = ten_gig_eth_mac_m_axis_rx_ts_TVALID;
  assign m_axis_rx_tuser = ten_gig_eth_mac_m_axis_rx_TUSER;
  assign m_axis_rx_tvalid = ten_gig_eth_mac_m_axis_rx_TVALID;
  assign m_axis_tx_ts_tdata[127:0] = ten_gig_eth_mac_m_axis_tx_ts_TDATA;
  assign m_axis_tx_ts_tvalid = ten_gig_eth_mac_m_axis_tx_ts_TVALID;
  assign pcspma_status[7:0] = ten_gig_eth_pcs_pma_core_status;
  assign qplllock_out = ten_gig_eth_pcs_pma_qplllock_out;
  assign qplloutclk_out = ten_gig_eth_pcs_pma_qplloutclk_out;
  assign qplloutrefclk_out = ten_gig_eth_pcs_pma_qplloutrefclk_out;
  assign refclk_n_1 = refclk_n;
  assign refclk_p_1 = refclk_p;
  assign reset_1 = reset;
  assign reset_counter_done_out = ten_gig_eth_pcs_pma_reset_counter_done_out;
  assign resetdone = ten_gig_eth_pcs_pma_resetdone;
  assign rx_axis_aresetn_1 = rx_axis_aresetn;
  assign rx_statistics_valid = ten_gig_eth_mac_rx_statistics_valid;
  assign rx_statistics_vector[29:0] = ten_gig_eth_mac_rx_statistics_vector;
  assign rxn_1 = rxn;
  assign rxp_1 = rxp;
  assign s_axi_1_ARADDR = s_axi_araddr[10:0];
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr[10:0];
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata[31:0];
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bresp[1:0] = s_axi_1_BRESP;
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata[31:0] = s_axi_1_RDATA;
  assign s_axi_rresp[1:0] = s_axi_1_RRESP;
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  assign s_axis_pause_1_TDATA = s_axis_pause_tdata[15:0];
  assign s_axis_pause_1_TVALID = s_axis_pause_tvalid;
  assign s_axis_tx_1_TDATA = s_axis_tx_tdata[63:0];
  assign s_axis_tx_1_TKEEP = s_axis_tx_tkeep[7:0];
  assign s_axis_tx_1_TLAST = s_axis_tx_tlast;
  assign s_axis_tx_1_TUSER = s_axis_tx_tuser[127:0];
  assign s_axis_tx_1_TVALID = s_axis_tx_tvalid;
  assign s_axis_tx_tready = s_axis_tx_1_TREADY;
  assign signal_detect_1 = signal_detect;
  assign systemtimer_clk_1 = systemtimer_clk;
  assign systemtimer_ns_field_1 = systemtimer_ns_field[31:0];
  assign systemtimer_s_field_1 = systemtimer_s_field[47:0];
  assign tx_axis_aresetn_1 = tx_axis_aresetn;
  assign tx_disable = ten_gig_eth_pcs_pma_tx_disable;
  assign tx_fault_1 = tx_fault;
  assign tx_ifg_delay_1 = tx_ifg_delay[7:0];
  assign tx_statistics_valid = ten_gig_eth_mac_tx_statistics_valid;
  assign tx_statistics_vector[25:0] = ten_gig_eth_mac_tx_statistics_vector;
  assign txn = ten_gig_eth_pcs_pma_txn;
  assign txp = ten_gig_eth_pcs_pma_txp;
  assign xgmacint = ten_gig_eth_mac_xgmacint;
xge_sub_dcm_locked_driver_0 dcm_locked_driver
       (.dout(dcm_locked_driver_dout));
xge_sub_prtad_driver_0 prtad_driver
       (.dout(prtad_driver_dout));
xge_sub_ten_gig_eth_mac_0 ten_gig_eth_mac
       (.mdc(ten_gig_eth_mac_mdc),
        .mdio_in(ten_gig_eth_pcs_pma_mdio_out),
        .mdio_out(ten_gig_eth_mac_mdio_out),
        .pause_req(s_axis_pause_1_TVALID),
        .pause_val(s_axis_pause_1_TDATA),
        .reset(ten_gig_eth_pcs_pma_areset_clk156_out),
        .rx_axis_aresetn(rx_axis_aresetn_1),
        .rx_axis_tdata(ten_gig_eth_mac_m_axis_rx_TDATA),
        .rx_axis_tkeep(ten_gig_eth_mac_m_axis_rx_TKEEP),
        .rx_axis_tlast(ten_gig_eth_mac_m_axis_rx_TLAST),
        .rx_axis_tuser(ten_gig_eth_mac_m_axis_rx_TUSER),
        .rx_axis_tvalid(ten_gig_eth_mac_m_axis_rx_TVALID),
        .rx_clk0(ten_gig_eth_pcs_pma_core_clk156_out),
        .rx_dcm_locked(dcm_locked_driver_dout),
        .rx_statistics_valid(ten_gig_eth_mac_rx_statistics_valid),
        .rx_statistics_vector(ten_gig_eth_mac_rx_statistics_vector),
        .rx_ts_axis_tdata(ten_gig_eth_mac_m_axis_rx_ts_TDATA),
        .rx_ts_axis_tvalid(ten_gig_eth_mac_m_axis_rx_ts_TVALID),
        .rxphy_ns_field(ten_gig_eth_pcs_pma_rxphy_ns_field),
        .rxphy_s_field(ten_gig_eth_pcs_pma_rxphy_s_field),
        .s_axi_aclk(s_axi_aclk_1),
        .s_axi_araddr(s_axi_1_ARADDR),
        .s_axi_aresetn(s_axi_aresetn_1),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr(s_axi_1_AWADDR),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata(s_axi_1_WDATA),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wvalid(s_axi_1_WVALID),
        .systemtimer_ns_field(timer_sync_tx_resync_nanosec),
        .systemtimer_s_field(timer_sync_tx_resync_sec),
        .tx_axis_aresetn(tx_axis_aresetn_1),
        .tx_axis_tdata(s_axis_tx_1_TDATA),
        .tx_axis_tkeep(s_axis_tx_1_TKEEP),
        .tx_axis_tlast(s_axis_tx_1_TLAST),
        .tx_axis_tready(s_axis_tx_1_TREADY),
        .tx_axis_tuser(s_axis_tx_1_TUSER),
        .tx_axis_tvalid(s_axis_tx_1_TVALID),
        .tx_clk0(ten_gig_eth_pcs_pma_core_clk156_out),
        .tx_dcm_locked(dcm_locked_driver_dout),
        .tx_ifg_delay(tx_ifg_delay_1),
        .tx_statistics_valid(ten_gig_eth_mac_tx_statistics_valid),
        .tx_statistics_vector(ten_gig_eth_mac_tx_statistics_vector),
        .tx_ts_axis_tdata(ten_gig_eth_mac_m_axis_tx_ts_TDATA),
        .tx_ts_axis_tvalid(ten_gig_eth_mac_m_axis_tx_ts_TVALID),
        .xgmacint(ten_gig_eth_mac_xgmacint),
        .xgmii_rxc(ten_gig_eth_mac_xgmii_xgmac_RXC),
        .xgmii_rxd(ten_gig_eth_mac_xgmii_xgmac_RXD),
        .xgmii_txc(ten_gig_eth_mac_xgmii_xgmac_TXC),
        .xgmii_txd(ten_gig_eth_mac_xgmii_xgmac_TXD));
xge_sub_ten_gig_eth_pcs_pma_0 ten_gig_eth_pcs_pma
       (.areset_clk156_out(ten_gig_eth_pcs_pma_areset_clk156_out),
        .core_clk156_out(ten_gig_eth_pcs_pma_core_clk156_out),
        .core_status(ten_gig_eth_pcs_pma_core_status),
        .drp_daddr_i(ten_gig_eth_pcs_pma_core_gt_drp_interface_DADDR),
        .drp_daddr_o(ten_gig_eth_pcs_pma_core_gt_drp_interface_DADDR),
        .drp_den_i(ten_gig_eth_pcs_pma_core_gt_drp_interface_DEN),
        .drp_den_o(ten_gig_eth_pcs_pma_core_gt_drp_interface_DEN),
        .drp_di_i(ten_gig_eth_pcs_pma_core_gt_drp_interface_DI),
        .drp_di_o(ten_gig_eth_pcs_pma_core_gt_drp_interface_DI),
        .drp_drdy_i(ten_gig_eth_pcs_pma_core_gt_drp_interface_DRDY),
        .drp_drdy_o(ten_gig_eth_pcs_pma_core_gt_drp_interface_DRDY),
        .drp_drpdo_i(ten_gig_eth_pcs_pma_core_gt_drp_interface_DO),
        .drp_drpdo_o(ten_gig_eth_pcs_pma_core_gt_drp_interface_DO),
        .drp_dwe_i(ten_gig_eth_pcs_pma_core_gt_drp_interface_DWE),
        .drp_dwe_o(ten_gig_eth_pcs_pma_core_gt_drp_interface_DWE),
        .drp_gnt(ten_gig_eth_pcs_pma_drp_req),
        .drp_req(ten_gig_eth_pcs_pma_drp_req),
        .mdc(ten_gig_eth_mac_mdc),
        .mdio_in(ten_gig_eth_mac_mdio_out),
        .mdio_out(ten_gig_eth_pcs_pma_mdio_out),
        .prtad(prtad_driver_dout),
        .qplllock_out(ten_gig_eth_pcs_pma_qplllock_out),
        .qplloutclk_out(ten_gig_eth_pcs_pma_qplloutclk_out),
        .qplloutrefclk_out(ten_gig_eth_pcs_pma_qplloutrefclk_out),
        .refclk_n(refclk_n_1),
        .refclk_p(refclk_p_1),
        .reset(reset_1),
        .reset_counter_done_out(ten_gig_eth_pcs_pma_reset_counter_done_out),
        .resetdone(ten_gig_eth_pcs_pma_resetdone),
        .rxn(rxn_1),
        .rxp(rxp_1),
        .rxphy_ns_field(ten_gig_eth_pcs_pma_rxphy_ns_field),
        .rxphy_s_field(ten_gig_eth_pcs_pma_rxphy_s_field),
        .rxrecclk(ten_gig_eth_pcs_pma_rxrecclk),
        .signal_detect(signal_detect_1),
        .systemtimer_ns_field(timer_sync_rx_resync_nanosec),
        .systemtimer_s_field(timer_sync_rx_resync_sec),
        .tx_disable(ten_gig_eth_pcs_pma_tx_disable),
        .tx_fault(tx_fault_1),
        .txn(ten_gig_eth_pcs_pma_txn),
        .txp(ten_gig_eth_pcs_pma_txp),
        .xgmii_rxc(ten_gig_eth_mac_xgmii_xgmac_RXC),
        .xgmii_rxd(ten_gig_eth_mac_xgmii_xgmac_RXD),
        .xgmii_txc(ten_gig_eth_mac_xgmii_xgmac_TXC),
        .xgmii_txd(ten_gig_eth_mac_xgmii_xgmac_TXD));
xge_sub_timer_sync_rx_0 timer_sync_rx
       (.resync_clk(ten_gig_eth_pcs_pma_rxrecclk),
        .resync_clk_locked(dcm_locked_driver_dout),
        .resync_nanosec(timer_sync_rx_resync_nanosec),
        .resync_sec(timer_sync_rx_resync_sec),
        .timer_clk(systemtimer_clk_1),
        .timer_nanosec(systemtimer_ns_field_1),
        .timer_sec(systemtimer_s_field_1));
xge_sub_timer_sync_tx_0 timer_sync_tx
       (.resync_clk(ten_gig_eth_pcs_pma_core_clk156_out),
        .resync_clk_locked(dcm_locked_driver_dout),
        .resync_nanosec(timer_sync_tx_resync_nanosec),
        .resync_sec(timer_sync_tx_resync_sec),
        .timer_clk(systemtimer_clk_1),
        .timer_nanosec(systemtimer_ns_field_1),
        .timer_sec(systemtimer_s_field_1));
endmodule
