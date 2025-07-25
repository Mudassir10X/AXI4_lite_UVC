import uvm_pkg::*;
`include "uvm_macros.svh"

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
        AWVALID   == 1;
        AWVALID_n == 0;
        WVALID    == 0;
        WVALID_n  == 1;
      });
    finish_item(txn);
    `uvm_info(get_type_name(), "Write transaction executed", UVM_MEDIUM)
    txn.print();
  endtask
endclass

// class AXI_M_w_seq_AW_v extends AXI_M_w_seq_base;
//   `uvm_object_utils(AXI_M_w_seq_AW_v)

//   AXI_M_w_txn txn;

//   function new();
//     super.new();
//   endfunction //new()

//   virtual task body();
//     `uvm_info(get_type_name(), "Starting AXI Master Write Base Sequence", UVM_MEDIUM)
//     txn = AXI_M_w_txn::type_id::create("txn");
//     start_item(txn);
//     assert(txn.randomize() with {
//         AWVALID == 1;
//         WVALID == 0 ;
//       });
//     finish_item(txn);
//     `uvm_info(get_type_name(), "Write transaction executed", UVM_MEDIUM)
//     txn.print();
//   endtask
// endclass //AXI_M_w_seq_AW_v extends AXI_M_w_seq_base