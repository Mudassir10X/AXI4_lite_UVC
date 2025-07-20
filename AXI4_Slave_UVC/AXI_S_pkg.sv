package AXI_S_pkg;

  // UVM import
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // Include transaction
  `include "AXI_S_txn.sv"
  // Slave and slave will need their respective transaction classes. so 2 transactions will be there

  // Include Slave read agent components
  `include "AXI_S_r_driver.sv"
  `include "AXI_S_r_monitor.sv"
  `include "AXI_S_r_sequencer.sv"
  `include "AXI_S_r_agent.sv"

 // Include Slave write agent components

  `include "AXI_S_w_driver.sv"
  `include "AXI_S_w_monitor.sv"
  `include "AXI_S_w_sequencer.sv"
  `include "AXI_S_w_agent.sv"




  // Include environment and test
  `include "AXI_S_env.sv"
  //`include "env/axi_lite_env.sv" // I think the Slave and slave should have different UVC's thus different environments, what do you think?
  //`include "test/axi_lite_test.sv"

  // Import UVM macros
  `include "uvm_macros.svh"

endpackage