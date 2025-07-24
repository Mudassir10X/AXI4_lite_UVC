
# XM-Sim Command File
# TOOL:	xmsim(64)	23.09-s006
#
#
# You can restore this configuration with:
#
#      xrun -access +rwc -uvm -f ../top/file.f +UVM_TESTNAME=AXI_test -top tb_top -log_xmelab xmelab.log -log_xmsim xmsim.log -timescale 1ns/1ns +SVSEED=random +UVM_VERBOSITY=UVM_HIGH -input restore.tcl
#

set tcl_prompt1 {puts -nonewline "xcelium> "}
set tcl_prompt2 {puts -nonewline "> "}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 1
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 1
set tcl_all64 false
set tcl_runerror_exit false
set assert_report_incompletes 0
set show_force 1
set force_reset_by_reinvoke 0
set tcl_relaxed_literal 0
set probe_exclude_patterns {}
set probe_packed_limit 4k
set probe_unpacked_limit 16k
set assert_internal_msg no
set svseed -1871875788
set assert_reporting_mode 0
set vcd_compact_mode 0
set vhdl_forgen_loopindex_enum_pos 0
set tcl_sigval_prefix {#}
alias . run
alias indago verisium
alias quit exit
scope -set tb_top
stop -create -name {1:ed6ac7ee:uvm} -object cdns_uvm_pkg::cdns_uvm_data_valid -if {#cdns_uvm_pkg::uvm_break_phase == "run" && #cdns_uvm_pkg::uvm_phase_is_start == 1}
stop -create -name Randomize -randomize
database -open -shm -into waves.shm waves -default
probe -create -database waves tb_top.axi_if.ACLK tb_top.axi_if.ARESETn tb_top.axi_if.AWADDR tb_top.axi_if.AWREADY tb_top.axi_if.AWVALID tb_top.axi_if.WDATA tb_top.axi_if.WREADY tb_top.axi_if.WVALID tb_top.axi_if.ARADDR tb_top.axi_if.ARREADY tb_top.axi_if.ARVALID tb_top.axi_if.RDATA tb_top.axi_if.RREADY tb_top.axi_if.RVALID

simvision -input restore.tcl.svcf
