package AXI_M_pkg;

  // UVM import
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // Include transactions
  `include "AXI_M_r_txn.sv"
  `include "AXI_M_w_txn.sv"

  // Include master read agent components
  `include "AXI_M_r_driver.sv"
  `include "AXI_M_r_monitor.sv"
  `include "AXI_M_r_seq_lib.sv"
  `include "AXI_M_r_sequencer.sv"
  `include "AXI_M_r_agent.sv"

 // Include master write agent components

  `include "AXI_M_w_driver.sv"
  `include "AXI_M_w_monitor.sv"
  `include "AXI_M_w_seq_lib.sv"
  `include "AXI_M_w_sequencer.sv"
  `include "AXI_M_w_agent.sv"




  // Include environment and test
  `include "AXI_M_env.sv"
  //`include "env/axi_lite_env.sv" // I think the master and slave should have different UVC's thus different environments, what do you think?
  //`include "test/axi_lite_test.sv"

  // Import UVM macros
  `include "uvm_macros.svh"

endpackage