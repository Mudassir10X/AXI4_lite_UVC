class AXI_S_w_txn extends uvm_sequence_item;

  `uvm_object_utils_begin(AXI_S_w_txn)
  `uvm_field_int    (AWADDR,  UVM_ALL_ON)
  `uvm_field_int    (AWVALID, UVM_ALL_ON)
  `uvm_field_int    (AWREADY, UVM_ALL_ON)
  `uvm_field_int    (WDATA,   UVM_ALL_ON)
  `uvm_field_int    (WVALID,  UVM_ALL_ON)
  `uvm_field_int    (WREADY,  UVM_ALL_ON)
  `uvm_field_int    (BRESP,   UVM_ALL_ON)
  `uvm_field_int    (BVALID,  UVM_ALL_ON)
  `uvm_field_int    (BREADY,  UVM_ALL_ON)
  `uvm_object_utils_end

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