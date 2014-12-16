`timescale 1ns / 1ps

module xge_sub_ten_gig_eth_pcs_pma_0_local_resets
  (
  input          lfclk,
  input          mmcm_lock,
  output         lfreset
  );  
  
  
  (* ASYNC_REG = "TRUE", shreg_extract = "no" *)
  reg lfreset_d;  
    
  assign lfreset    = lfreset_d;
  
  // Release lfreset synchronous to the edges
  // of clk156 and txclk322
  always @(negedge mmcm_lock or posedge lfclk) begin
    if (!mmcm_lock) begin
      lfreset_d <= 1'b1;
    end
    else begin
      lfreset_d <= 1'b0;
    end
  end    
endmodule  
