class axi_lite_slave_monitor extends uvm_monitor;

  `uvm_component_utils(axi_lite_slave_monitor)

  function new(string name, uvm_component parent);

    super.new(name, parent);

  endfunction

  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    `uvm_info("Slave_monitor", "Inside axi_lite_slave_monitor build_phase", UVM_LOW)

  endfunction

  task run_phase(uvm_phase phase);

    `uvm_info("Slave_monitor", "Inside axi_lite_slave_monitor run_phase", UVM_LOW)

  endtask
endclass
