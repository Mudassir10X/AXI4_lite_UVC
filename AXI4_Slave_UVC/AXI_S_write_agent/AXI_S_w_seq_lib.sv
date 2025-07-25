

// AXI Slave Write Base Sequence

class AXI_S_w_seq_base extends uvm_sequence #(AXI_S_w_txn);
  `uvm_object_utils(AXI_S_w_seq_base)

  AXI_S_w_txn txn;

  // bit [6:0] id;
  // const int number_of_transactions;

  // Constructor
  function new(string name = "AXI_S_w_seq_base");
    super.new(name);
  endfunction

  task pre_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      // in UVM1.2, get starting phase from method
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif
    if (phase != null) begin
      phase.raise_objection(this, get_type_name());
      `uvm_info(get_type_name(), "raise objection", UVM_MEDIUM)
    end
  endtask : pre_body

  task post_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      // in UVM1.2, get starting phase from method
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif
    if (phase != null) begin
      phase.drop_objection(this, get_type_name());
      `uvm_info(get_type_name(), "drop objection", UVM_MEDIUM)
    end
  endtask : post_body

  // Main task to simulate write behavior of AXI slave
  virtual task body();
    `uvm_info(get_type_name(), $sformatf("Starting AXI Slave Write Base Sequence (txn)"), UVM_MEDIUM)
    txn = AXI_S_w_txn::type_id::create("txn");
    start_item(txn);
    // Slave responds ready and sends a response
    assert(txn.randomize() with {
      AWREADY == 1;
      WREADY == 1;
    });
    finish_item(txn);
    `uvm_info(get_type_name(), "Write transaction executed", UVM_MEDIUM)
    txn.print();
  endtask
endclass
