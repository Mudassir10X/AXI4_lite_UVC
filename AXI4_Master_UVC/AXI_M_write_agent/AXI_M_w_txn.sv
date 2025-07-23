class AXI_M_w_txn extends uvm_sequence_item;

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

  // Registering with the factory
  `uvm_object_utils_begin(AXI_M_w_txn)
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
  // Constructor
  // ---------------------------
  function new(string name = "AXI_M_w_txn");
    super.new(name);
  endfunction

endclass