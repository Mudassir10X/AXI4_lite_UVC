import uvm_pkg::*;
`include "uvm_macros.svh"

class AXI_M_w_base_seq extends uvm_sequence #(AXI_M_w_txn);

  `uvm_object_utils(AXI_M_w_base_seq)

  function new(string name = "AXI_M_w_base_seq");
    super.new(name);
  endfunction

  virtual task body();
    AXI_M_w_txn txn;
    txn = AXI_M_w_txn::type_id::create("txn");
    if (!txn.randomize()) begin
      `uvm_error("AXI_M_w_base_seq", "Randomization failed for AXI_M_w_txn")
    end
    txn.AWVALID = 1;
    txn.WVALID = 1;
    start_item(txn);
    finish_item(txn);
  endtask

endclass


class AXI_M_w_seq_base extends uvm_sequence #(AXI_M_w_txn);
  `uvm_object_utils(AXI_M_w_seq_base)

  AXI_M_w_txn txn;

  function new(string name = "AXI_M_w_seq_base");
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

  virtual task body();
    `uvm_info(get_type_name(), "Starting AXI Master Write Base Sequence", UVM_MEDIUM)

    txn = AXI_M_w_txn::type_id::create("txn");

    start_item(txn);
    assert(txn.randomize() with {
        WVALID == 1;
        AWVALID == 1;
      });
    finish_item(txn);

    `uvm_info(get_type_name(), "Write transaction executed", UVM_LOW)
    txn.print();

    #10;
  endtask
endclass