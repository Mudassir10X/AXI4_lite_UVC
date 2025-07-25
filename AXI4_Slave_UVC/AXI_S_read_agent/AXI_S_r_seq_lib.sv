// AXI Slave Read Base Sequence
// Simulates how the AXI slave responds to read transactions (AR + R channel)

class AXI_S_r_seq_base extends uvm_sequence #(AXI_S_r_txn);
  `uvm_object_utils(AXI_S_r_seq_base)

  // Transaction handle for the AXI Slave Read
  AXI_S_r_txn txn;

  // ------------------------
  // Constructor
  // ------------------------
  function new(string name = "AXI_S_r_seq_base");
    super.new(name);
  endfunction

  // ------------------------
  // Pre-body: Raise objection before sequence runs
  // Ensures UVM phase doesn't move forward until sequence finishes
  // ------------------------
  task pre_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      phase = get_starting_phase(); // For UVM 1.2 compatibility
    `else
      phase = starting_phase; // For UVM >=1.1
    `endif

    if (phase != null) begin
      phase.raise_objection(this, get_type_name());
      `uvm_info(get_type_name(), "Raise objection", UVM_MEDIUM)
    end
  endtask : pre_body

  // ------------------------
  // Post-body: Drop objection after sequence ends
  // Signals UVM to continue simulation phases
  // ------------------------
  task post_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      phase = get_starting_phase(); // UVM 1.2 compatibility
    `else
      phase = starting_phase;
    `endif

    if (phase != null) begin
      phase.drop_objection(this, get_type_name());
      `uvm_info(get_type_name(), "Drop objection", UVM_MEDIUM)
    end
  endtask : post_body

  // ------------------------
  // Body: Main logic of the sequence
  // Randomizes and sends a read transaction with slave response
  // ------------------------
  virtual task body();
    `uvm_info(get_type_name(), "Starting AXI Slave Read Base Sequence", UVM_MEDIUM)

    // Create the transaction object
    txn = AXI_S_r_txn::type_id::create("txn");

    // Start the transaction
    start_item(txn);

    // Randomize fields:
    // - ARREADY: Slave is ready to accept address
    // - RVALID : Slave has valid data to return
    // Optionally, you can constrain RDATA to fixed values for debug
    assert(txn.randomize() with {
      RDATA inside {32'hBEEFCAFE, 32'hCAFEBABE, 32'hFEEDFACE}; // Optional pattern
      ARREADY     == 1;
      RVALID      == 1;
      clk_dly_AR  == 1;
      clk_dly_R   == 0;
    });
    finish_item(txn);
    `uvm_info(get_type_name(), "Write transaction executed", UVM_MEDIUM)
    txn.print();
  endtask
endclass

class AXI_S_r_seq_1clk extends AXI_S_r_seq_base;
  `uvm_object_utils(AXI_S_r_seq_1clk)

  // Transaction handle for the AXI Slave Read
  AXI_S_r_txn txn;

  // ------------------------
  // Constructor
  // ------------------------
  function new(string name = "AXI_S_r_seq_1clk");
    super.new(name);
  endfunction

  // ------------------------
  // Body: Main logic of the sequence
  // Randomizes and sends a read transaction with slave response
  // ------------------------
  virtual task body();
    `uvm_info(get_type_name(), "Starting AXI_S_r_seq_1clk", UVM_MEDIUM)

    // Create the transaction object
    txn = AXI_S_r_txn::type_id::create("txn");

    // Start the transaction
    start_item(txn);

    // Randomize fields:
    // - ARREADY: Slave is ready to accept address
    // - RVALID : Slave has valid data to return
    // Optionally, you can constrain RDATA to fixed values for debug
    assert(txn.randomize() with {
      RDATA inside {32'hBEEFCAFE, 32'hCAFEBABE, 32'hFEEDFACE}; // Optional pattern
      ARREADY     == 1;
      RVALID      == 1;
      clk_dly_AR  == 2;
      clk_dly_R   == 1;
    });
    finish_item(txn);
    `uvm_info(get_type_name(), "Write transaction executed", UVM_MEDIUM)
    txn.print();
  endtask
endclass