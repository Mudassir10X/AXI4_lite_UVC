#!/bin/csh

source ~/cshrc

# xrun -access +rwc -uvm -f ../top/file.f \
#     +UVM_TESTNAME=AXI_test \
#     -top tb_top \
#     -log_xmelab xmelab.log \
#     -log_xmsim xmsim.log \
#     -timescale 1ns/1ns \
#     +SVSEED=random \
#     +UVM_VERBOSITY=UVM_FULL #-gui

xrun -access +rwc -uvm -f \
    ../top/file.f \
    +UVM_TESTNAME=AXI_test_S_r_stall \
    -top tb_top \
    -log_xmelab xmelab.log \
    -log_xmsim xmsim.log \
    -timescale 1ns/1ns \
    +SVSEED=random \
    +UVM_VERBOSITY=UVM_HIGH \
    -input restore.tcl

# Test Names:
# AXI_test_write
# AXI_test_read
# AXI_test_concurrent_rw
# AXI_test_concurrent_AW_W
# AXI_test_S_w_stall
# AXI_test_S_r_stall