class AXI_S_w_driver extends uvm_driver #(AXI_S_w_txn);

  `uvm_component_utils(AXI_S_w_driver)
  
  // declaring virual interface
  virtual interface AXI4_if vif;

  // Declare this property to count packets sent
  int num_sent;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Driver", "Inside AXI_S_w_driver build_phase", UVM_LOW)
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
    `uvm_info("Driver", "Inside AXI_S_w_driver run_phase", UVM_LOW)
    forever begin
      AXI_S_w_txn txn;
      seq_item_port.get_next_item(txn);
      drive(txn);
      this.end_tr(rsp);
      seq_item_port.item_done();
    end
  endtask

  task drive(AXI_S_w_txn pkt);
    fork
      begin
        repeat (pkt.clk_dly_AW) @(negedge vif.ACLK);
        // Drive Write Address Channel (AW)
        vif.AWREADY <= pkt.AWREADY;
        wait(vif.AWVALID == '1);
        @(posedge vif.ACLK);
        
        // Deassert AWVALID after handshake
        vif.AWREADY <= 0;
      end

      begin
        repeat (pkt.clk_dly_W) @(negedge vif.ACLK);
        // Drive Write Data Channel (W)
        vif.WREADY <= pkt.WREADY;

        wait(vif.WVALID == '1);
        @(posedge vif.ACLK);

        // Deassert WVALID after handshake
        vif.WREADY <= 0;
      end
    join
  endtask
endclass
