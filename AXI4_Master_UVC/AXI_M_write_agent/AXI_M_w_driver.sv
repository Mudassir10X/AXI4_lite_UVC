class AXI_M_w_driver extends uvm_driver #(AXI_M_w_txn);

  `uvm_component_utils(AXI_M_w_driver)
  
  // declaring virual interface
  virtual interface AXI4_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Driver", "Inside AXI_M_w_driver build_phase", UVM_LOW)
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info("Driver", "Inside AXI_M_w_driver run_phase", UVM_LOW)
    forever begin
      AXI_M_w_txn txn;
      seq_item_port.get_next_item(txn);
      `uvm_info("DRV_AXI_M_w", "Master Driving sequence", UVM_LOW);
      // drive();
      seq_item_port.item_done();
    end
  endtask

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (!uvm_config_db#(virtual AXI4_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal(get_type_name(), "NO-VIF")
    end
  endfunction

  // task drive();
  //       fork
  //           // write address channel
  //           begin
  //               vif.AWVALID <= 1;
  //               vif.AWADDR <= axi_inst.AWaddr;
  //               wait(vif.AWREADY==1);
  //               vif.AWVALID <= 0;
  //           end
            
  //           // write data channel
  //           begin
  //               vif.WVALID <= 1;
  //               vif.WDATA <= axi_inst.WDATA;
  //               wait(vif.WREADY==1);
  //               vif.WVALID <= 0;
  //           end

  //           // response channel
  //           begin
  //               vif.BREADY <= 1;
  //               wait(vif.BVALID==1);
  //               vif.BREADY <= 0;
  //           end
  //       join
  //           @(posedge vif.clk);
  //   endtask

endclass