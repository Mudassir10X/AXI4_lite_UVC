class AXI_S_r_txn extends uvm_sequence_item;

  `uvm_object_utils_begin(AXI_S_r_txn)
  `uvm_field_int      (ARADDR,  UVM_ALL_ON)
  `uvm_field_int      (ARVALID, UVM_ALL_ON)
  `uvm_field_int      (ARREADY, UVM_ALL_ON)
  `uvm_field_int      (RDATA,   UVM_ALL_ON)
  `uvm_field_int      (RVALID,  UVM_ALL_ON)
  `uvm_field_int      (RREADY,  UVM_ALL_ON)
  `uvm_object_utils_end
  
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