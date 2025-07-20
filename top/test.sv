  import uvm_pkg::*;
  `include "uvm_macros.svh"
import AXI_S_pkg::*;
import AXI_M_pkg::*;
class AXI_test extends uvm_test;

  `uvm_component_utils(AXI_test)

   AXI_M_env env_m;
   AXI_S_env env_s;

  function new(string name = "AXI_test", uvm_component parent = null);

    super.new(name, parent);

  endfunction

  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    `uvm_info("TEST", "Inside AXI_test build_phase", UVM_LOW)

    env_m = AXI_M_env::type_id::create("env_m", this);
    env_s = AXI_S_env::type_id::create("env_s", this);

  endfunction

  task run_phase(uvm_phase phase);

    `uvm_info("TEST", "Inside AXI_test run_phase", UVM_LOW)
    
    phase.raise_objection(this);

 
    #100ns;

    phase.drop_objection(this);
  endtask

      function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase
endclass
