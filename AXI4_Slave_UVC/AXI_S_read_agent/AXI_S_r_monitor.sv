class AXI_S_r_monitor extends uvm_monitor;

  `uvm_component_utils(AXI_S_r_monitor)
  
  // declaring virual interface
  virtual interface AXI4_if vif;

  // Collected Data handle
  AXI_S_r_txn pkt;

  // Count packets collected
  int num_pkt_col;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Monitor", "Inside AXI_S_r_monitor build_phase", UVM_LOW)
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info("Monitor", "Inside AXI_S_r_monitor run_phase", UVM_LOW)
  endtask

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (!uvm_config_db#(virtual AXI4_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal(get_type_name(), "NO-VIF")
    end
  endfunction
endclass
