class AXI_M_env extends uvm_env;

    AXI_M_r_agent  read_agent;
    AXI_M_w_agent  write_agent;

   `uvm_component_utils(AXI_M_env)
   
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("ENV", "Inside AXI_M_env build_phase", UVM_LOW)
        // Creating the R/W Agents
        read_agent = AXI_M_r_agent::type_id::create("read_agent", this);
        write_agent = AXI_M_w_agent::type_id::create("write_agent", this);
    endfunction

    function void start_of_simulation_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "Now in the start of simulation phase for env", UVM_HIGH)        
    endfunction
    
endclass //AXI_M_env extends uvm_env