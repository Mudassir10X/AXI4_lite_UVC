interface AXI4_if (
  input bit   ACLK,
  input bit   ARESETn
);

// ============================================================================
// WRITE ADDRESS CHANNEL (Master to Slave)
// ============================================================================
  logic [`ADDR_WIDTH-1:0]      AWADDR;
  logic                       AWVALID;
  logic                       AWREADY;

// ============================================================================
// WRITE DATA CHANNEL (Master to Slave)
// ============================================================================
  logic [`DATA_WIDTH-1:0]      WDATA;
  logic                       WVALID;
  logic                       WREADY;

// ============================================================================
// WRITE RESPONSE CHANNEL (Slave to Master) (not needed in AXI4_Lite as no exclusive access is legal)
// ============================================================================
  // logic [1:0]                 BRESP;
  // logic                       BVALID;
  // logic                       BREADY;

// ============================================================================
// READ ADDRESS CHANNEL (Master to Slave)
// ============================================================================
  logic [`ADDR_WIDTH-1:0]      ARADDR;
  logic                       ARVALID;
  logic                       ARREADY;

// ============================================================================
// READ DATA CHANNEL (Slave to Master) 
// ============================================================================
  logic [`DATA_WIDTH-1:0]      RDATA;
  logic                       RVALID;
  logic                       RREADY;

  initial begin
    AWADDR  = '0;
    AWVALID = 0;
    AWREADY = 0;
    WDATA   = '0;
    WVALID  = 0;
    WREADY  = 0;
    ARADDR  = '0;
    ARVALID = 0;
    ARREADY = 0;
    RDATA   = '0;
    RVALID  = 0;
    RREADY  = 0;
  end

endinterface