class AXI_M_w_monitor extends uvm_monitor;

  `uvm_component_utils(AXI_M_w_monitor)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Monitor", "Inside AXI_M_w_monitor build_phase", UVM_LOW)
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info("Monitor", "Inside AXI_M_w_monitor run_phase", UVM_LOW)
  endtask
endclass
