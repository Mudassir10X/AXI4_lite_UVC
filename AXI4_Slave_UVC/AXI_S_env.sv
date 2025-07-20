class AXI_S_env extends uvm_env;

    AXI_S_r_agent  read_agent;
    AXI_S_w_agent  write_agent;

   `uvm_component_utils(AXI_S_env)
   
    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction //new()


    function void build_phase(uvm_phase phase);

        super.build_phase(phase);

        `uvm_info("Environment", "Inside AXI_S_w_env build_phase", UVM_LOW)

        read_agent = AXI_S_r_agent::type_id::create("read_agent", this);
        write_agent = AXI_S_w_agent::type_id::create("write_agent", this);


    endfunction
    
endclass //AXI_S_env extends uvm_env