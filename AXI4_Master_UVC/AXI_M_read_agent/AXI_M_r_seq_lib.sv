// AXI Master Read Base Sequence
// Simulates a master sending an AXI read request.

class AXI_M_r_seq_base extends uvm_sequence #(AXI_M_r_txn);
  `uvm_object_utils(AXI_M_r_seq_base)

  // Handle to the read transaction item
  AXI_M_r_txn txn;

  // Constructor
  function new(string name = "AXI_M_r_seq_base");
    super.new(name);
  endfunction

  // Raise objection before sequence starts (for phase control)
  task pre_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      phase = get_starting_phase();  // For UVM 1.2
    `else
      phase = starting_phase;        // For earlier versions
    `endif

    if (phase != null) begin
      phase.raise_objection(this, get_type_name());
      `uvm_info(get_type_name(), "Raise objection", UVM_MEDIUM)
    end
  endtask

  // Drop objection after sequence ends
  task post_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif

    if (phase != null) begin
      phase.drop_objection(this, get_type_name());
      `uvm_info(get_type_name(), "Drop objection", UVM_MEDIUM)
    end
  endtask

  // Main transaction body
  virtual task body();
    `uvm_info(get_type_name(), "Starting AXI Master Read Base Sequence", UVM_MEDIUM)
    txn = AXI_M_r_txn::type_id::create("txn");
    start_item(txn);
    // Randomize with required conditions (Master issues valid read)
    assert(txn.randomize() with {
      ARVALID == 1;
      RREADY  == 1;
      clk_dly == 0;
    });
    finish_item(txn);
    `uvm_info(get_type_name(), "Write transaction executed", UVM_MEDIUM)
    txn.print();
  endtask
endclass

class AXI_M_r_seq_1clk_dly extends AXI_M_r_seq_base;
  `uvm_object_utils(AXI_M_r_seq_1clk_dly)

  // Handle to the read transaction item
  AXI_M_r_txn txn;

  // Constructor
  function new(string name = "AXI_M_r_seq_base");
    super.new(name);
  endfunction

  // Main transaction body
  virtual task body();
    `uvm_info(get_type_name(), "Starting AXI Master Read Base Sequence", UVM_MEDIUM)
    txn = AXI_M_r_txn::type_id::create("txn");
    start_item(txn);
    // Randomize with required conditions (Master issues valid read)
    assert(txn.randomize() with {
      ARVALID == 1;
      RREADY  == 1;
      clk_dly == 1;
    });
    finish_item(txn);
    `uvm_info(get_type_name(), "Write transaction executed", UVM_MEDIUM)
    txn.print();
  endtask
endclass
