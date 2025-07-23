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

  virtual task body();
    `uvm_info(get_type_name(), "Starting AXI Master Write Base Sequence", UVM_MEDIUM)

    txn = AXI_M_w_txn::type_id::create("txn");

    start_item(txn);
    assert(txn.randomize());
    finish_item(txn);

    `uvm_info(get_type_name(), "Write transaction executed", UVM_LOW)
    txn.print();

    #10;
  endtask
endclass