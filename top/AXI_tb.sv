`include "uvm_macros.svh"
import uvm_pkg::*;       
import AXI_S_pkg::*;
import AXI_M_pkg::*;         
class AXI_tb extends uvm_env;
    `uvm_component_utils(AXI_tb)

    AXI_M_env env_m;
    AXI_S_env env_s;

    function new(string name = "AXI_tb", uvm_component parent);
        super.new(name, parent);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("TB", "Inside AXI_TB build_phase", UVM_LOW)
        env_m = AXI_M_env::type_id::create("env_m", this);
        env_s = AXI_S_env::type_id::create("env_s", this);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        // uvm_top.print_topology();
    endfunction // end_of_elaboration_phase

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction
endclass //AXI_tb extends uvm_env