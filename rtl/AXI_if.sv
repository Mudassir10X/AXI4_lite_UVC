interface AXI4_if #(
  parameter ADDR_WIDTH = 32,
  parameter DATA_WIDTH = 32
)(
  input bit   ACLK,
  input bit   ARESETn
);

// ============================================================================
// WRITE ADDRESS CHANNEL (Master to Slave)
// ============================================================================
  logic [ADDR_WIDTH-1:0]      AWADDR;
  logic                       AWVALID;
  logic                       AWREADY;

// ============================================================================
// WRITE DATA CHANNEL (Master to Slave)
// ============================================================================
  logic [DATA_WIDTH-1:0]      WDATA;
  logic                       WVALID;
  logic                       WREADY;

// ============================================================================
// WRITE RESPONSE CHANNEL (Slave to Master)
// ============================================================================
  logic [1:0]                 BRESP;
  logic                       BVALID;
  logic                       BREADY;

// ============================================================================
// READ ADDRESS CHANNEL (Master to Slave)
// ============================================================================
  logic [ADDR_WIDTH-1:0]      ARADDR;
  logic                       ARVALID;
  logic                       ARREADY;
// ARCACHE, ARLOCK, ARPROT missing

// ============================================================================
// READ DATA CHANNEL (Slave to Master)
// ============================================================================
  logic [DATA_WIDTH-1:0]      RDATA;
  logic                       RVALID;
  logic                       RREADY;

endinterface