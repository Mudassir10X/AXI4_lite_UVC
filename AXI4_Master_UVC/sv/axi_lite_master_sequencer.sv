class axi_lite_master_sequencer extends uvm_sequencer #(axi_lite_txn);

  `uvm_component_utils(axi_lite_master_sequencer)

  function new(string name, uvm_component parent);

    super.new(name, parent);

  endfunction

  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    `uvm_info("Sequencer", "Inside axi_lite_master_sequencer build_phase", UVM_LOW)

  endfunction
endclass
