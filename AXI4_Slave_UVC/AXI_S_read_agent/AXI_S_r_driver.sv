class AXI_S_r_driver extends uvm_driver #(AXI_S_txn);

  `uvm_component_utils(AXI_S_r_driver)

  function new(string name, uvm_component parent);

    super.new(name, parent);

  endfunction

  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    `uvm_info("Slave_driver", "Inside AXI_S_r_driver build_phase", UVM_LOW)

  endfunction

  task run_phase(uvm_phase phase);

    `uvm_info("Slave_driver", "Inside AXI_S_r_driver run_phase", UVM_LOW)

    forever begin

      AXI_S_txn txn;

      seq_item_port.get_next_item(txn);

      `uvm_info("Slave_driver", $sformatf("Received txn: %s", txn.convert2string()), UVM_LOW)

      seq_item_port.item_done();
    end
  endtask
endclass
