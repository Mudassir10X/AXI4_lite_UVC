class AXI_S_w_sequencer extends uvm_sequencer #(AXI_S_w_txn);
  `uvm_component_utils(AXI_S_w_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Slave_sequencer", "Inside AXI_S_w_sequencer build_phase", UVM_LOW)
  endfunction
endclass
