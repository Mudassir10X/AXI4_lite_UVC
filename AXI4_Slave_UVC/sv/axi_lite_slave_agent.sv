class axi_lite_slave_agent extends uvm_agent;
  `uvm_component_utils(axi_lite_slave_agent)

  axi_lite_slave_driver     drv;
  axi_lite_slave_monitor    mon;
  axi_lite_slave_sequencer  seq;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SLV_AGT", "Inside axi_lite_slave_agent build_phase", UVM_LOW)

    drv = axi_lite_slave_driver::type_id::create("drv", this);
    mon = axi_lite_slave_monitor::type_id::create("mon", this);
    seq = axi_lite_slave_sequencer::type_id::create("seq", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seq.seq_item_export);
  endfunction
endclass
