interface axi4_if #(
  parameter ADDR_WIDTH = 32,
  parameter DATA_WIDTH = 32
)(
  input bit   ACLK,
  input bit   ARESETn
);

// ============================================================================
// WRITE ADDRESS CHANNEL (Master to Slave)
// ============================================================================
  logic [3:0]                 AWID;     // AXI4 Only
  logic [ADDR_WIDTH-1:0]      AWADDR;
  logic [3:0]                 AWLEN;    // AXI4 Only
  logic [2:0]                 AWSIZE;   // AXI4 Only
  logic [1:0]                 AWBURST;  // AXI4 Only
  logic [1:0]                 AWLOCK;
  logic [3:0]                 AWCACHE;
  logic [2:0]                 AWPROT;
  logic                       AWVALID;
  logic                       AWREADY;

// ============================================================================
// WRITE DATA CHANNEL (Master to Slave)
// ============================================================================
  logic [3:0]                 WID;      // AXI4 Only
  logic [DATA_WIDTH-1:0]      WDATA;
  logic [(DATA_WIDTH/8)-1:0]  WSTRB;
  logic                       WLAST;    // AXI4 Only
  logic                       WVALID;
  logic                       WREADY;

// ============================================================================
// WRITE RESPONSE CHANNEL (Slave to Master)
// ============================================================================
  logic [3:0]                 BID;      // AXI4 Only
  logic [1:0]                 BRESP;
  logic                       BVALID;
  logic                       BREADY;

// ============================================================================
// READ ADDRESS CHANNEL (Master to Slave)
// ============================================================================
  logic [3:0]                 ARID;     // AXI4 Only
  logic [ADDR_WIDTH-1:0]      ARADDR;
  logic [3:0]                 ARLEN;    // AXI4 Only
  logic [2:0]                 ARSIZE;   // AXI4 Only
  logic [1:0]                 ARBURST;  // AXI4 Only
  logic [1:0]                 ARLOCK;
  logic [3:0]                 ARCACHE;
  logic [2:0]                 ARPROT;
  logic                       ARVALID;
  logic                       ARREADY;
// ARCACHE, ARLOCK, ARPROT missing

// ============================================================================
// READ DATA CHANNEL (Slave to Master)
// ============================================================================
  logic [3:0]                 RID;      // AXI4 Only
  logic [DATA_WIDTH-1:0]      RDATA;
  logic [1:0]                 RRESP;
  logic                       RLAST;    // AXI4 Only
  logic                       RVALID;
  logic                       RREADY;

endinterface