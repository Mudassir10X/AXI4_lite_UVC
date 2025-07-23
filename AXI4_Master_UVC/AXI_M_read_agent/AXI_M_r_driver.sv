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
    `uvm_info("Driver", "Inside AXI_M_r_driver run_phase", UVM_LOW)
    forever begin
      AXI_M_r_txn txn;
      seq_item_port.get_next_item(txn);
      `uvm_info("DRV_AXI_M_r", "", UVM_LOW);
      // drive();
      seq_item_port.item_done();
    end
  endtask

  // task drive();
  //   // Wait for reset deassertion
  //   @(posedge vif.ACLK);
  //   wait(vif.ARESETn == 1);

  //   // Drive Write Address Channel (AW)
  //   vif.ARADDR  <= txn.ARADDR;
  //   vif.ARVALID <= txn.ARVALID;
  //   @(posedge vif.ACLK);
  //   wait(vif.ARREADY == 1);

  //   // Deassert ARVALID after handshake
  //   vif.ARVALID <= 0;
    
  //   // Drive Read Data Channel (R)
  //   // vif.RDATA  <= txn.RDATA;
  //   // vif.RVALID <= txn.RVALID;
  //   vif.RREADY <= 1;
  //   @(posedge vif.ACLK);
    
  //   // Wait for Data to be valid on the Read channel before deasserting RREADY
  //   wait(vif.RVALID == 1)
  //   vif.RREADY <= 0;
  // endtask
endclass