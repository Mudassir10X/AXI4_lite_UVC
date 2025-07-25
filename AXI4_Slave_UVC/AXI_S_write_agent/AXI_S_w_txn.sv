class AXI_S_w_txn extends uvm_sequence_item;

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
        logic                       WVALID;
  rand  logic                       WREADY;
  // delay
  rand  int                         clk_dly_AW;
  rand  int                         clk_dly_W;

  // ---------------------------
  // Write Response Channel (B) (not needed in AXI4_Lite as no exclusive access is legal)
  // ---------------------------
//   rand  logic [1:0]                 BRESP;
//   rand  logic                       BVALID;
//         logic                       BREADY;

  // Registering with the factory
  `uvm_object_utils_begin(AXI_S_w_txn)
  `uvm_field_int    (AWADDR,  UVM_ALL_ON)
  `uvm_field_int    (AWVALID, UVM_ALL_ON)
  `uvm_field_int    (AWREADY, UVM_ALL_ON)
  `uvm_field_int    (WDATA,   UVM_ALL_ON)
  `uvm_field_int    (WVALID,  UVM_ALL_ON)
  `uvm_field_int    (WREADY,  UVM_ALL_ON)
  `uvm_object_utils_end

  // ---------------------------
  // Constructor
  // ---------------------------
  function new(string name = "AXI_S_w_txn");
    super.new(name);
  endfunction
endclass