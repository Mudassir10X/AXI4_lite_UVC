class AXI_M_r_agent extends uvm_agent;

  `uvm_component_utils(AXI_M_r_agent)

  AXI_M_r_driver     drv;
  AXI_M_r_monitor    mon;
  AXI_M_r_sequencer  seq;

  function new(string name, uvm_component parent);

    super.new(name, parent);

  endfunction

  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    `uvm_info("Agent", "Inside AXI_M_r_agent build_phase", UVM_LOW)

    drv = AXI_M_r_driver::type_id::create("drv", this);
    mon = AXI_M_r_monitor::type_id::create("mon", this);
    seq = AXI_M_r_sequencer::type_id::create("seq", this);

  endfunction

  function void connect_phase(uvm_phase phase);

    super.connect_phase(phase);

    drv.seq_item_port.connect(seq.seq_item_export);
    
  endfunction
endclass
