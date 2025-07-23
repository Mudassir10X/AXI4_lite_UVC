class AXI_M_w_agent extends uvm_agent;

  `uvm_component_utils_begin(AXI_M_w_agent)
    `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_ALL_ON);
  `uvm_component_utils_end

  AXI_M_w_driver     drv;
  AXI_M_w_monitor    mon;
  AXI_M_w_sequencer  seq;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Agent", "Inside AXI_M_w_agent build_phase", UVM_LOW)
    mon = AXI_M_w_monitor::type_id::create("mon", this);
    if (is_active == UVM_ACTIVE) begin
      drv = AXI_M_w_driver::type_id::create("drv", this);
      seq = AXI_M_w_sequencer::type_id::create("seq", this);
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (is_active == UVM_ACTIVE) begin
      drv.seq_item_port.connect(seq.seq_item_export);
    end
  endfunction
endclass
