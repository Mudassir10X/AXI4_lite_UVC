class AXI_M_r_driver extends uvm_driver #(AXI_M_txn);

  `uvm_component_utils(AXI_M_r_driver)



  function new(string name, uvm_component parent);
    super.new(name, parent);

  endfunction

  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    `uvm_info("Driver", "Inside AXI_M_r_driver build_phase", UVM_LOW)
  endfunction

  task run_phase(uvm_phase phase);

    `uvm_info("Driver", "Inside AXI_M_r_driver run_phase", UVM_LOW)
    forever begin

      AXI_M_txn txn;

      seq_item_port.get_next_item(txn);

      `uvm_info("DRV_AXI_M", "", UVM_LOW);
      
      seq_item_port.item_done();

    end
  endtask

endclass