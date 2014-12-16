//-----------------------------------------------------------------------------
//
// Here comes the NetFPGA new and nice header
//--
//------------------------------------------------------------------------------

`timescale 1ns / 100ps

 module top_tb # (
  parameter          PL_SIM_FAST_LINK_TRAINING           = "TRUE",      // Simulation Speedup
  parameter          C_DATA_WIDTH                        = 256,         // RX/TX interface data width
  parameter          KEEP_WIDTH                          = C_DATA_WIDTH / 32,
  parameter  integer USER_CLK2_FREQ                 = 4,
  parameter          REF_CLK_FREQ                   = 0,           // 0 - 100 MHz, 1 - 125 MHz,  2 - 250 MHz
  parameter          AXISTEN_IF_RQ_ALIGNMENT_MODE   = "FALSE",
  parameter          AXISTEN_IF_CC_ALIGNMENT_MODE   = "FALSE",
  parameter          AXISTEN_IF_CQ_ALIGNMENT_MODE   = "FALSE",
  parameter          AXISTEN_IF_RC_ALIGNMENT_MODE   = "FALSE",
  parameter          AXISTEN_IF_ENABLE_CLIENT_TAG   = 0,
  parameter          AXISTEN_IF_RQ_PARITY_CHECK     = 0,
  parameter          AXISTEN_IF_CC_PARITY_CHECK     = 0,
  parameter          AXISTEN_IF_MC_RX_STRADDLE      = 0,
  parameter          AXISTEN_IF_ENABLE_RX_MSG_INTFC = 0,
  parameter   [17:0] AXISTEN_IF_ENABLE_MSG_ROUTE    = 18'h2FFFF
) (

);

 parameter PCIE_PERIOD = 10;
 parameter XPHY_PERIOD = 6.4;
 parameter CORE_PERIOD = 4;
 
   localparam  TCQ                                 = 1;
   localparam  BAR0AXI                             = 32'h40000000;
   localparam  BAR1AXI                             = 32'h10000000;
   localparam  BAR2AXI                             = 32'h20000000;
   localparam  BAR3AXI                             = 32'h30000000;
   localparam  BAR4AXI                             = 32'h40000000;
   localparam  BAR5AXI                             = 32'h50000000;
   localparam  BAR0SIZE                            = 64'hFFFF_FFFF_FFFF_FF80;
   localparam  BAR1SIZE                            = 64'hFFFF_FFFF_FFFF_FF80;
   localparam  BAR2SIZE                            = 64'hFFFF_FFFF_FFFF_FF80;
   localparam  BAR3SIZE                            = 64'hFFFF_FFFF_FFFF_FF80;
   localparam  BAR4SIZE                            = 64'hFFFF_FFFF_FFFF_FF80;
   localparam  BAR5SIZE                            = 64'hFFFF_FFFF_FFFF_FF80;
   localparam  throttle_percent                    = 50;
 
 reg       sys_reset_n; 

  reg                                       sys_clk;
  wire sys_clkp,sys_clkn;
  reg                                       xphy_clk;
  wire xphy_refclk_p,xphy_refclk_n;
  reg                                       clk_ref;
  wire clk_ref_p,clk_ref_n;
  //----------------------------------------------------------------------------------------------------------------//
  // axis interface                                                                                                 //
  //----------------------------------------------------------------------------------------------------------------//

 
 
 top # (
    .PL_SIM_FAST_LINK_TRAINING       (PL_SIM_FAST_LINK_TRAINING        ),
    .C_DATA_WIDTH                    (C_DATA_WIDTH                     ),
    .KEEP_WIDTH                      (KEEP_WIDTH                       ),
    .USER_CLK2_FREQ                  (USER_CLK2_FREQ                   ),
    .REF_CLK_FREQ                    (REF_CLK_FREQ                     ),
    .AXISTEN_IF_RQ_ALIGNMENT_MODE    (AXISTEN_IF_RQ_ALIGNMENT_MODE     ),
    .AXISTEN_IF_CC_ALIGNMENT_MODE    (AXISTEN_IF_CC_ALIGNMENT_MODE     ),
    .AXISTEN_IF_CQ_ALIGNMENT_MODE    (AXISTEN_IF_CQ_ALIGNMENT_MODE     ),
    .AXISTEN_IF_RC_ALIGNMENT_MODE    (AXISTEN_IF_RC_ALIGNMENT_MODE     ),
    .AXISTEN_IF_ENABLE_CLIENT_TAG    (AXISTEN_IF_ENABLE_CLIENT_TAG     ),
    .AXISTEN_IF_RQ_PARITY_CHECK      (AXISTEN_IF_RQ_PARITY_CHECK       ),
    .AXISTEN_IF_CC_PARITY_CHECK      (AXISTEN_IF_CC_PARITY_CHECK       ),
    .AXISTEN_IF_MC_RX_STRADDLE       (AXISTEN_IF_MC_RX_STRADDLE        ),
    .AXISTEN_IF_ENABLE_RX_MSG_INTFC  (AXISTEN_IF_ENABLE_RX_MSG_INTFC   ),
    .AXISTEN_IF_ENABLE_MSG_ROUTE     (AXISTEN_IF_ENABLE_MSG_ROUTE      )
  ) top (
  
  //PCI Express
    .pcie_7x_mgt_rxn(pcie_7x_mgt_rxn),
    .pcie_7x_mgt_rxp(pcie_7x_mgt_rxp),
    .pcie_7x_mgt_txn(pcie_7x_mgt_txn),
    .pcie_7x_mgt_txp(pcie_7x_mgt_txp),
  //10G Interface
  
    .rxp(rxp),
    .rxn(rxn),
    .txp(txp),
    .txn(txn),
    
  // PCIe Clock
    .sys_clkp(sys_clkp),
    .sys_clkn(sys_clkn),
    
    //200MHz Clock
    .clk_ref_p(clk_ref_p),
    .clk_ref_n(clk_ref_n),
    
    
    
        //-SI5324 I2C programming interface
    .i2c_clk      (i2c_clk),
    .i2c_data     (i2c_data),
    .i2c_mux_rst_n(i2c_mux_rst_n),
    .si5324_rst_n (si5324_rst_n),
    
    
    // 156.25 MHz clock in
    .xphy_refclk_p (xphy_refclk_p),
    .xphy_refclk_n (xphy_refclk_n),
    
    .led_0(led_0),
    .led_1(led_1),
    .led_2(led_2),  
        
  
    .sys_reset_n(sys_reset_n),
    .emcclk (emcclk)
  );
 
 
 
  
   
    
//Reset handling
 // Important! polarity here is opposite the one in the actual design
   initial begin 
    sys_reset_n = 1'b0;
    #(CORE_PERIOD * 200);
    sys_reset_n = 1'b1;
    $display("Reset Deasserted");
   end

//Clock generation
   initial begin
      sys_clk = 1'b0;
      #(PCIE_PERIOD/2);
      forever
         #(PCIE_PERIOD/2) sys_clk = ~sys_clk;
   end 

   assign sys_clkp = sys_clk;
   assign sys_clkn = ~sys_clk; 
   
   
    initial begin
      xphy_clk = 1'b0;
      #(XPHY_PERIOD/2);
      forever
         #(XPHY_PERIOD/2) xphy_clk = ~xphy_clk;
   end 

   assign xphy_refclk_p = xphy_clk;
   assign xphy_refclk_n = ~xphy_clk; 
   
 initial begin
   clk_ref = 1'b0;
   #(CORE_PERIOD/2);
   forever
      #(CORE_PERIOD/2) clk_ref = ~clk_ref;
end 

assign clk_ref_p = clk_ref;
assign clk_ref_p = ~clk_ref; 

endmodule
