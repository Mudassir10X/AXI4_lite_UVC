class AXI_M_w_txn extends uvm_sequence_item;

  `uvm_object_utils(AXI_M_w_txn)

  // ---------------------------
  // Write Address Channel (AW)
  // ---------------------------
  rand logic [`ADDR_WIDTH-1:0]      AWADDR;
  rand logic                       AWVALID;
       logic                       AWREADY;

  // ---------------------------
  // Write Data Channel (W)
  // ---------------------------
  rand logic [`DATA_WIDTH-1:0]      WDATA;
  rand logic [(`DATA_WIDTH/8)-1:0]  WSTRB;
  rand logic                       WVALID;
       logic                       WREADY;

  // ---------------------------
  // Write Response Channel (B)
  // ---------------------------
       logic [1:0]                 BRESP;
       logic                       BVALID;
  rand logic                       BREADY;

  // ---------------------------
  // Constructor
  // ---------------------------
  function new(string name = "AXI_M_w_txn");
    super.new(name);
  endfunction

endclass