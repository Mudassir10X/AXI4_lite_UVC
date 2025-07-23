`timescale 1ns/1ps


module tb_top;

    typedef uvm_config_db#(virtual AXI4_if) AXI_vif_config;


import uvm_pkg::*;                
`include "uvm_macros.svh"

import AXI_M_pkg::*;     
import AXI_S_pkg::*;      

  logic ACLK;
  logic ARESETn;

  initial ACLK = 0;
  always #5 ACLK = ~ACLK;


  initial begin
    ARESETn = 0;
    #20;
    ARESETn = 1;
  end

  
AXI4_if axi_if (
    .ACLK(ACLK),
    .ARESETn(ARESETn)
  );

 

  initial begin
    
    uvm_config_db#(virtual AXI4_if)::set(null,"*","vif", axi_if);
    run_test("AXI_test");

    
  end


endmodule
