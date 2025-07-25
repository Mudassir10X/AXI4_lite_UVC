class AXI_S_w_monitor extends uvm_monitor;

  `uvm_component_utils(AXI_S_w_monitor)
  
  // declaring virual interface
  virtual interface AXI4_if vif;

  // Collected Data handle
  AXI_S_w_txn pkt;

  // Count packets collected
  int num_pkt_col;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Monitor", "Inside AXI_S_w_monitor build_phase", UVM_LOW)
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (!uvm_config_db#(virtual AXI4_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal(get_type_name(), "NO-VIF")
    end
  endfunction

  task run_phase(uvm_phase phase);
      // Wait for reset deassertion
    wait(vif.ARESETn == 1);
    `uvm_info("Monitor", "Inside AXI_S_w_monitor run_phase", UVM_LOW)
    collect_pkt();
  endtask

  task collect_pkt();
    forever begin
      @(posedge vif.ACLK);

      // Wait for AWVALID and AWREADY handshake
      if (vif.AWVALID && vif.AWREADY) begin
        pkt = AXI_S_w_txn::type_id::create("pkt");
        pkt.AWADDR  = vif.AWADDR;
        pkt.AWVALID = vif.AWVALID;
        pkt.AWREADY = vif.AWREADY;

        // Wait for WVALID and WREADY handshake
        if (vif.WVALID && vif.WREADY) begin
          pkt.WDATA  = vif.WDATA;
          pkt.WVALID = vif.WVALID;
          pkt.WREADY = vif.WREADY;

          num_pkt_col++;
          `uvm_info(get_type_name(), $sformatf("transaction %0d collected :\n%s", num_pkt_col, pkt.sprint()), UVM_LOW);
        end
      end
    end
  endtask
endclass
