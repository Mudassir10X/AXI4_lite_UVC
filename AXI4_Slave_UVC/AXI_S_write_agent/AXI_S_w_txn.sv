class AXI_S_w_txn extends uvm_sequence_item;

  `uvm_object_utils(AXI_S_w_txn)

  // ---------------------------
  // Write Address Channel (AW)
  // ---------------------------
        logic [`ADDR_WIDTH-1:0]      AWADDR;
        logic                       AWVALID;
  rand  logic                       AWREADY;

  // ---------------------------
  // Write Data Channel (W)
  // ---------------------------
        logic [`DATA_WIDTH-1:0]      WDATA;
        logic [(`DATA_WIDTH/8)-1:0]  WSTRB;
        logic                       WVALID;
  rand  logic                       WREADY;

  // ---------------------------
  // Write Response Channel (B)
  // ---------------------------
  rand  logic [1:0]                 BRESP;
  rand  logic                       BVALID;
        logic                       BREADY;

  // ---------------------------
  // Constructor
  // ---------------------------
  function new(string name = "AXI_S_w_txn");
    super.new(name);
  endfunction
endclass