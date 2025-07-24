#!/bin/csh

source ~/cshrc

xrun -access +rwc -uvm -f ../top/file.f \
    +UVM_TESTNAME=AXI_test \
    -top tb_top \
    -log_xmelab xmelab.log \
    -log_xmsim xmsim.log \
    -timescale 1ns/1ns \
    +SVSEED=random \
    +UVM_VERBOSITY=UVM_FULL #-gui

# xrun -access +rwc -uvm -f \
#     ../top/file.f \
#     +UVM_TESTNAME=AXI_test \
#     -top tb_top \
#     -log_xmelab xmelab.log \
#     -log_xmsim xmsim.log \
#     -timescale 1ns/1ns \
#     +SVSEED=random \
#     +UVM_VERBOSITY=UVM_HIGH \
#     -input restore.tcl