class AXI_S_w_driver extends uvm_driver #(AXI_S_w_txn);

  `uvm_component_utils(AXI_S_w_driver)
  
  // declaring virual interface
  virtual interface AXI4_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Driver", "Inside AXI_S_w_driver build_phase", UVM_LOW)
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info("Driver", "Inside AXI_S_w_driver run_phase", UVM_LOW)
    forever begin
      AXI_S_w_txn txn;
      seq_item_port.get_next_item(txn);
      `uvm_info("DRV_AXI_S_w", $sformatf("Received txn"), UVM_LOW)
      seq_item_port.item_done();
    end
  endtask

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (!uvm_config_db#(virtual AXI4_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal(get_type_name(), "NO-VIF")
    end
  endfunction
endclass
