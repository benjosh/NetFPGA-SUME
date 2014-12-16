`timescale 1ns / 1ps

module xge_sub_ten_gig_eth_pcs_pma_0_local_clocking
  (
  input           txoutclk, // TXOUTCLK from the GT (REFCLKOUT)
  output          clk156,   // 156.25MHz clock derived from txoutclk
  output          txclk322, // 322.26MHz clock derived from txoutclk
  output          dclk,     // 156.25MHz clock derived from txoutclk - same as clk156
  output          lfclk,    // The low frequency clock (related phase to the other clocks)
  input           mmcm_reset, // MMCM Reset input
  output          mmcm_lock   // MMCM Locked indicator
  );  
  
  wire clkfbout;
  wire clk156_i;
  wire clk322_i;
  wire lfclk_i;      
  
         
         
           
  // Clock management logic
  MMCME2_BASE #(
      .BANDWIDTH("OPTIMIZED"),
      .CLKFBOUT_MULT_F(8.250),
      .CLKFBOUT_PHASE(0.000),
      .CLKIN1_PERIOD(6.400),
      .CLKOUT0_DIVIDE_F(4.125),
      .CLKOUT0_DUTY_CYCLE(0.5),
      .CLKOUT0_PHASE(0.000),
      .CLKOUT1_DIVIDE(2),
      .CLKOUT1_DUTY_CYCLE(0.5),
      .CLKOUT1_PHASE(0.000),
      .CLKOUT2_DIVIDE(66),
      .CLKOUT2_DUTY_CYCLE(0.5),
      .CLKOUT2_PHASE(0.000),      
      .CLKOUT4_CASCADE("FALSE"),
      .DIVCLK_DIVIDE(2),
      .REF_JITTER1(0.010),
      .STARTUP_WAIT("FALSE")
   ) mmcm_i (
      .CLKFBOUT(clkfbout),
      .CLKFBOUTB(),
      .CLKOUT0(clk156_i),
      .CLKOUT0B(),
      .CLKOUT1(clk322_i),
      .CLKOUT1B(),
      .CLKOUT2(lfclk_i),
      .CLKOUT2B(),
      .CLKOUT3(),
      .CLKOUT3B(),
      .CLKOUT4(),
      .CLKOUT5(),
      .CLKOUT6(),
      .LOCKED(mmcm_lock),
      .CLKFBIN(clkfbout),
      .CLKIN1(txoutclk),
      .PWRDWN(1'b0),
      .RST(mmcm_reset)
 );      
 	
  BUFG clk156_buf_i (
    .I(clk156_i),
    .O(clk156));
    
  BUFH clk322_buf_i (
    .I(clk322_i),
    .O(txclk322));        
    
  BUFH lfclk_buf_i (
    .I(lfclk_i),
    .O(lfclk));            
    
  assign dclk = clk156;    
endmodule  
