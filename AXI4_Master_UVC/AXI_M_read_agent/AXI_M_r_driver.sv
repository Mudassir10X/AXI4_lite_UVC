class AXI_M_r_driver extends uvm_driver #(AXI_M_r_txn);

  `uvm_component_utils(AXI_M_r_driver)
  
  // declaring virual interface
  virtual interface AXI4_if vif;

  // Declare this property to count packets sent
  int num_sent;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Driver", "Inside AXI_M_r_driver build_phase", UVM_LOW)
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
    `uvm_info("Driver", "Inside AXI_M_r_driver run_phase", UVM_LOW)
    forever begin
      AXI_M_r_txn txn;
      seq_item_port.get_next_item(txn);
      `uvm_info(get_type_name(), "Master Driving sequence", UVM_LOW);
      drive(txn);
      this.end_tr(rsp);
      seq_item_port.item_done();
    end
  endtask

  task drive(AXI_M_r_txn pkt);
    @(negedge vif.ACLK);
    // Drive READ Address Channel (AR)
    vif.ARADDR  <= pkt.ARADDR;
    vif.ARVALID <= pkt.ARVALID;
    wait(vif.ARREADY == 1);
    @(posedge vif.ACLK);
    
    // Deassert ARVALID after handshake
    vif.ARVALID <= 0;

    // Drive READ Data Channel (R)
    vif.RREADY  <= pkt.RREADY;
    
    wait(vif.RVALID == 1);
    @(posedge vif.ACLK);

    // Deassert RREADY after handshake
    vif.RREADY <= 0;
  endtask
endclass