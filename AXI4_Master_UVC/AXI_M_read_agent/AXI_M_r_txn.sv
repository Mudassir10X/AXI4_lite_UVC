class AXI_M_r_txn extends uvm_sequence_item;
  
  // ---------------------------
  // Read Address Channel (AR)
  // ---------------------------
  rand logic [`ADDR_WIDTH-1:0]      ARADDR;
  rand logic                       ARVALID;
  rand logic                       ARVALID_n;
       logic                       ARREADY;

  // ---------------------------
  // Read Data Channel (R)
  // ---------------------------
       logic [`DATA_WIDTH-1:0]      RDATA;
       logic                       RVALID;
  rand logic                       RREADY;
  rand logic                       RREADY_n;
  
  // Registering with the factory
  `uvm_object_utils_begin(AXI_M_r_txn)
  `uvm_field_int      (ARADDR,    UVM_ALL_ON)
  `uvm_field_int      (ARVALID,   UVM_ALL_ON)
  `uvm_field_int      (ARVALID_n, UVM_ALL_ON)
  `uvm_field_int      (ARREADY,   UVM_ALL_ON)
  `uvm_field_int      (RDATA,     UVM_ALL_ON)
  `uvm_field_int      (RVALID,    UVM_ALL_ON)
  `uvm_field_int      (RREADY,    UVM_ALL_ON)
  `uvm_field_int      (RREADY_n,  UVM_ALL_ON)
  `uvm_object_utils_end

  // ---------------------------
  // Constructor
  // ---------------------------
  function new(string name = "AXI_M_r_txn");
    super.new(name);
  endfunction

endclass