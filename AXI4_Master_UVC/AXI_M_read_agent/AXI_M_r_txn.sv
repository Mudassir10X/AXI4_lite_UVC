class AXI_M_r_txn extends uvm_sequence_item;

  `uvm_object_utils(AXI_M_r_txn)
  
  // ---------------------------
  // Read Address Channel (AR)
  // ---------------------------
  rand logic [`ADDR_WIDTH-1:0]      ARADDR;
  rand logic                       ARVALID;
       logic                       ARREADY;

  // ---------------------------
  // Read Data Channel (R)
  // ---------------------------
       logic [`DATA_WIDTH-1:0]      RDATA;
       logic                       RVALID;
  rand logic                       RREADY;

  // ---------------------------
  // Constructor
  // ---------------------------
  function new(string name = "AXI_M_r_txn");
    super.new(name);
  endfunction

endclass