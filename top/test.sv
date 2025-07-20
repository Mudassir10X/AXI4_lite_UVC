class axi_lite_test extends uvm_test;

  `uvm_component_utils(axi_lite_test)

  axi_lite_env env;

  function new(string name = "axi_lite_test", uvm_component parent = null);

    super.new(name, parent);

  endfunction

  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    `uvm_info("TEST", "Inside axi_lite_test build_phase", UVM_LOW)

    env = axi_lite_env::type_id::create("env", this);

  endfunction

  task run_phase(uvm_phase phase);

    `uvm_info("TEST", "Inside axi_lite_test run_phase", UVM_LOW)
    
    phase.raise_objection(this);

 
    #100ns;

    phase.drop_objection(this);
  endtask
endclass
