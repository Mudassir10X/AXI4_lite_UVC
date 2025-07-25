package AXI_S_pkg;

  // UVM import
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // Include transaction
  `include "AXI_S_r_txn.sv"
  `include "AXI_S_w_txn.sv"
  // Slave and slave will need their respective transaction classes. so 2 transactions will be there

  // Include Slave read agent components
  `include "AXI_S_r_driver.sv"
  `include "AXI_S_r_monitor.sv"
  `include "AXI_S_r_seq_lib.sv"
  `include "AXI_S_r_sequencer.sv"
  `include "AXI_S_r_agent.sv"

 // Include Slave write agent components

  `include "AXI_S_w_driver.sv"
  `include "AXI_S_w_monitor.sv"
  `include "AXI_S_w_seq_lib.sv"
  `include "AXI_S_w_sequencer.sv"
  `include "AXI_S_w_agent.sv"




  // Include environment and test
  `include "AXI_S_env.sv"

  // Import UVM macros
  `include "uvm_macros.svh"

endpackage