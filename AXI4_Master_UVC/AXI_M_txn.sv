class AXI_M_txn extends uvm_sequence_item;

  `uvm_object_utils(AXI_M_txn)


  typedef enum {READ, WRITE} txn_type_e;
  txn_type_e txn_type;

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
  function new(string name = "AXI_M_txn");
    super.new(name);
  endfunction

endclass