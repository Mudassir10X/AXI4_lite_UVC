`timescale 1ns/1ps

import uvm_pkg::*;                
`include "uvm_macros.svh"

import axi_lite_tb_pkg::*;       

module tb_top;
  logic ACLK;
  logic ARESETn;

  initial ACLK = 0;
  always #5 ACLK = ~ACLK;


  initial begin
    ARESETn = 0;
    #20;
    ARESETn = 1;
  end

  
  axi4_if axi_if (
    .ACLK(ACLK),
    .ARESETn(ARESETn)
  );

 

  initial begin
    `uvm_info("TB_TOP", "Starting simulation...", UVM_LOW)
    run_test("axi_lite_test");
  end

endmodule
