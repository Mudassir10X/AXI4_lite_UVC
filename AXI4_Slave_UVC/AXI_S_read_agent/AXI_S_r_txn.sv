class AXI_S_r_txn extends uvm_sequence_item;

  `uvm_object_utils(AXI_S_r_txn)
  
  // ---------------------------
  // Read Address Channel (AR)
  // ---------------------------
        logic [`ADDR_WIDTH-1:0]   ARADDR;
        logic                     ARVALID;
  rand  logic                     ARREADY;

  // ---------------------------
  // Read Data Channel (R)
  // ---------------------------
  rand  logic [`DATA_WIDTH-1:0]  RDATA;
  rand  logic                    RVALID;
        logic                    RREADY;

  // ---------------------------
  // Constructor
  // ---------------------------
  function new(string name = "AXI_S_r_txn");
    super.new(name);
  endfunction
endclass