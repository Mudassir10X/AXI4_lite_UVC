class AXI_S_r_driver extends uvm_driver #(AXI_S_r_txn);

  `uvm_component_utils(AXI_S_r_driver)
  
  // declREADARREADYing virual interface
  virtual interface AXI4_if vif;

  // Declare this property to count packets sent
  int num_sent;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Driver", "Inside AXI_S_r_driver build_phase", UVM_LOW)
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (!uvm_config_db#(virtual AXI4_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal(get_type_name(), "NO-VIF")
    end
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info("Driver", "Inside AXI_S_r_driver run_phase", UVM_LOW)
    forever begin
      AXI_S_r_txn txn;
      seq_item_port.get_next_item(txn);
      drive(txn);
      this.end_tr(rsp);
      seq_item_port.item_done();
    end
  endtask

  task drive(AXI_S_r_txn pkt);
    // Wait for reset deassertion
    @(negedge vif.ACLK);
    wait(vif.ARESETn == 1);
    // Drive Read Address Channel (AR)
    vif.ARREADY <= pkt.ARREADY;
    wait(vif.ARVALID == '1);
    @(posedge vif.ACLK);
    
    // Deassert ARVALID after handshake
    vif.ARREADY <= 0;

    // Drive Read Data Channel (R)
    vif.RDATA <= pkt.RDATA;
    vif.RVALID <= pkt.RVALID;

    wait(vif.RREADY == '1);
    @(posedge vif.ACLK);

    // Deassert WREADY after handshake
    vif.RVALID <= 0;
  endtask
endclass