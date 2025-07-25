`include "uvm_macros.svh"
import uvm_pkg::*;   
import AXI_S_pkg::*;
import AXI_M_pkg::*;   
class AXI_test extends uvm_test;

  `uvm_component_utils(AXI_test)

  AXI_tb tb;
  
  // declare the objection object
  uvm_objection obj;

  function new(string name = "AXI_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST", "Inside AXI_test build_phase", UVM_LOW)
    tb = AXI_tb::type_id::create("tb", this);
    uvm_config_int::set(this, "*", "recording_detail", UVM_FULL);
    // uvm_config_wrapper::set(this, "tb.env_m.write_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_M_w_seq_base::get_type());
    // uvm_config_wrapper::set(this, "tb.env_m.write_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_M_w_seq_1clk::get_type());
    // uvm_config_wrapper::set(this, "tb.env_s.write_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_S_w_seq_base::get_type());
    // uvm_config_wrapper::set(this, "tb.env_m.read_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_M_r_seq_base::get_type());
    // uvm_config_wrapper::set(this, "tb.env_s.read_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_S_r_seq_base::get_type());
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction // end_of_elaboration_phase

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("TEST", "Inside AXI_test run_phase", UVM_LOW)
    obj = phase.get_objection();
    obj.set_drain_time(this, 20ns);
  endtask
endclass

class AXI_test_write extends AXI_test;

  `uvm_component_utils(AXI_test_write)

  function new(string name = "AXI_test_write", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST", "Inside AXI_test_write build_phase", UVM_LOW)
    uvm_config_int::set(this, "*", "recording_detail", UVM_FULL);
    uvm_config_wrapper::set(this, "tb.env_m.write_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_M_w_seq_1clk::get_type());
    uvm_config_wrapper::set(this, "tb.env_s.write_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_S_w_seq_base::get_type());
    // uvm_config_wrapper::set(this, "tb.env_m.read_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_M_r_seq_base::get_type());
    // uvm_config_wrapper::set(this, "tb.env_s.read_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_S_r_seq_base::get_type());
  endfunction
endclass
class AXI_test_read extends AXI_test;

  `uvm_component_utils(AXI_test_read)

  function new(string name = "AXI_test_read", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST", "Inside AXI_test_read build_phase", UVM_LOW)
    uvm_config_int::set(this, "*", "recording_detail", UVM_FULL);
    // uvm_config_wrapper::set(this, "tb.env_m.write_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_M_w_seq_base::get_type());
    // uvm_config_wrapper::set(this, "tb.env_s.write_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_S_w_seq_base::get_type());
    uvm_config_wrapper::set(this, "tb.env_m.read_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_M_r_seq_base::get_type());
    uvm_config_wrapper::set(this, "tb.env_s.read_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_S_r_seq_base::get_type());
  endfunction
endclass

class AXI_test_concurrent_rw extends AXI_test;

  `uvm_component_utils(AXI_test_concurrent_rw)

  function new(string name = "AXI_test_concurrent_rw", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST", "Inside AXI_test_concurrent_rw build_phase", UVM_LOW)
    uvm_config_int::set(this, "*", "recording_detail", UVM_FULL);
    uvm_config_wrapper::set(this, "tb.env_m.write_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_M_w_seq_1clk::get_type());
    uvm_config_wrapper::set(this, "tb.env_s.write_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_S_w_seq_base::get_type());
    uvm_config_wrapper::set(this, "tb.env_m.read_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_M_r_seq_base::get_type());
    uvm_config_wrapper::set(this, "tb.env_s.read_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_S_r_seq_base::get_type());
  endfunction
endclass

class AXI_test_concurrent_AW_W extends AXI_test;

  `uvm_component_utils(AXI_test_concurrent_AW_W)

  function new(string name = "AXI_test_concurrent_AW_W", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST", "Inside AXI_test_concurrent_AW_W build_phase", UVM_LOW)
    uvm_config_int::set(this, "*", "recording_detail", UVM_FULL);
    uvm_config_wrapper::set(this, "tb.env_m.write_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_M_w_seq_base::get_type());
    uvm_config_wrapper::set(this, "tb.env_s.write_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_S_w_seq_base::get_type());
    // uvm_config_wrapper::set(this, "tb.env_m.read_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_M_r_seq_base::get_type());
    // uvm_config_wrapper::set(this, "tb.env_s.read_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_S_r_seq_base::get_type());
  endfunction
endclass

class AXI_test_S_w_stall extends AXI_test;

  `uvm_component_utils(AXI_test_concurrent_AW_W)

  function new(string name = "AXI_test_S_w_stall", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST", "Inside AXI_test_S_w_stall build_phase", UVM_LOW)
    uvm_config_int::set(this, "*", "recording_detail", UVM_FULL);
    uvm_config_wrapper::set(this, "tb.env_m.write_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_M_w_seq_base::get_type());
    uvm_config_wrapper::set(this, "tb.env_s.write_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_S_w_seq_1clk::get_type());
    // uvm_config_wrapper::set(this, "tb.env_m.read_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_M_r_seq_base::get_type());
    // uvm_config_wrapper::set(this, "tb.env_s.read_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_S_r_seq_base::get_type());
  endfunction
endclass

class AXI_test_S_r_stall extends AXI_test;

  `uvm_component_utils(AXI_test_S_r_stall)

  function new(string name = "AXI_test_S_r_stall", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST", "Inside AXI_test_S_r_stall build_phase", UVM_LOW)
    uvm_config_int::set(this, "*", "recording_detail", UVM_FULL);
    // uvm_config_wrapper::set(this, "tb.env_m.write_agent.seq.run_phase",
    //                                 "default_sequence",
    //                                 AXI_M_w_seq_base::get_type());
    // uvm_config_wrapper::set(this, "tb.env_s.write_agent.seq.run_phase",
    //                                 "default_sequence",
                                    // AXI_S_w_seq_base::get_type());
    uvm_config_wrapper::set(this, "tb.env_m.read_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_M_r_seq_base::get_type());
    uvm_config_wrapper::set(this, "tb.env_s.read_agent.seq.run_phase",
                                    "default_sequence",
                                    AXI_S_r_seq_1clk::get_type());
  endfunction
endclass
