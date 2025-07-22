class AXI_M_r_sequencer extends uvm_sequencer #(AXI_M_r_txn);

  `uvm_component_utils(AXI_M_r_sequencer)

  function new(string name, uvm_component parent);

    super.new(name, parent);

  endfunction

  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    `uvm_info("Sequencer", "Inside AXI_M_r_sequencer build_phase", UVM_LOW)

  endfunction
endclass
